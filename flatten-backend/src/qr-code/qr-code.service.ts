import {Injectable} from '@nestjs/common';
import {QrCodeInterface} from "./qr-code.interface";
import {throwError} from "rxjs";
import { v4 as uuidv4 } from 'uuid';

@Injectable()
export class QrCodeService {
    fakeQR: QrCodeInterface;

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

    createQRCode(): QrCodeInterface {
        const qrCode: QrCodeInterface = {
            id: uuidv4(),
            name: 'Markus'
        };
        this.fakeQR = qrCode;
        return qrCode
    }

}
