/*
  Warnings:

  - The values [ANY] on the enum `foodType` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `ingredients` on the `Food` table. All the data in the column will be lost.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "foodType_new" AS ENUM ('PIZZA', 'PIZZA_ROLL', 'SUSHI', 'ALL');
ALTER TABLE "Ingredients" ALTER COLUMN "foodType" DROP DEFAULT;
ALTER TABLE "Ingredients" ALTER COLUMN "foodType" TYPE "foodType_new" USING ("foodType"::text::"foodType_new");
ALTER TYPE "foodType" RENAME TO "foodType_old";
ALTER TYPE "foodType_new" RENAME TO "foodType";
DROP TYPE "foodType_old";
ALTER TABLE "Ingredients" ALTER COLUMN "foodType" SET DEFAULT 'ALL';
COMMIT;

-- AlterTable
ALTER TABLE "Food" DROP COLUMN "ingredients";

-- AlterTable
ALTER TABLE "Ingredients" ADD COLUMN     "foodId" INTEGER,
ALTER COLUMN "foodType" SET DEFAULT 'ALL';

-- AddForeignKey
ALTER TABLE "Ingredients" ADD CONSTRAINT "Ingredients_foodId_fkey" FOREIGN KEY ("foodId") REFERENCES "Food"("id") ON DELETE SET NULL ON UPDATE CASCADE;
