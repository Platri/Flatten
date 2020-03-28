import {
    PrimaryGeneratedColumn,
    Column,
    Entity,
    OneToOne,
    JoinColumn, ManyToOne
} from 'typeorm';
import {QRCode} from "@src/entity/qr-code.entity";
import {Cough, Headache} from "@src/shared/models";

@Entity()
export class HealthLogbook {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'enum', enum:Cough, default: Cough.NO })
    cough: Cough;

    @Column({ type: 'enum', enum:Headache, default: Headache.NO })
    headache: Headache;

    @Column({type: 'int', default: 0.0})
    bodyTemperature: number;

    @Column({ type: 'timestamp', precision: null, default: () => 'CURRENT_TIMESTAMP' })
    createDateTime: Date;

    @Column()
    public qrCodeId: number;

    @ManyToOne(type => QRCode)
    @JoinColumn()
    qrCode: QRCode;

}