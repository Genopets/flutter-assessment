import * as express from "express";
import { getInventoryController } from "../controllers/inventory.controller";

const inventoryRouter = express.Router();

inventoryRouter.get('/', getInventoryController)


export default inventoryRouter;