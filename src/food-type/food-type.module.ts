import { Module } from '@nestjs/common';
import { FoodTypeService } from './food-type.service';
import { FoodTypeController } from './food-type.controller';
import { PrismaService } from "../prisma/prisma.service";

@Module({
  controllers: [FoodTypeController],
  providers: [FoodTypeService, PrismaService],
})
export class FoodTypeModule {}
