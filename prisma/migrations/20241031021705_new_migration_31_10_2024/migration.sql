/*
  Warnings:

  - Changed the type of `inStock` on the `products_ppkd` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE `products_ppkd` DROP COLUMN `inStock`,
    ADD COLUMN `inStock` JSON NOT NULL;
