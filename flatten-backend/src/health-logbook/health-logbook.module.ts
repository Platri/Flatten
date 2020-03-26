import { Module } from '@nestjs/common';
import { HealthLogbookController } from './health-logbook.controller';
import { HealthLogbookService } from './health-logbook.service';

@Module({
  controllers: [HealthLogbookController],
  providers: [HealthLogbookService]
})
export class HealthLogbookModule {}
