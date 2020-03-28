import {EntitySubscriberInterface, EventSubscriber, InsertEvent} from "typeorm";
import {TemporaryCode} from "@src/entity/temporary-code.entity";

@EventSubscriber()
export class TemporaryCodeSubscriber implements EntitySubscriberInterface<TemporaryCode> {


    /**
     * Indicates that this subscriber only listen to Post events.
     */
    listenTo() {
        return TemporaryCode;
    }

    /**
     * Called before post insertion.
     */

    beforeInsert(event: InsertEvent<TemporaryCode>): Promise<any> | void {
        console.log(`BEFORE POST INSERTED: `, event.entity);
        event.entity.createDateTime = new Date();
        event.entity.validUntil = new Date(event.entity.createDateTime.getTime() + (3 * 60000));

        // Create random string
        let result = '';
        const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!$%&€?+-*,';
        const charactersLength = characters.length;
        for (let i = 0; i < 8; i++) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }
        event.entity.shortCode = result
    }


}