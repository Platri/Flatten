import { HealthLogbookPagination } from './dto/health-logbook-pagination.dto';
import { Injectable } from '@nestjs/common';
import { HealthLogbookEntry } from '@src/health-logbook/healthLogbook.model';
import { CreateHealthLogbookEntryDto } from '@src/shared/dtos/healthLogbook.dto';
import { HealthLogbook } from '@src/entity/health-logbook.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Between } from 'typeorm';
import { QrCodeService } from '@src/qr-code/qr-code.service';
import { format } from 'date-fns';

@Injectable()
export class HealthLogbookService {
	fakeHealthLogbookEntry: HealthLogbookEntry;
	error = false;

	constructor(
		@InjectRepository(HealthLogbook) private readonly healthLogbookRepository: Repository<HealthLogbook>,
		private qrCodeService: QrCodeService
	) {}

	async createLogbookEntry(createHealthLogbookEntryDto: CreateHealthLogbookEntryDto): Promise<HealthLogbookEntry> {
		// Post entry to repository
		const healthLogbookEntry = new HealthLogbook();
		healthLogbookEntry.headache = createHealthLogbookEntryDto.headache;
		healthLogbookEntry.bodyTemperature = createHealthLogbookEntryDto.bodyTemperature;
		healthLogbookEntry.cough = createHealthLogbookEntryDto.cough;

		const qrCode = this.qrCodeService.findOne(createHealthLogbookEntryDto.qrCodeId);

		healthLogbookEntry.qrCode = await qrCode;
		return this.healthLogbookRepository.save(healthLogbookEntry);
	}

	async findAll(): Promise<HealthLogbookEntry[]> {
		return await this.healthLogbookRepository.find();
	}

	private ISOToDBDate(isoDate: string) {
		return format(new Date(isoDate), 'yyyy-MM-dd kk:mm:ss.SSS');
	}

	async getLogbook(
		qrCodeId: string,
		pageNumber: number,
		pageSize: number,
		startDate: Date,
		endDate: Date
	): Promise<HealthLogbookPagination> {
		// Get healthLogbook of user from repository via jwt

		const take = pageSize || 10;
		const skip = pageNumber * pageSize || 0;
		const keyword = qrCodeId;
		const betweenDates = Between(
			this.ISOToDBDate(startDate.toISOString()),
			this.ISOToDBDate(endDate.toISOString())
		);

		const [ result, total ] = await this.healthLogbookRepository.findAndCount({
			where: [
				{
					qrCodeId: keyword,
					createDateTime: betweenDates
				}
			],
			take: take,
			skip: skip
		});

		const paginationData: HealthLogbookPagination = {
			healthLogbookData: result,
			count: total,
			limit: take,
			page: pageNumber,
			startDate: startDate,
			endDate: endDate
		};
		return paginationData;
	}
}
