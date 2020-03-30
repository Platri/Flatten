import { ResponseQRCodeDto } from './../shared/dtos/qr-code.dto';
import { ApiTags, ApiResponse } from '@nestjs/swagger';
import { Controller, Get, Post, Body, Param } from '@nestjs/common';
import { QrCodeService } from './qr-code.service';
import { CreateQRCodeDTO } from '@src/shared/dtos/qr-code.dto';
import { QRCode } from '@src/entity/qr-code.entity';

@Controller('qr-codes')
@ApiTags('qr-codes')
export class QrCodeController {
  constructor(private readonly qrCodeService: QrCodeService) {}

  @Get()
  @ApiResponse({status: 200, description: 'The resource list has been successfuly returned.', type: ResponseQRCodeDto})
  async getAll(): Promise<any[]> {
    return await this.qrCodeService.findAll();
  }

  @Get(':id')
  @ApiResponse({status: 200, description: 'The resource has been successfuly returned.', type: ResponseQRCodeDto})
  async getOne(@Param('id') id: string): Promise<any> {
    return await this.qrCodeService.findOne(id);
  }

  @Post()
  @ApiResponse({status: 201, description: 'The resource list has been successfuly created.'})
  create(@Body() createQRCodeDTO: CreateQRCodeDTO): Promise<QRCode> {
    return this.qrCodeService.create(createQRCodeDTO);
  }
}
