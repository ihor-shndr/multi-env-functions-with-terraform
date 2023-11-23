import { INestApplication } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { DogModule } from './dog.module';
import { GlobalErrorFilter } from 'src/global-error-filter';

export async function createApp(): Promise<INestApplication> {
  const app = await NestFactory.create(DogModule);
  app.setGlobalPrefix('api');
  app.useGlobalFilters(new GlobalErrorFilter());

  await app.init();
  return app;
}
