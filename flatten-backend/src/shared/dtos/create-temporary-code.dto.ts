import { ApiProperty } from "@nestjs/swagger";

export class CreateTemporaryCodeDto {
    @ApiProperty()
    shortCode: string;
}
