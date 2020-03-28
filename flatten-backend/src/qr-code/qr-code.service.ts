import {QRCode} from '@src/entity/qr-code.entity';
import {Injectable} from '@nestjs/common';
import {QrCodeInterface} from "./qr-code.interface";
import {InjectRepository} from '@nestjs/typeorm';
import {Repository} from 'typeorm';
import {CreateQRCodeDTO} from '@src/shared/dtos/create-qr-code.dto';

@Injectable()
export class QrCodeService {
    fakeQR: QrCodeInterface;

    constructor(
        @InjectRepository(QRCode)
        private readonly qrCodeRepository: Repository<QRCode>,
    ) {
    }

    public async findAll(): Promise<any[]> {
        return this.qrCodeRepository.find();
    }

    public async findOne(id: string): Promise<any> {
        return this.qrCodeRepository.findOne(id);
    }

    public async create(createQrCodeDTO: CreateQRCodeDTO): Promise<QRCode> {
        const qrCode = new QRCode();
        qrCode.name = createQrCodeDTO.name;
        return this.qrCodeRepository.save(createQrCodeDTO);
    }

}
