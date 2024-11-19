export class CreateFoodDto {
  data: FoodData;
  ingredients: number[];
}

class FoodData {
  name: string;
  description: string;
  cost: string;
}
