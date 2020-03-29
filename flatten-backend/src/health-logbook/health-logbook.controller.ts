import { Body, Controller, Get, Param, Post, Query } from '@nestjs/common';
import { HealthLogbookService } from '@src/health-logbook/health-logbook.service';
import { HealthLogbookEntry } from '@src/health-logbook/healthLogbook.model';
import { ApiTags } from '@nestjs/swagger';
import {
  CreateHealthLogbookEntryDto,
  GetHealthLogbookListDto,
} from '@src/shared/dtos/healthLogbook.dto';
import { HealthLogbook } from '@src/entity/health-logbook.entity';
import { PaginationDto } from '@src/shared/dtos/pagination.dto';

@Controller('health-logbooks')
@ApiTags('health-logbooks')
export class HealthLogbookController {
  constructor(private healthLogbookService: HealthLogbookService) {}

  @Get(':qrId')
  async getLogbook(
    @Param('qrId') qrId: string,
    @Query('page') page = 0,
    @Query('pageSize') pageSize = 0,
  ): Promise<PaginationDto<GetHealthLogbookListDto>> {
    console.log('abcd');
    return await this.healthLogbookService.getLogbook(qrId, page, pageSize);
  }

  @Get()
  async getAll(): Promise<HealthLogbookEntry[]> {
    console.log('cd');
    return await this.healthLogbookService.findAll();
  }

  @Post()
  async createLogbookEntry(
    @Body() dto: CreateHealthLogbookEntryDto,
  ): Promise<HealthLogbookEntry> {
    return await this.healthLogbookService.createLogbookEntry(dto);
  }
}
