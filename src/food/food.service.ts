import { Injectable } from '@nestjs/common';
import { CreateFoodDto } from './dto/create-food.dto';
import { UpdateFoodDto } from './dto/update-food.dto';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class FoodService {
  constructor(private prisma: PrismaService) {}
  create(dto: CreateFoodDto) {
    return this.prisma.food.create({
      data: {
        ...dto.data,
        ingredients: {
          connect: dto.ingredients.map((id) => ({ id: id })),
        },
      },
    });
  }

  async getAll() {
    return this.prisma.food.findMany({
      include: {
        ingredients: true,
      },
    });
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
      data: {
        ...updateFoodDto.data,
        ingredients: {
          connect: updateFoodDto.ingredients.map((id) => ({ id: id })),
        },
      },
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
