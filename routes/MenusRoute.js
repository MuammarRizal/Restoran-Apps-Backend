import { Router } from "express";
import {
  getMenus,
  createOrder,
  getOrderById,
  getAllOrders,
} from "../controllers/MenusController.js";

const router = Router();

router.get("/menus", getMenus);
router.get("/orders", getAllOrders);
router.post("/order", createOrder);
router.get("/order/:id", getOrderById);
// router.put("/:id", updateMenus);
// router.delete("/:id", deleteMenus);

export default router;
