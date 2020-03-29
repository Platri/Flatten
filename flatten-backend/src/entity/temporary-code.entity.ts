import {
  PrimaryGeneratedColumn,
  Column,
  Entity,
  Index,
  OneToOne,
  JoinColumn,
} from 'typeorm';
import { Max, Min } from 'class-validator';
import { QRCode } from '@src/entity/qr-code.entity';

@Entity()
export class TemporaryCode {
  @PrimaryGeneratedColumn()
  id: number;

  @Index({ unique: true })
  @Min(8)
  @Max(8)
  @Column({ type: 'varchar', length: 8, default: 'EMPTYVA1', nullable: true })
  shortCode: string;

  @Column({
    type: 'timestamp',
    precision: null,
    default: () => 'CURRENT_TIMESTAMP',
  })
  createDateTime: Date;

  @Column({
    type: 'timestamp',
    precision: null,
    default: () => 'CURRENT_TIMESTAMP',
  })
  validUntil: Date;

  @OneToOne(type => QRCode)
  @JoinColumn()
  qrCode: QRCode;
}
