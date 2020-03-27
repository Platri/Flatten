import { Module } from '@nestjs/common';
import { QrCodeController } from "./qr-code.controller";
import { QrCodeService } from "./qr-code.service";
import { TypeOrmModule } from '@nestjs/typeorm';
import { QRCode } from '@src/entity/qr-code.entity';


@Module({
    imports: [TypeOrmModule.forFeature([QRCode])],
    controllers: [QrCodeController],
    providers: [QrCodeService],
})
export class QrCodeModule { }
