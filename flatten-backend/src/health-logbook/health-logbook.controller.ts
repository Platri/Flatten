import { Body, Controller, Get, Param, Post, Query } from '@nestjs/common';
import { HealthLogbookService } from '@src/health-logbook/health-logbook.service';
import { HealthLogbookEntry } from '@src/health-logbook/healthLogbook.model';
import { ApiTags, ApiResponse } from '@nestjs/swagger';
import {
  CreateHealthLogbookEntryDto,
  GetHealthLogbookListDto,
  ResponseHealthLogbookDTO,
} from '@src/shared/dtos/healthLogbook.dto';
import { PaginationDto } from '@src/shared/dtos/pagination.dto';

@Controller('health-logbooks')
@ApiTags('health-logbooks')
export class HealthLogbookController {
  constructor(private healthLogbookService: HealthLogbookService) {}

  @Get(':qrId')
  @ApiResponse({status: 200, description: 'The resource has been successfuly returned.', type: ResponseHealthLogbookDTO})
  async getLogbook(
    @Param('qrId') qrId: string,
    @Query('page') page = 0,
    @Query('pageSize') pageSize = 0,
  ): Promise<PaginationDto<GetHealthLogbookListDto>> {
    return await this.healthLogbookService.getLogbook(qrId, page, pageSize);
  }

  @Get()
  @ApiResponse({status: 200, description: 'The resource list has been successfuly created.', type: ResponseHealthLogbookDTO})
  async getAll(): Promise<HealthLogbookEntry[]> {
    return await this.healthLogbookService.findAll();
  }

  @Post()
  @ApiResponse({status: 201, description: 'The resource list has been successfuly created.'})
  async createLogbookEntry(
    @Body() dto: CreateHealthLogbookEntryDto,
  ): Promise<HealthLogbookEntry> {
    return await this.healthLogbookService.createLogbookEntry(dto);
  }
}
