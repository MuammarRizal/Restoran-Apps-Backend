import { Router } from "express";
import {
  getMenus,
  createOrder,
  getOrderById,
  getAllOrders,
  createMenus,
  updateOrder,
  updateQuantity,
} from "../controllers/MenusController.js";
import { ValidationOrder } from "../controllers/ValidationOrder.js";

const router = Router();

// GET - GET MENUS
router.get("/menus", getMenus);

// POST - CREATE MENUS
router.post("/menus", createMenus);
router.get("/orders", getAllOrders);
router.post("/order", createOrder);
router.get("/order/:id", getOrderById);
router.put("/order/:id", updateOrder);
router.put("/updateorder/:id", updateQuantity);
router.post("/validation/:id", ValidationOrder);
// router.delete("/:id", deleteMenus);

export default router;
