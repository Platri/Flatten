import {Injectable} from '@nestjs/common';
import {InjectRepository} from '@nestjs/typeorm';
import {Repository} from 'typeorm';
import {TemporaryCode} from "@src/entity/temporary-code.entity";
import {CreateTemporaryCodeDto} from "@src/shared/dtos/create-temporary-code.dto";
import {QrCodeService} from "@src/qr-code/qr-code.service";

@Injectable()
export class TemporaryCodeService {

    constructor(
        @InjectRepository(TemporaryCode)
        private readonly temporaryCodeRepository: Repository<TemporaryCode>,

        private qrCodeService: QrCodeService
    ) {
    }

    async findAll(): Promise<TemporaryCode[]> {
        return await this.temporaryCodeRepository.find();
    }

    async deleteById(id: string): Promise<void> {
        await this.temporaryCodeRepository.delete(id);
    }

    public async createTemporaryCode(createTemporaryCodeDto: CreateTemporaryCodeDto): Promise<TemporaryCode> {
        const temporaryCode = new TemporaryCode();
        const qrCode = this.qrCodeService.findOne(createTemporaryCodeDto.shortCode);
        temporaryCode.qrCode = await qrCode;
        return this.temporaryCodeRepository.save(temporaryCode);
    }

}
