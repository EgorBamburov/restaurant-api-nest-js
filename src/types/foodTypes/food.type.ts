import { TIngredient } from '../ingredietnTypes';

export type TFood = {
  id: number;
  name: string;
  description: string;
  cost: string;
  ingredients: number[] | TIngredient[];
};
