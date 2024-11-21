import { IsString } from 'class-validator';

export class CreateFoodTypeDto {
  @IsString()
  name: string;
  @IsString()
  title: string;
}
