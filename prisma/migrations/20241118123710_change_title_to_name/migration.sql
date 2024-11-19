/*
  Warnings:

  - You are about to drop the column `title` on the `Pizza` table. All the data in the column will be lost.
  - You are about to drop the column `title` on the `PizzaRoll` table. All the data in the column will be lost.
  - Added the required column `name` to the `Pizza` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `PizzaRoll` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Pizza" DROP COLUMN "title",
ADD COLUMN     "name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "PizzaRoll" DROP COLUMN "title",
ADD COLUMN     "name" TEXT NOT NULL;
