import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const getMenus = async (req, res) => {
  try {
    const menus = await prisma.products_PPKD.findMany();
    res.send({ status: true, message: "Get all menus is successfully", menus });
  } catch (error) {
    res.status(500).json({
      message: "Error Server",
    });
  }
};

export const createOrder = async (req, res) => {
  const { username, data } = req.body;

  try {
    const createMenus = await prisma.orders.create({
      data: {
        username,
        cart: JSON.stringify(data),
        data: JSON.stringify(data),
      },
    });

    return res.status(201).json({
      status: true,
      message: "Created product successfully",
      data: createMenus,
    });
  } catch (error) {
    res.status(400).json({
      message: "Create data error",
      messageError: error.message,
      errorDetail: error,
    });
  }
};

export const getAllOrders = async (req, res) => {
  try {
    const orders = await prisma.orders.findMany();
    res.send({
      status: true,
      message: "Get all menus is successfully",
      orders,
    });
  } catch (error) {
    res.status(500).json({
      message: "Error Server",
    });
  }
};

export const getOrderById = async (req, res) => {
  const { id } = req.params;
  try {
    const orderDetail = await prisma.orders.findUnique({
      where: { id: Number(id) },
    });

    if (!orderDetail) {
      return res.status(200).json({
        message: "Data not found",
        data: {
          detail: orderDetail,
          status: false,
        },
      });
    }
    return res.status(200).json({
      message: "Get order detail succesffully",
      data: {
        detail: orderDetail,
      },
    });
  } catch (error) {
    res.status(400).json({
      message: "Error in get data",
      errorMessage: error.message,
      errorDetail: error,
    });
  }
};
