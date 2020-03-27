import { PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn, Entity } from 'typeorm';

@Entity()
export class QRCode {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column({ type: 'varchar', default: true })
    qrCode: string;

    @Column({ type: 'varchar', default: true })
    name: string;
}
