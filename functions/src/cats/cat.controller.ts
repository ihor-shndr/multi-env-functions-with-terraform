import { Controller, Get } from '@nestjs/common';
import { CatService } from './cat.service';

@Controller('cats')
export class CatController {
  constructor(private readonly appService: CatService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }
}
