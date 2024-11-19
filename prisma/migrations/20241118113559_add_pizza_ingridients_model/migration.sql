/*
  Warnings:

  - You are about to drop the `MenuElement` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "MenuElement";

-- CreateTable
CREATE TABLE "Pizza" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "Pizza_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PizzaIngredients" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "pizzaId" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "PizzaIngredients_pizzaId_key" ON "PizzaIngredients"("pizzaId");

-- AddForeignKey
ALTER TABLE "PizzaIngredients" ADD CONSTRAINT "PizzaIngredients_pizzaId_fkey" FOREIGN KEY ("pizzaId") REFERENCES "Pizza"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
