/*
  Warnings:

  - A unique constraint covering the columns `[foodId]` on the table `Ingredients` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Ingredients_foodId_key" ON "Ingredients"("foodId");
