import { Test, TestingModule } from '@nestjs/testing';
import { HealthLogbookController } from './health-logbook.controller';

describe('HealthLogbook Controller', () => {
  let controller: HealthLogbookController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [HealthLogbookController],
    }).compile();

    controller = module.get<HealthLogbookController>(HealthLogbookController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
