import {PrimaryGeneratedColumn, Column, CreateDateColumn, Entity, Index, AfterInsert} from 'typeorm';
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

    @Column({ type: 'timestamp', precision: null, default: () => 'CURRENT_TIMESTAMP' })
    validUntil: Date;

    @AfterInsert()
    async setValidUntil(): Promise<void> {
        this.validUntil = new Date(this.validUntil.getTime() + (3 * 60000));
    }

}
