-- AlterTable
CREATE SEQUENCE pizzaingredients_id_seq;
ALTER TABLE "PizzaIngredients" ALTER COLUMN "id" SET DEFAULT nextval('pizzaingredients_id_seq'),
ADD CONSTRAINT "PizzaIngredients_pkey" PRIMARY KEY ("id");
ALTER SEQUENCE pizzaingredients_id_seq OWNED BY "PizzaIngredients"."id";
