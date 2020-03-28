import {Cough, Headache} from "@src/health-logbook/healthLogbook.model";

export interface CreateHealthLogbookEntryDto {
        bodyTemperature: number;
        cough: Cough;
        headache: Headache;
        qrCodeId: string;
}

export interface GetHealthLogbookListDto {
        bodyTemperature: number;
        cough: Cough;
        headache: Headache;
        createDateTime: Date;
}