import { UseCase, Status } from '../models/qrCode.model';
import { ApiProperty } from "@nestjs/swagger";

export class CreateQRCodeDTO {
    @ApiProperty()
    name: string;

    @ApiProperty({
        description: 'description : field is enum UseCase.  ["COMPANY", "PRIVATE"]'
    })
    useCase: UseCase;

    @ApiProperty()
    gpsPosition: string;

    @ApiProperty()
    additionalInformation: string;

    @ApiProperty()
    active: boolean;

    @ApiProperty({
        description: 'description : field is enum Status.  ["HEALTHY", "SUSPECTED", "INFECTED"]'
    })
    status: Status;
}