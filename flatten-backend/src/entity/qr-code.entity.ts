import {PrimaryGeneratedColumn, Column, CreateDateColumn, Entity} from 'typeorm';
import {Status, UseCase} from "@src/shared/models";

@Entity()
export class QRCode {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @CreateDateColumn({ type: 'timestamp', precision: null, default: () => 'CURRENT_TIMESTAMP' })
    createDateTime: Date;

    @Column({ type: 'varchar', default: '' })
    name: string;

    @Column({ type: 'enum', enum:UseCase, default: UseCase.PRIVATE })
    useCase: UseCase;

    @Column({ type: 'varchar', length: 300, default: '', nullable: true })
    gpsPosition: string;

    @Column({ type: 'varchar', length: 300, default: '', nullable: true })
    additionalInformation: string;

    @Column({ type: 'boolean', default: false })
    active: boolean;

    @Column({ type: 'enum', enum:Status, default: Status.HEALTHY })
    status: Status
}
