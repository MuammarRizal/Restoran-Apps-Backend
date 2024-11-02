/*
  Warnings:

  - You are about to drop the column `category` on the `products_ppkd` table. All the data in the column will be lost.
  - Added the required column `datas` to the `Products_PPKD` table without a default value. This is not possible if the table is not empty.
  - Added the required column `items` to the `Products_PPKD` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `products_ppkd` DROP COLUMN `category`,
    ADD COLUMN `datas` JSON NOT NULL,
    ADD COLUMN `items` JSON NOT NULL;
