-- CreateTable
CREATE TABLE `ValidationOrder` (
    `id_qr` INTEGER NOT NULL,
    `data` JSON NOT NULL,

    PRIMARY KEY (`id_qr`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
