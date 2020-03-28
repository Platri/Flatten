export interface HealthLogbook {
    entries?: HealthLogbookEntry[];
}

export interface HealthLogbookEntry {
    bodyTemperature: number;
    cough: Cough;
    headache: Headache;
    id?: number;
}

export enum Cough {
    NO,
    BIT,
    OFTEN,
    BAD,
    REALLY_BAD,
    TERRIBLE
}

export enum Headache {
    NO,
    OK,
    BIT,
    BAD,
    REALLY_BAD,
    TERRIBLE
}