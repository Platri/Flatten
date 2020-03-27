import { ApiTags } from '@nestjs/swagger';
import {
  Controller,
  Get,
  NotFoundException,
  Post,
  Query,
} from '@nestjs/common';
import { QrCodeService } from './qr-code.service';
import { QrCodeInterface } from './qr-code.interface';

@Controller('qr-code')
@ApiTags('qr-code')
export class QrCodeController {
  constructor(private readonly qrCodeService: QrCodeService) {}

  @Get()
  getScan(@Query('id') id) {
    /*
        QR Code ID has an min and max length of 16 characters.
         */
    if (id.length === 36) {
      return this.qrCodeService.getQRCode(id);
    } else {
      throw new NotFoundException('Scanned QR-Code is incorrect.');
    }
  }

  @Post()
  create(): QrCodeInterface {
    return this.qrCodeService.createQRCode();
  }
}
