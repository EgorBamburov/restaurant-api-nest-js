/*
  Warnings:

  - You are about to drop the column `pizzaId` on the `Ingredients` table. All the data in the column will be lost.
  - You are about to drop the column `pizzaRollId` on the `Ingredients` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Ingredients" DROP CONSTRAINT "Ingredients_pizzaId_fkey";

-- DropForeignKey
ALTER TABLE "Ingredients" DROP CONSTRAINT "Ingredients_pizzaRollId_fkey";

-- DropIndex
DROP INDEX "Ingredients_pizzaId_key";

-- DropIndex
DROP INDEX "Ingredients_pizzaRollId_key";

-- AlterTable
ALTER TABLE "Ingredients" DROP COLUMN "pizzaId",
DROP COLUMN "pizzaRollId";

-- AlterTable
ALTER TABLE "Pizza" ADD COLUMN     "ingredients" INTEGER[];

-- AlterTable
ALTER TABLE "PizzaRoll" ADD COLUMN     "ingredients" INTEGER[];
