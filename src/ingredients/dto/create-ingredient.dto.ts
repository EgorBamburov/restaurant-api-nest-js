import { IsBoolean, IsNumber, IsString } from 'class-validator';

export class CreateIngredientDto {
  @IsString()
  name: string;
  @IsBoolean()
  canAdd: boolean;
  @IsNumber()
  foodTypeId: number;
}
