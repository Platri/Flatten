export interface HandshakeList {
    handshakes: Handshake[];
}

export interface Handshake {
    name: string;
    dateTime: any;
    status?: any;
    location?: any;
    notes?: string;
}