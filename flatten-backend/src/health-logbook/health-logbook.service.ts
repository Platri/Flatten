import {Injectable, NotFoundException} from '@nestjs/common';
import {HealthLogbook, HealthLogbookList} from "@src/health-logbook/healthLogbook.model";
import { v4 as uuidv4 } from 'uuid';
import {throwError} from "rxjs";


@Injectable()
export class HealthLogbookService {
    fakeHealthLogbook: HealthLogbook;
    fakeHealthLogbooks: HealthLogbookList;

    createLogbookEntry(): HealthLogbook {
        const logbook: HealthLogbook = {
            id: uuidv4(),
            bodyTemperature: 0,
            cough: 0,
            headache: 0
        };
        this.fakeHealthLogbook = logbook;
        this.fakeHealthLogbooks.healthLogbooks.push(logbook);
        return this.fakeHealthLogbook;
    }

    getLogbookEntry(id: number): HealthLogbook {
        // Get healthlogbook
        let logBookEntry: HealthLogbook;
        this.fakeHealthLogbooks.healthLogbooks.find(logbookEntryObject => {
            logbookEntryObject.id === id ? logBookEntry = logbookEntryObject : throwError('Logbook Entry not found.')
        });
        return logBookEntry;
    }

    getLogbook(): HealthLogbookList {
        // Get HealthLogbook of user from repository via jwt
        return this.fakeHealthLogbooks;
    }
}
