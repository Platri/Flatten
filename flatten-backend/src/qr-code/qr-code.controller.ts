import { ApiTags } from '@nestjs/swagger';
import {
  Controller,
  Get,
  NotFoundException,
  Post,
  Query,
  Body,
} from '@nestjs/common';
import { QrCodeService } from './qr-code.service';
import { CreateQRCodeDTO } from '@src/shared/dtos/create-qr-code.dto';
import { QRCode } from '@src/entity/qr-code.entity';

@Controller('qr-code')
@ApiTags('qr-code')
export class QrCodeController {
  constructor(private readonly qrCodeService: QrCodeService) { }

  @Get()
  getallQrCodes() {
    return this.qrCodeService.findAll();
  }

  @Post()
  create(@Body() createQRCodeDTO: CreateQRCodeDTO): Promise<QRCode> {
    return this.qrCodeService.createQRCode(createQRCodeDTO);
  }
}
