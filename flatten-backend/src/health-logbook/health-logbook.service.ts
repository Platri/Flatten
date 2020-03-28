import {Injectable, NotFoundException} from '@nestjs/common';
import {Cough, HealthLogbookEntry} from "@src/health-logbook/healthLogbook.model";
import {CreateHealthLogbookEntryDto, GetHealthLogbookListDto} from "@src/shared/dtos/healthLogbook.dto";
import {HealthLogbook} from "@src/entity/health-logbook.entity";
import {InjectRepository} from "@nestjs/typeorm";
import {Repository} from "typeorm";
import {QrCodeService} from "@src/qr-code/qr-code.service";
import {TemporaryCode} from "@src/entity/temporary-code.entity";
import {PaginationDto} from "@src/shared/dtos/pagination.dto";


@Injectable()
export class HealthLogbookService {
    fakeHealthLogbookEntry: HealthLogbookEntry;
    error= false;

    constructor(
        @InjectRepository(HealthLogbook)
        private readonly healthLogbookRepository: Repository<HealthLogbook>,

        private qrCodeService: QrCodeService
    ) {
    }

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

    async getLogbook(qrCodeId: string, pageNumber: number, pageSize: number): Promise<PaginationDto<GetHealthLogbookListDto>> {
        // Get healthLogbook of user from repository via jwt
        console.log(qrCodeId);
        console.log(pageSize);

        const take = pageSize || 10;
        const skip = pageNumber * 10 || 0;
        const keyword = qrCodeId;

        console.log(skip);

        const [result, total] = await this.healthLogbookRepository.findAndCount(
            {
                where: { where: { keyword } },
                take: take,
                skip: skip
            });

        const paginationData: PaginationDto<GetHealthLogbookListDto> = {data: result, count: total, limit: take, page: pageNumber};
            return paginationData;
    }
}
