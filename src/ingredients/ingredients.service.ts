import { Injectable } from '@nestjs/common';
import { CreateIngredientDto } from './dto/create-ingredient.dto';
import { UpdateIngredientDto } from './dto/update-ingredient.dto';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class IngredientsService {
  constructor(private prisma: PrismaService) {}

  create(createIngredientDto: CreateIngredientDto) {
    const item = this.prisma.ingredients.create({
      data: createIngredientDto,
    });

    return item;
  }

  findAll() {
    return this.prisma.ingredients.findMany();
  }

  async findManyByIds(ids: number[]) {
    // console.log(ids)
    const test = await this.prisma.ingredients.findMany({
      where: {
        id: { in: ids }
      }
    })

    // console.log(test)
    return test;
  }

  findOne(id: number) {
    return `This action returns a #${id} ingredient`;
  }

  update(id: number, updateIngredientDto: UpdateIngredientDto) {
    return `This action updates a #${id} ingredient`;
  }

  remove(id: number) {
    return `This action removes a #${id} ingredient`;
  }
}
