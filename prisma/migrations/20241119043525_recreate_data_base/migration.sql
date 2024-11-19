/*
  Warnings:

  - You are about to drop the column `pizzaId` on the `Ingredients` table. All the data in the column will be lost.
  - You are about to drop the column `pizzaRollId` on the `Ingredients` table. All the data in the column will be lost.
  - You are about to drop the `Pizza` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PizzaRoll` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterEnum
ALTER TYPE "foodType" ADD VALUE 'ANY';
COMMIT;
-- DropForeignKey
ALTER TABLE "Ingredients" DROP CONSTRAINT "Ingredients_pizzaId_fkey";

-- DropForeignKey
ALTER TABLE "Ingredients" DROP CONSTRAINT "Ingredients_pizzaRollId_fkey";

-- AlterTable
ALTER TABLE "Ingredients" DROP COLUMN "pizzaId",
DROP COLUMN "pizzaRollId",
ADD COLUMN     "canAdd" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "foodType" "foodType" NOT NULL DEFAULT 'ANY';

-- DropTable
DROP TABLE "Pizza";

-- DropTable
DROP TABLE "PizzaRoll";

-- CreateTable
CREATE TABLE "Food" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "ingredients" INTEGER[],

    CONSTRAINT "Food_pkey" PRIMARY KEY ("id")
);
