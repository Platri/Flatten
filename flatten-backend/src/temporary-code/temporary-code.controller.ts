import { ResponseTemporaryCodeDto } from '../shared/dtos/temporary-code.dto';
import {ApiTags, ApiResponse, ApiOkResponse} from '@nestjs/swagger';
import {Body, Controller, Delete, Get, Param, Post,} from '@nestjs/common';
import {TemporaryCodeService} from "@src/temporary-code/temporary-code.service";
import {TemporaryCode} from "@src/entity/temporary-code.entity";
import {CreateTemporaryCodeDto} from "@src/shared/dtos/temporary-code.dto";

@Controller('temporary-code')
@ApiTags('temporary-code')
export class TemporaryCodeController {

    constructor(private readonly temporaryCodeService: TemporaryCodeService) {
    }

    @Get()
    @ApiResponse({status: 200, description: 'The resource list has been successfuly returned.', type: ResponseTemporaryCodeDto})
    async getAllTemporaryCodes(): Promise<TemporaryCode[]> {
        return await this.temporaryCodeService.findAll();
    }

    @Post()
    @ApiResponse({status: 201, description: 'The resource has been successfuly created.', type: ResponseTemporaryCodeDto})
    async create(@Body() dto: CreateTemporaryCodeDto): Promise<TemporaryCode> {
        return await this.temporaryCodeService.createTemporaryCode(dto);
    }

    @Delete(':id')
    @ApiResponse({status: 200, description: 'The resource has been successfuly deleted.'})
    async delete(@Param('id') id: string): Promise<any> {
        return await this.temporaryCodeService.deleteById(id);
    }
}
