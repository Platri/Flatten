import { ApiTags } from '@nestjs/swagger';
import { Body, Controller, Get, Post } from '@nestjs/common';
import { TemporaryCodeService } from '@src/temporary-code/temporary-code.service';
import { TemporaryCode } from '@src/entity/temporary-code.entity';
import { TemporaryCodeDto } from '@src/shared/dtos/temporary-code.dto';

@Controller('temporary-codes')
@ApiTags('temporary-codes')
export class TemporaryCodeController {
  constructor(private readonly service: TemporaryCodeService) {}

  @Get()
  async getAllTemporaryCodes(): Promise<TemporaryCode[]> {
    return await this.service.findAll();
  }

  @Post()
  async create(@Body() dto: TemporaryCodeDto): Promise<TemporaryCode> {
    return await this.service.createTemporaryCode(dto);
  }
}
