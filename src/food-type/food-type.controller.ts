import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { FoodTypeService } from './food-type.service';
import { CreateFoodTypeDto } from './dto/create-food-type.dto';
import { UpdateFoodTypeDto } from './dto/update-food-type.dto';

@Controller('food-type')
export class FoodTypeController {
  constructor(private readonly foodTypeService: FoodTypeService) {}

  @Post()
  create(@Body() dto: CreateFoodTypeDto) {
    return this.foodTypeService.create(dto);
  }

  @Get()
  findAll() {
    return this.foodTypeService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.foodTypeService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() dto: UpdateFoodTypeDto) {
    return this.foodTypeService.update(+id, dto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.foodTypeService.remove(+id);
  }
}
