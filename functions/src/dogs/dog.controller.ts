import { Controller, Get } from '@nestjs/common';
import { DogService } from './dog.service';

@Controller('dogs')
export class DogController {
  constructor(private readonly appService: DogService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }
}
