import {Injectable} from '@nestjs/common';
import {QrCodeInterface} from "./qr-code.interface";
import {throwError} from "rxjs";

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
            id: this.makeId(16),
            name: 'Markus'
        };
        this.fakeQR = qrCode;
        return qrCode
    }

    makeId(length) {
        let result = '';
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        const charactersLength = characters.length;
        for (let i = 0; i < length; i++) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }
        return result;
    }
}
