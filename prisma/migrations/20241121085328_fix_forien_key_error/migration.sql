-- DropForeignKey
ALTER TABLE "Food" DROP CONSTRAINT "Food_foodTypeId_fkey";

-- DropForeignKey
ALTER TABLE "Ingredients" DROP CONSTRAINT "Ingredients_foodTypeId_fkey";

-- AddForeignKey
ALTER TABLE "Food" ADD CONSTRAINT "Food_id_fkey" FOREIGN KEY ("id") REFERENCES "FoodType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ingredients" ADD CONSTRAINT "Ingredients_id_fkey" FOREIGN KEY ("id") REFERENCES "FoodType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
