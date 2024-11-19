-- DropForeignKey
ALTER TABLE "Ingredients" DROP CONSTRAINT "Ingredients_id_fkey";

-- AlterTable
ALTER TABLE "Ingredients" ADD COLUMN     "foodId" INTEGER;

-- AddForeignKey
ALTER TABLE "Ingredients" ADD CONSTRAINT "Ingredients_foodId_fkey" FOREIGN KEY ("foodId") REFERENCES "Food"("id") ON DELETE SET NULL ON UPDATE CASCADE;
