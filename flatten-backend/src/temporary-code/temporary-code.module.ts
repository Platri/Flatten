import {Module} from '@nestjs/common';
import {TypeOrmModule} from '@nestjs/typeorm';
import {TemporaryCode} from "@src/entity/temporary-code.entity";
import {TemporaryCodeController} from "@src/temporary-code/temporary-code.controller";
import {TemporaryCodeService} from "@src/temporary-code/temporary-code.service";
import {QrCodeService} from "@src/qr-code/qr-code.service";
import {QrCodeModule} from "@src/qr-code/qr-code.module";


@Module({
    imports: [TypeOrmModule.forFeature([TemporaryCode]),
        QrCodeModule],
    controllers: [TemporaryCodeController],
    providers: [TemporaryCodeService],
})
export class TemporaryCodeModule {
}
