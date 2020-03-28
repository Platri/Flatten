import {QRCode} from '@src/entity/qr-code.entity';
import {Injectable} from '@nestjs/common';
import {QrCodeInterface} from "./qr-code.interface";
import {throwError} from "rxjs";
import {v4 as uuidv4} from 'uuid';
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

    getQRCode(id): QrCodeInterface {
        /*
        User scans QR-Code of a friend and his friend has to show up on his list.
        Select ID in Database.
        Return and process UserScannedQrCode DTO.
        */
        if (id === this.fakeQR.id) {
            return this.fakeQR;
        } else {
            throwError('Scanned QR-Code is incorrect.')
        }
    }

    createQRCode(createQrCodeDTO: CreateQRCodeDTO): Promise<QRCode> {
        const qrCode = new QRCode();
        qrCode.name = createQrCodeDTO.name;
        return this.qrCodeRepository.save(createQrCodeDTO);
    }

}
