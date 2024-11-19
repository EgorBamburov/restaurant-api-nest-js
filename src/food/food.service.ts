import { Injectable } from '@nestjs/common';
import { CreateFoodDto } from './dto/create-food.dto';
import { UpdateFoodDto } from './dto/update-food.dto';
import { PrismaService } from '../prisma/prisma.service';
import { IngredientsService } from '../ingredients/ingredients.service';
import { TFood, TIngredient } from '../types';

@Injectable()
export class FoodService {
  constructor(
    private prisma: PrismaService,
    private ingredients: IngredientsService,
  ) {}
  create(createFoodDto: CreateFoodDto) {
    return this.prisma.food.create({
      data: createFoodDto,
    });
  }

  async getAll() {
    const foodArr: TFood[] = await this.prisma.food.findMany();

    for (const i in foodArr) {
      foodArr[i].ingredients = (await this.ingredients.getManyByIds(
        foodArr[i].ingredients as number[],
      )) as TIngredient[];
    }

    return foodArr;
  }

  getById(id: number) {
    return this.prisma.food.findFirst({
      where: { id: id },
    });
  }

  update(id: number, updateFoodDto: UpdateFoodDto) {
    return this.prisma.food.update({
      where: {
        id: id,
      },
      data: updateFoodDto,
    });
  }

  async delete(id: number) {
    return this.prisma.food.delete({
      where: {
        id: id,
      },
    });
  }
}
