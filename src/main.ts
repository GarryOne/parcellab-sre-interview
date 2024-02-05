import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const HTTP_PORT = process.env.HTTP_PORT || 3200;
  await app.listen(HTTP_PORT);
  console.log(`Started listening on: ${HTTP_PORT}`)
}
bootstrap();
