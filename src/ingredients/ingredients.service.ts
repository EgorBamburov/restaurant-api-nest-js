import { Injectable } from '@nestjs/common';
import { CreateIngredientDto } from './dto/create-ingredient.dto';
import { UpdateIngredientDto } from './dto/update-ingredient.dto';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class IngredientsService {
  constructor(private prisma: PrismaService) {}

  async create(createIngredientDto: CreateIngredientDto) {
    return this.prisma.ingredients.create({
      data: createIngredientDto,
    });
  }

  async getAll() {
    return this.prisma.ingredients.findMany();
  }

  async getManyByIds(ids: number[]) {
    return this.prisma.ingredients.findMany({
      where: {
        id: { in: ids },
      },
    });
  }

  async getById(id: number) {
    return this.prisma.ingredients.findFirst({
      where: {
        id: id,
      },
    });
  }

  async update(id: number, updateIngredientDto: UpdateIngredientDto) {
    return this.prisma.ingredients.update({
      where: {
        id,
      },
      data: updateIngredientDto,
    });
  }

  async delete(id: number) {
    return this.prisma.ingredients.delete({
      where: {
        id,
      },
    });
  }
}
