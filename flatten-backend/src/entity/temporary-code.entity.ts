import {PrimaryGeneratedColumn, Column, CreateDateColumn, Entity, Index} from 'typeorm';
import {Max, Min} from "class-validator";

@Entity()
export class TemporaryCode {
    @PrimaryGeneratedColumn()
    id: number;

    @Index({unique: true})
    @Min(8)
    @Max(8)
    @Column({ type: 'varchar', length: 8})
    shortCode: string;

    @CreateDateColumn({ type: 'timestamp', precision: null, default: () => 'CURRENT_TIMESTAMP' })
    createDateTime: Date;

    @Column({ type: 'timestamp', precision: null, default: () => 'CURRENT_TIMESTAMP + (interval 2 minute)' })
    validUntil: Date;

}
