import { ApiProperty } from '@nestjs/swagger';
export class PaginationDto<T> {
	@ApiProperty()
	readonly count: number;
	@ApiProperty()
	readonly limit: number;
	@ApiProperty()
	readonly page: number;
}
