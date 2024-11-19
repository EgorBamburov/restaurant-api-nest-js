import { Injectable } from '@nestjs/common';
import { CreateFoodDto } from './dto/create-food.dto';
import { UpdateFoodDto } from './dto/update-food.dto';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class FoodService {
  constructor(private prisma: PrismaService) {}
  create(createFoodDto: CreateFoodDto) {
    const ids = [1, 2, 3, 4];
    const item = this.prisma.food.create({
      data: {
        name: 'test',
        description: 'test',
        cost: '200',
        ingredients: {
          connect: ids.map((elm) => {
            return { id: elm };
          }),
        },
      },
    });

    return item;
  }

  findAll() {
    return this.prisma.food.findMany({
      include: {
        ingredients: true,
      },
    });
  }

  findOne(id: number) {
    return `This action returns a #${id} food`;
  }

  update(id: number, updateFoodDto: UpdateFoodDto) {
    return `This action updates a #${id} food`;
  }

  remove(id: number) {
    this.prisma.food.delete({
      where: {
        id: id,
      },
    });

    return `This action removes a #${id} food`;
  }
}
