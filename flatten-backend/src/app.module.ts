import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import {QrCodeModule} from "./qr-code/qr-code.module";
import { HealthLogbookModule } from './health-logbook/health-logbook.module';

@Module({
  imports: [QrCodeModule, HealthLogbookModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
