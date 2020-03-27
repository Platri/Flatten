import {Injectable} from '@nestjs/common';
import {InjectRepository} from '@nestjs/typeorm';
import {Repository} from 'typeorm';
import {TemporaryCode} from "@src/entity/temporary-code.entity";
import {TemporaryCodeDto} from "@src/shared/dtos/temporary-code.dto";

@Injectable()
export class TemporaryCodeService {

    constructor(
        @InjectRepository(TemporaryCode)
        private readonly repository: Repository<TemporaryCode>,
    ) {
    }

    async findAll(): Promise<TemporaryCode[]> {
        return await this.repository.find();
    }

    async createTemporaryCode(dto: TemporaryCodeDto): Promise<TemporaryCode> {
        const temporaryCode: TemporaryCode = new TemporaryCode();
        temporaryCode.shortCode = dto.shortCode;
        return await this.repository.save(temporaryCode);
    }

}
