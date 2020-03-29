import { ApiTags } from '@nestjs/swagger';
import { Controller, Get, Post, Body, Delete, Param } from '@nestjs/common';
import { QrCodeService } from './qr-code.service';
import { CreateQRCodeDTO } from '@src/shared/dtos/create-qr-code.dto';
import { QRCode } from '@src/entity/qr-code.entity';

@Controller('qr-codes')
@ApiTags('qr-codes')
export class QrCodeController {
  constructor(private readonly qrCodeService: QrCodeService) {}

  @Get()
  getAll() {
    return this.qrCodeService.findAll();
  }

  @Get(':id')
  async getOne(@Param('id') id: string): Promise<any> {
    return await this.qrCodeService.findOne(id);
  }

  @Post()
  create(@Body() createQRCodeDTO: CreateQRCodeDTO): Promise<QRCode> {
    return this.qrCodeService.create(createQRCodeDTO);
  }
}
