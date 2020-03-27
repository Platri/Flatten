import {Injectable, NotFoundException} from '@nestjs/common';
import {HealthLogbookEntry, HealthLogbook} from "@src/health-logbook/healthLogbook.model";
import { v4 as uuidv4 } from 'uuid';


@Injectable()
export class HealthLogbookService {
    fakeHealthLogbookEntry: HealthLogbookEntry;
    fakeHealthLogbook: HealthLogbook = {entries: []} ;
    error= false;

    createLogbookEntry(entry): HealthLogbookEntry {
        // Post entry to repository
        const logbook: HealthLogbookEntry = entry;
        logbook.id = uuidv4();
        this.fakeHealthLogbookEntry = logbook;
        this.fakeHealthLogbook.entries.push(logbook);
        return this.fakeHealthLogbookEntry;
    }

    getLogbookEntry(id: number): HealthLogbookEntry {
        // Get entry from user from repository by id via jwt
        let logBookEntry: HealthLogbookEntry = null;
        this.fakeHealthLogbookEntry.id === id ? logBookEntry = this.fakeHealthLogbookEntry : this.error = true;
        if(this.error) {
            throw new NotFoundException('Entry not found.');
        }
        return logBookEntry;
    }

    getLogbook(): HealthLogbook {
        // Get healthLogbook of user from repository via jwt
        return this.fakeHealthLogbook;
    }
}
