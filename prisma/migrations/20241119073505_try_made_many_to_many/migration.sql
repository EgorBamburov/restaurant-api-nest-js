/*
  Warnings:

  - You are about to drop the column `foodId` on the `Ingredients` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Ingredients" DROP CONSTRAINT "Ingredients_foodId_fkey";

-- AlterTable
ALTER TABLE "Ingredients" DROP COLUMN "foodId";

-- AddForeignKey
ALTER TABLE "Ingredients" ADD CONSTRAINT "Ingredients_id_fkey" FOREIGN KEY ("id") REFERENCES "Food"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
