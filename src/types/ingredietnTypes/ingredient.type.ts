import { EFoodType } from '../foodTypes';

export type TIngredient = {
  name: string;
  id: number;
  canAdd: boolean;
  foodType: EFoodType;
};
