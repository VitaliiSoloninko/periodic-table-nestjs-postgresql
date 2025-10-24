import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getStatus(): string {
    const port = process.env.PORT || 3000;
    return `Server is running on port ${port}`;
  }
}
