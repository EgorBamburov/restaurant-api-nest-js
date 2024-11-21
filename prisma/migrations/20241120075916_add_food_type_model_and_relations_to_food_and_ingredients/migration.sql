/*
  Warnings:

  - You are about to drop the column `foodType` on the `Ingredients` table. All the data in the column will be lost.
  - Added the required column `foodTypeId` to the `Food` table without a default value. This is not possible if the table is not empty.
  - Added the required column `foodTypeId` to the `Ingredients` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Food" ADD COLUMN     "foodTypeId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Ingredients" DROP COLUMN "foodType",
ADD COLUMN     "foodTypeId" INTEGER NOT NULL;

-- DropEnum
DROP TYPE "foodType";

-- CreateTable
CREATE TABLE "FoodType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "title" TEXT NOT NULL,

    CONSTRAINT "FoodType_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "FoodType_id_key" ON "FoodType"("id");

-- AddForeignKey
ALTER TABLE "Food" ADD CONSTRAINT "Food_foodTypeId_fkey" FOREIGN KEY ("foodTypeId") REFERENCES "FoodType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ingredients" ADD CONSTRAINT "Ingredients_foodTypeId_fkey" FOREIGN KEY ("foodTypeId") REFERENCES "FoodType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
