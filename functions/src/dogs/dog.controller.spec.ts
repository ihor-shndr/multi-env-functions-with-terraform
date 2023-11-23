import { Test, TestingModule } from '@nestjs/testing';
import { DogController } from './dog.controller';
import { DogService } from './dog.service';

describe('AppController', () => {
  let appController: DogController;

  beforeEach(async () => {
    const app: TestingModule = await Test.createTestingModule({
      controllers: [DogController],
      providers: [DogService],
    }).compile();

    appController = app.get<DogController>(DogController);
  });

  describe('root', () => {
    it('should return "Hello World!"', () => {
      expect(appController.getHello()).toBe('Hello World!');
    });
  });
});
