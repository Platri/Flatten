import { Body, Controller, Get, Post, Query } from '@nestjs/common';
import { HealthLogbookService } from '@src/health-logbook/health-logbook.service';
import {
  HealthLogbookEntry,
  HealthLogbook,
} from '@src/health-logbook/healthLogbook.model';
import { ApiTags } from '@nestjs/swagger';

@Controller('health-logbook')
@ApiTags('health-logbook')
export class HealthLogbookController {
  constructor(private healthLogbookService: HealthLogbookService) {}

  @Get()
  getLogbookEntry(@Query('id') id): HealthLogbookEntry {
    return this.healthLogbookService.getLogbookEntry(id);
  }

  @Get()
  getLogbook(): HealthLogbook {
    return this.healthLogbookService.getLogbook();
  }

  @Post()
  createLogbookEntry(
    @Body() healthLogbookEntry: HealthLogbookEntry,
  ): HealthLogbookEntry {
    return this.healthLogbookService.createLogbookEntry(healthLogbookEntry);
  }
}
