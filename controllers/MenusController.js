import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const testingMenus = async (req, res) => {
  res.send({ message: "Hello world" });
};
export const getMenus = async (req, res) => {
  try {
    const menus = await prisma.products_ppkd.findMany();
    res.send({ status: true, message: "Get all menus is successfully", menus });
  } catch (error) {
    res.status(500).json({
      message: "Error Server",
      errorMessage: error.message,
    });
  }
};

export const createMenus = async (req, res) => {
  const { name, image, items } = req.body;

  const stock = {
    quantity: 20,
    stock: true,
  };

  const dataRes = [{}];
  try {
    const createMenus = await prisma.products_PPKD.create({
      data: {
        name,
        image,
        items,
        inStock: JSON.stringify(stock),
        datas: JSON.stringify(dataRes),
      },
    });
    res.status(201).json({
      status: true,
      message: "Create Menus successfully",
      data: createMenus,
    });
  } catch (error) {
    res.send({
      status: false,
      message: "Error create Menus",
      errorMessage: error.message,
      errorDetail: error,
    });
  }
};

export const createOrder = async (req, res) => {
  const { username, data, table } = req.body;
  console.log(username);
  try {
    const createMenus = await prisma.orders.create({
      data: {
        username,

        cart: JSON.stringify(data),
        // data: JSON.stringify(data),
        data: JSON.stringify({
          process: false,
          table: table,
          timestamp: new Date(),
        }),
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

export const updateOrder = async (req, res) => {
  try {
    const orderId = Number(req.params.id);

    const updatedOrder = await prisma.orders.update({
      where: { id: orderId },
      data: {
        data: JSON.stringify(req.body.process),
      },
    });

    res.status(200).json({ updatedOrder, image: req.body.image });
  } catch (error) {
    res.status(500).json({
      errorDetail: error,
      errorMessage: error.message,
    });
  }
};

export const updateQuantity = async (req, res) => {
  try {
    const orderQuantity = Number(req.body.quantity);
    const orderId = Number(req.params.id);

    // Ambil produk berdasarkan orderId
    const product = await prisma.products_PPKD.findUnique({
      where: { id: orderId },
    });

    // Cek jika produk tidak ditemukan
    if (!product) {
      return res
        .status(404)
        .json({ status: false, message: "Product tidak ditemukan" });
    }

    // Parse inStock dari JSON string menjadi objek
    const inStock = JSON.parse(product.inStock);
    // Kurangi quantity dengan orderQuantity
    inStock.quantity -= orderQuantity;

    // Pastikan quantity tidak negatif
    if (inStock.quantity < 0) {
      return res
        .status(400)
        .json({ status: false, message: "Stok tidak cukup" });
    }

    // Update produk dengan inStock yang baru
    const updatedProduct = await prisma.products_PPKD.update({
      where: { id: orderId },
      data: {
        inStock: JSON.stringify(inStock),
      },
    });

    res.status(200).json({ product: updatedProduct });
  } catch (error) {
    res.status(500).json({
      errorDetail: error,
      errorMessage: error.message,
    });
  }
};
