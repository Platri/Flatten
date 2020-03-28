export interface QR {
    x: boolean;
}

export interface UserQR extends QR{
    x: boolean;
}

export interface BusinessQR extends QR {
    x: boolean;
}

export interface PermanentQR extends QR {
    name: string;
    useCase: UseCase;
    gpsPosition: any;
    additionalInformation: string;
}

export interface TemporaryQR extends QR {
    x: boolean;
}

export enum UseCase {
    COMPANY,
    PRIVATE
}

export enum Status {
    HEALTHY,
    SUSPECTED,
    INFECTED
}