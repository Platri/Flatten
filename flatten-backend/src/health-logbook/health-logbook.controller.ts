import { HealthLogbookPagination } from './dto/health-logbook-pagination.dto';
import { Body, Controller, Get, Param, Post, Query } from '@nestjs/common';
import { HealthLogbookService } from '@src/health-logbook/health-logbook.service';
import { HealthLogbookEntry } from '@src/health-logbook/healthLogbook.model';
import { ApiTags, ApiQuery, ApiOkResponse } from '@nestjs/swagger';
import { CreateHealthLogbookEntryDto } from '@src/shared/dtos/healthLogbook.dto';

@Controller('health-logbooks')
@ApiTags('health-logbooks')
export class HealthLogbookController {
	constructor(private healthLogbookService: HealthLogbookService) {}

	@Get(':qrId')
	@ApiQuery({
		name: 'startDate',
		required: false,
		description: 'Start date for query request. Default: current date.',
		example: '2020-03-30T09:12:12.000Z'
	})
	@ApiQuery({
		name: 'endDate',
		required: false,
		description: 'End date for query request. Default: current date.',
		example: '2020-03-30T09:12:12.000Z'
	})
	@ApiQuery({ name: 'page', required: false, description: 'Page to start from. Default: 0', example: 0 })
	@ApiQuery({ name: 'size', required: false, description: 'Size of page|array. Default: 10', example: 25 })
	@ApiOkResponse({
		description: 'List of Health Logbook Data matching query params.',
		type: HealthLogbookPagination
	})
	async getLogbook(
		@Param('qrId') qrId: string,
		@Query('startDate') startDate: Date = new Date(),
		@Query('endDate') endDate: Date = new Date(),
		@Query('page') page = 0,
		@Query('size') size = 10
	): Promise<HealthLogbookPagination> {
		// casting query params
		return await this.healthLogbookService.getLogbook(qrId, +page, +size, new Date(startDate), new Date(endDate));
	}

	@Get()
	async getAll(): Promise<HealthLogbookEntry[]> {
		return await this.healthLogbookService.findAll();
	}

	@Post()
	async createLogbookEntry(@Body() dto: CreateHealthLogbookEntryDto): Promise<HealthLogbookEntry> {
		return await this.healthLogbookService.createLogbookEntry(dto);
	}
}
