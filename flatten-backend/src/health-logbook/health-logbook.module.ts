import { Module } from '@nestjs/common';
import { HealthLogbookController } from './health-logbook.controller';
import { HealthLogbookService } from './health-logbook.service';
import {TypeOrmModule} from "@nestjs/typeorm";
import {QrCodeModule} from "@src/qr-code/qr-code.module";
import {HealthLogbook} from "@src/entity/health-logbook.entity";

@Module({
  imports: [TypeOrmModule.forFeature([HealthLogbook]),
  QrCodeModule],
  controllers: [HealthLogbookController],
  providers: [HealthLogbookService]
})
export class HealthLogbookModule {}
