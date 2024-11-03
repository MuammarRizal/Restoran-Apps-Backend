import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const ValidationOrder = async (req, res) => {
  const idQr = Number(req.params.id);

  try {
    const existingOrder = await prisma.validationOrder.findUnique({
      where: {
        id_qr: idQr,
      },
    });

    if (Number(idQr) > 100 || Number(idQr) <= 0) {
      return res.status(400).json({
        status: false,
        message: "QR Tidak valid",
        data: {},
      });
    }

    if (existingOrder) {
      return res.status(409).json({
        status: false,
        message: "Anda sudah memesan makanan",
        data: existingOrder,
      });
    }

    const newOrder = await prisma.validationOrder.create({
      data: {
        id_qr: idQr,
        data: {},
      },
    });

    return res.status(201).json({
      status: true,
      message: "Data created successfully",
      data: newOrder,
    });
  } catch (error) {
    return res.status(500).json({
      status: false,
      message: error.message,
    });
  }
};
