import { Injectable } from '@nestjs/common';
import { CreateFoodTypeDto } from './dto/create-food-type.dto';
import { UpdateFoodTypeDto } from './dto/update-food-type.dto';
import { PrismaService } from "../prisma/prisma.service";

@Injectable()
export class FoodTypeService {
  constructor(private prisma: PrismaService) {
  }
  async create(dto: CreateFoodTypeDto) {
    return this.prisma.foodType.create({
      data: dto,
    });
  }

  async findAll() {
    return this.prisma.foodType.findMany({
      include: {
        food: {
          include: {
            ingredients: true,
          },
        },
        ingredients: true,
      },
    });
  }

  async findOne(id: number) {
    return this.prisma.foodType.findFirst({
      where: {
        id,
      },
    });
  }

  async update(id: number, dto: UpdateFoodTypeDto) {
    return this.prisma.foodType.update({
      where: {
        id,
      },
      data: dto,
    });
  }

  async remove(id: number) {
    return this.prisma.foodType.delete({
      where: {
        id,
      },
    });
  }
}
