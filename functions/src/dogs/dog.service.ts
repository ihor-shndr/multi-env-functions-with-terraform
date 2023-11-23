import { Injectable } from '@nestjs/common';

@Injectable()
export class DogService {
  getHello(): string {

    var connectionString =process.env.connection_string;

    
    return 'Hello dogs!';
  }
}
