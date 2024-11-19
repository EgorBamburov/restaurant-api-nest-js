import { Injectable } from '@nestjs/common';
import { CreateFoodDto } from './dto/create-food.dto';
import { UpdateFoodDto } from './dto/update-food.dto';
import { PrismaService } from '../prisma/prisma.service';
import { IngredientsService } from '../ingredients/ingredients.service';

@Injectable()
export class FoodService {
  constructor(
    private prisma: PrismaService,
    private ingredients: IngredientsService,
  ) {}
  create(createFoodDto: CreateFoodDto) {
    const ids = [1, 2];
    const item = this.prisma.food.create({
      data: {
        name: 'test',
        description: 'test',
        cost: '200',
        ingredients: ids,
      },
    });

    return item;
  }

  async findAll() {
    const foodArr = await this.prisma.food.findMany();

    for (const i in foodArr) {
      const ingredients = await this.ingredients.getManyByIds(
        foodArr[i].ingredients,
      );
      foodArr[i].ingredients = ingredients as any[];
    }

    return foodArr;
  }

  findOne(id: number) {
    return `This action returns a #${id} food`;
  }

  update(id: number, updateFoodDto: UpdateFoodDto) {
    return `This action updates a #${id} food`;
  }

  async remove(id: number) {
    await this.prisma.food.delete({
      where: {
        id: id,
      },
    });

    return `This action removes a #${id} food`;
  }
}
