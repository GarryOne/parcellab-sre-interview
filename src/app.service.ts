import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return process.env.SALUTATION_TEXT || 'N/A';
  }
}
