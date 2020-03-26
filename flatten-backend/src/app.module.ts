import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { QrCodeModule } from "./qr-code/qr-code.module";
import { HealthLogbookModule } from './health-logbook/health-logbook.module';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: '127.0.0.1',
      port: 5432,
      username: 'postgres',
      password: 'postgres',
      database: 'flatten_database',
      entities: [],
      synchronize: true,
    }),
    QrCodeModule,
    HealthLogbookModule
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
