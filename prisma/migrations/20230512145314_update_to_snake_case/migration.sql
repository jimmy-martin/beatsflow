/*
  Warnings:

  - You are about to drop the column `categoryId` on the `Beat` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Beat` table. All the data in the column will be lost.
  - You are about to drop the column `filePath` on the `Beat` table. All the data in the column will be lost.
  - You are about to drop the column `imageUrl` on the `Beat` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Beat` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Beat` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Category` table. All the data in the column will be lost.
  - You are about to drop the column `imageUrl` on the `Category` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Category` table. All the data in the column will be lost.
  - You are about to drop the column `beatId` on the `Transaction` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Transaction` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Transaction` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Transaction` table. All the data in the column will be lost.
  - You are about to drop the column `avatarUrl` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `firstName` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `lastName` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `User` table. All the data in the column will be lost.
  - Added the required column `category_id` to the `Beat` table without a default value. This is not possible if the table is not empty.
  - Added the required column `file_path` to the `Beat` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Beat` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `Beat` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Category` table without a default value. This is not possible if the table is not empty.
  - Added the required column `beat_id` to the `Transaction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Transaction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `Transaction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Beat` DROP FOREIGN KEY `Beat_categoryId_fkey`;

-- DropForeignKey
ALTER TABLE `Beat` DROP FOREIGN KEY `Beat_userId_fkey`;

-- DropForeignKey
ALTER TABLE `Transaction` DROP FOREIGN KEY `Transaction_beatId_fkey`;

-- DropForeignKey
ALTER TABLE `Transaction` DROP FOREIGN KEY `Transaction_userId_fkey`;

-- AlterTable
ALTER TABLE `Beat` DROP COLUMN `categoryId`,
    DROP COLUMN `createdAt`,
    DROP COLUMN `filePath`,
    DROP COLUMN `imageUrl`,
    DROP COLUMN `updatedAt`,
    DROP COLUMN `userId`,
    ADD COLUMN `category_id` INTEGER NOT NULL,
    ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `file_path` VARCHAR(191) NOT NULL,
    ADD COLUMN `image_url` VARCHAR(191) NULL DEFAULT 'beat_placeholder.png',
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL,
    ADD COLUMN `user_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `Category` DROP COLUMN `createdAt`,
    DROP COLUMN `imageUrl`,
    DROP COLUMN `updatedAt`,
    ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `image_url` VARCHAR(191) NULL DEFAULT 'category_placeholder.png',
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `Transaction` DROP COLUMN `beatId`,
    DROP COLUMN `createdAt`,
    DROP COLUMN `updatedAt`,
    DROP COLUMN `userId`,
    ADD COLUMN `beat_id` INTEGER NOT NULL,
    ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL,
    ADD COLUMN `user_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `User` DROP COLUMN `avatarUrl`,
    DROP COLUMN `createdAt`,
    DROP COLUMN `firstName`,
    DROP COLUMN `lastName`,
    DROP COLUMN `updatedAt`,
    ADD COLUMN `avatar_url` VARCHAR(191) NULL DEFAULT 'avatar_placeholder.png',
    ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `first_name` VARCHAR(191) NULL,
    ADD COLUMN `last_name` VARCHAR(191) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AddForeignKey
ALTER TABLE `Beat` ADD CONSTRAINT `Beat_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Beat` ADD CONSTRAINT `Beat_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `Category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Transaction` ADD CONSTRAINT `Transaction_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Transaction` ADD CONSTRAINT `Transaction_beat_id_fkey` FOREIGN KEY (`beat_id`) REFERENCES `Beat`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
