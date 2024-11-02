import { Router } from "express";
import {
  getMenus,
  createOrder,
  getOrderById,
  getAllOrders,
  createMenus,
  updateOrder,
} from "../controllers/MenusController.js";

const router = Router();

// GET - GET MENUS
router.get("/menus", getMenus);

// POST - CREATE MENUS
router.post("/menus", createMenus);
router.get("/orders", getAllOrders);
router.post("/order", createOrder);
router.get("/order/:id", getOrderById);
router.put("/order/:id", updateOrder);
// router.delete("/:id", deleteMenus);

export default router;
