import {ApiTags} from '@nestjs/swagger';
import {Body, Controller, Delete, Get, Param, Post,} from '@nestjs/common';
import {TemporaryCodeService} from "@src/temporary-code/temporary-code.service";
import {TemporaryCode} from "@src/entity/temporary-code.entity";
import {CreateTemporaryCodeDto} from "@src/shared/dtos/create-temporary-code.dto";

@Controller('temporary-code')
@ApiTags('temporary-code')
export class TemporaryCodeController {

    constructor(private readonly temporaryCodeService: TemporaryCodeService) {
    }

    @Get()
    async getAllTemporaryCodes(): Promise<TemporaryCode[]> {
        return await this.temporaryCodeService.findAll();
    }

    @Post()
    async create(@Body() dto: CreateTemporaryCodeDto): Promise<TemporaryCode> {
        return await this.temporaryCodeService.createTemporaryCode(dto);
    }

    @Delete(':id')
    async delete(@Param('id') id: string): Promise<any> {
        return await this.temporaryCodeService.deleteById(id);
    }
}
