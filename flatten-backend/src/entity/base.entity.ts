import { PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';

export abstract class BaseEntity {
	@PrimaryGeneratedColumn('uuid') id: string;

	@Column({ type: 'boolean', default: true })
	isActive: boolean;

	@Column({ type: 'boolean', default: false })
	isArchived: boolean;

	@CreateDateColumn({ type: 'timestamp', precision: null, default: () => 'CURRENT_TIMESTAMP' })
	createDateTime: Date;

	@Column({ type: 'varchar', length: 300, default: 'system' })
	createdBy: string;

	@UpdateDateColumn({ type: 'timestamp', precision: null, default: () => 'CURRENT_TIMESTAMP' })
	lastChangedDateTime: Date;

	@Column({ type: 'varchar', length: 300, default: 'system' })
	lastChangedBy: string;

	@Column({ type: 'varchar', length: 300, nullable: true })
	internalComment: string | null;

	@Column({ length: 500 })
	name: string;

	@Column('text')
	description: string;

	@Column()
	filename: string;

	@Column('int')
	views: number;

	@Column()
	isPublished: boolean;
}
