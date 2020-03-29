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

export class ResponseQRCodeDto {
    @ApiProperty({ example: '04fe9963-1b7d-4e43-83bb-d73f0b0680c7', description: 'QR code ID' })
    id: string;

    @ApiProperty({ example: '2020-03-28T04:26:41.000Z', description: 'Create date for temporary QR code' })
    createDateTime: string;

    @ApiProperty({ example: 'string', description: 'Name of QR code' })
    name: string;

    @ApiProperty({ example: 1, description: 'Use case' })
    useCase: UseCase;

    @ApiProperty({ example: 'string', description: 'GPS position' })
    gpsPosition: string;

    @ApiProperty({ example: 'string', description: 'Additional information' })
    additionalInformation: string;

    @ApiProperty({ example: true, description: 'Activity status' })
    active: boolean;

    @ApiProperty({ example: 2, description: 'Health status of QR code creator' })
    status: Status;
}