/*
  Warnings:

  - You are about to drop the `PizzaIngredients` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "PizzaIngredients" DROP CONSTRAINT "PizzaIngredients_pizzaId_fkey";

-- DropTable
DROP TABLE "PizzaIngredients";

-- CreateTable
CREATE TABLE "PizzaRoll" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "PizzaRoll_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ingredients" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "pizzaId" INTEGER NOT NULL,
    "pizzaRollId" INTEGER NOT NULL,

    CONSTRAINT "Ingredients_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Ingredients_pizzaId_key" ON "Ingredients"("pizzaId");

-- CreateIndex
CREATE UNIQUE INDEX "Ingredients_pizzaRollId_key" ON "Ingredients"("pizzaRollId");

-- AddForeignKey
ALTER TABLE "Ingredients" ADD CONSTRAINT "Ingredients_pizzaId_fkey" FOREIGN KEY ("pizzaId") REFERENCES "Pizza"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ingredients" ADD CONSTRAINT "Ingredients_pizzaRollId_fkey" FOREIGN KEY ("pizzaRollId") REFERENCES "PizzaRoll"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
