import {Cough, Headache} from "@src/health-logbook/healthLogbook.model";
import { ApiProperty } from "@nestjs/swagger";

export interface CreateHealthLogbookEntryDto {
        bodyTemperature: number;
        cough: Cough;
        headache: Headache;
        qrCodeId: string;
}

export class GetHealthLogbookListDto {
        @ApiProperty()
        bodyTemperature: number;
        @ApiProperty()
        cough: Cough;
        @ApiProperty()
        headache: Headache;
        @ApiProperty()
        createDateTime: Date;
}