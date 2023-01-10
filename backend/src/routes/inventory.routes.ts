import * as express from "express";
import * as inventoryController from "../controllers/inventory.controller";

const inventoryRouter = express.Router();

inventoryRouter.get('/', inventoryController.getAllInventory)
inventoryRouter.post('/gifts', inventoryController.getANumberOfGifts)
inventoryRouter.post('/gift', inventoryController.getAGift)

export default inventoryRouter;