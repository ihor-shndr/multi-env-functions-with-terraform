import { Module } from '@nestjs/common';
import { DogController } from './dog.controller';
import { DogService } from './dog.service';
import { MongooseModule } from '@nestjs/mongoose';

@Module({
  imports: [],
  controllers: [DogController],
  providers: [DogService],
})
export class DogModule {}
