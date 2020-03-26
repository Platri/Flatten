import { Test, TestingModule } from '@nestjs/testing';
import { HealthLogbookService } from './health-logbook.service';

describe('HealthLogbookService', () => {
  let service: HealthLogbookService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [HealthLogbookService],
    }).compile();

    service = module.get<HealthLogbookService>(HealthLogbookService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
