export interface Report {
    feeling: Feeling;
    sex: Sex;
    age: number;
    weight: number;
    height: number;
    chronicalDiseases: string;
    additionalInformations: string;
}

export enum Sex {
    FEMALE,
    DIVERSE,
    MALE
}

export enum Feeling {
    SUPER,
    GOOD,
    OK,
    BAD,
    REALLY_BAD,
    TERRIBLE
}