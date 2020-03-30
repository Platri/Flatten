import { GetHealthLogbookListDto } from '@src/shared/dtos/healthLogbook.dto';
import { ApiProperty } from '@nestjs/swagger';
import { PaginationDto } from '@src/shared/dtos/pagination.dto';
export class HealthLogbookPagination extends PaginationDto<GetHealthLogbookListDto> {
	@ApiProperty({ type: GetHealthLogbookListDto })
	healthLogbookData: GetHealthLogbookListDto[];
    @ApiProperty() 
    startDate: Date;
    @ApiProperty() 
    endDate: Date;
}
