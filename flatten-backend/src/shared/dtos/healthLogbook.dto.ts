import { Cough, Headache } from "@src/health-logbook/healthLogbook.model";
import { ApiProperty } from "@nestjs/swagger";

export class CreateHealthLogbookEntryDto {
        @ApiProperty({
                description: ''
        })
        bodyTemperature: number;

        @ApiProperty({
                description: 'description : field is enum Cough. ["NO", "BIT", "OFTEN", "BAD", "REALLY_BAD", "TERRIBLE"]'
        })
        cough: Cough;

        @ApiProperty({
                description: 'description : field is enum Headache. ["NO", "OK", "BIT", "BAD", "REALLY_BAD", "TERRIBLE"]'
        })
        headache: Headache;

        @ApiProperty()
        qrCodeId: string;
}

export class ResponseHealthLogbookDTO {
        @ApiProperty({ example: 123, description: 'id' })
        id?: number;

        @ApiProperty({ example: 2, description: 'Cough status' })
        cough: Cough;

        @ApiProperty({ example: 3, description: 'Headache status' })
        headache: Headache;

        @ApiProperty({ example: 32, description: 'Body temperature' })
        bodyTemperature: number;
    
        @ApiProperty({ example: '2020-03-28T14:10:10.000Z', description: 'Create time' })
        createDateTime: string
        
        @ApiProperty({ example: 'b7a5c3ef-7a2d-4740-8def-b2f86108bacb', description: 'QR code ID'})
        qrCodeId: string
}

export interface GetHealthLogbookListDto {
        bodyTemperature: number;
        cough: Cough;
        headache: Headache;
        createDateTime: Date;
}