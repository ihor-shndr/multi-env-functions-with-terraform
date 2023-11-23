import { Test, TestingModule } from '@nestjs/testing';
import { CatController } from './cat.controller';
import { CatService } from './cat.service';

describe('AppController', () => {
  let appController: CatController;

  beforeEach(async () => {
    const app: TestingModule = await Test.createTestingModule({
      controllers: [CatController],
      providers: [CatService],
    }).compile();

    appController = app.get<CatController>(CatController);
  });

  describe('root', () => {
    it('should return "Hello World!"', () => {
      expect(appController.getHello()).toBe('Hello World!');
    });
  });
});
