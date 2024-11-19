/*
  Warnings:

  - You are about to drop the column `ingredients` on the `Pizza` table. All the data in the column will be lost.
  - You are about to drop the column `ingredients` on the `PizzaRoll` table. All the data in the column will be lost.

*/
-- CreateEnum
CREATE TYPE "foodType" AS ENUM ('PIZZA', 'PIZZA_ROLL', 'SUSHI');

-- AlterTable
ALTER TABLE "Ingredients" ADD COLUMN     "pizzaId" INTEGER,
ADD COLUMN     "pizzaRollId" INTEGER;

-- AlterTable
ALTER TABLE "Pizza" DROP COLUMN "ingredients";

-- AlterTable
ALTER TABLE "PizzaRoll" DROP COLUMN "ingredients";

-- AddForeignKey
ALTER TABLE "Ingredients" ADD CONSTRAINT "Ingredients_pizzaId_fkey" FOREIGN KEY ("pizzaId") REFERENCES "Pizza"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ingredients" ADD CONSTRAINT "Ingredients_pizzaRollId_fkey" FOREIGN KEY ("pizzaRollId") REFERENCES "PizzaRoll"("id") ON DELETE SET NULL ON UPDATE CASCADE;
