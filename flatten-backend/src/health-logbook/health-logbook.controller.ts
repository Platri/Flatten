import {Controller, Get, Query} from '@nestjs/common';
import {HealthLogbookService} from "@src/health-logbook/health-logbook.service";

@Controller('health-logbook')
export class HealthLogbookController {
    constructor(
        private healthLogbookService: HealthLogbookService
    ) {
    }

    @Get()
    getLogbookEntry(@Query('id') id) {
        this.healthLogbookService.getLogbookEntry(id);
    }

    @Get()
    getLogbook() {
        this.healthLogbookService.getLogbook();
    }
}
