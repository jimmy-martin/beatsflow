import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CategoriesModule } from './categories/categories.module';
import { UsersModule } from './users/users.module';
import { BeatsModule } from './beats/beats.module';
import { TransactionsModule } from './transactions/transactions.module';

@Module({
  imports: [CategoriesModule, UsersModule, BeatsModule, TransactionsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
