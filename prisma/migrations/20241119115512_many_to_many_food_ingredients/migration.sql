/*
  Warnings:

  - You are about to drop the column `ingredients` on the `Food` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Food" DROP COLUMN "ingredients";

-- CreateTable
CREATE TABLE "_FoodToIngredients" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_FoodToIngredients_AB_unique" ON "_FoodToIngredients"("A", "B");

-- CreateIndex
CREATE INDEX "_FoodToIngredients_B_index" ON "_FoodToIngredients"("B");

-- AddForeignKey
ALTER TABLE "_FoodToIngredients" ADD CONSTRAINT "_FoodToIngredients_A_fkey" FOREIGN KEY ("A") REFERENCES "Food"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FoodToIngredients" ADD CONSTRAINT "_FoodToIngredients_B_fkey" FOREIGN KEY ("B") REFERENCES "Ingredients"("id") ON DELETE CASCADE ON UPDATE CASCADE;
