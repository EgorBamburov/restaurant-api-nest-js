import { IsBoolean, IsString } from "class-validator";

export class CreateIngredientDto {
  @IsString()
  name: string;
  @IsBoolean()
  canAdd: boolean;
  @IsString()
  foodType: EFoodType;
}

enum EFoodType {
  PIZZA = "PIZZA",
  PIZZA_ROLL = "PIZZA_ROLL",
  SUSHI = "SUSHI",
  ALL = "ALL"
}
