import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';

import { QrCodeModule } from "./qr-code/qr-code.module";
import { HealthLogbookModule } from './health-logbook/health-logbook.module';
//import { TypeOrmModule } from '@nestjs/typeorm';
/*
@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'localhost',
      port: 3306,
      username: 'root',
      password: 'root',
      database: 'test',
      entities: [],
      synchronize: true,
    }),
    QrCodeModule,
    HealthLogbookModule
  ],

import {QrCodeModule} from "./qr-code/qr-code.module"; */

@Module({
  imports: [QrCodeModule, HealthLogbookModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
