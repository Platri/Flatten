export interface HealthLogbookList {
    healthLogbooks: HealthLogbook[];
}

export interface HealthLogbook {
    bodyTemperature: number;
    cough: Cough;
    headache: Headache;
    id?: number;
}

enum Cough {
    NO,
    BIT,
    OFTEN,
    BAD,
    REALLY_BAD,
    TERRIBLE
}

enum Headache {
    NO,
    OK,
    BIT,
    BAD,
    REALLY_BAD,
    TERRIBLE
}