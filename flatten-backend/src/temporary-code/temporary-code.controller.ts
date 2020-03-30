import {ResponseTemporaryCodeDto} from '../shared/dtos/temporary-code.dto';
import {ApiTags, ApiResponse} from '@nestjs/swagger';
import {Body, Controller, Delete, Get, Param, Post,} from '@nestjs/common';
import {TemporaryCode} from "@src/entity/temporary-code.entity";
import {CreateTemporaryCodeDto} from "@src/shared/dtos/temporary-code.dto";
import {TemporaryCodeService} from '@src/temporary-code/temporary-code.service';

@Controller('temporary-codes')
@ApiTags('temporary-codes')
export class TemporaryCodeController {
  constructor(private readonly service: TemporaryCodeService) {}

  @Get()
  async getAllTemporaryCodes(): Promise<TemporaryCode[]> {
    return await this.service.findAll();
  }

  @Post()
  @ApiResponse({status: 201, description: 'The resource has been successfuly created.', type: ResponseTemporaryCodeDto})
  async create(@Body() dto: CreateTemporaryCodeDto): Promise<TemporaryCode> {
    return await this.service.createTemporaryCode(dto);
  }
}
