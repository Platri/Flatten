import { ApiProperty } from "@nestjs/swagger";

export class CreateTemporaryCodeDto {
    @ApiProperty()
    qrCodeId: string;
}

export class ResponseTemporaryCodeDto {
    @ApiProperty({ example: 1, description: 'Temporary code ID' })
    id: number;

    @ApiProperty({ example: 'CdF7Cmz3', description: 'Short code for QR code'})
    shortCode: string;

    @ApiProperty({ example: '2020-03-28T13:32:20.000Z', description: 'Create date for temporary code'})
    createDateTime: string;

    @ApiProperty({ example: '2020-03-28T14:04:24.000Z', description: 'Last valid date for temporary code'})
    validUntil: string;
}
