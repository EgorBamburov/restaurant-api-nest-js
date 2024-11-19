import { Module } from '@nestjs/common';
import { PrismaModule } from './prisma/prisma.module';
import { IngredientsModule } from './ingredients/ingredients.module';
import { FoodModule } from './food/food.module';

@Module({
  imports: [PrismaModule, IngredientsModule, FoodModule],
})
export class AppModule {}
