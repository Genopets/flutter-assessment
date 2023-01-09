import * as express from "express";
import { getItemsController } from "../controllers/items.controller";

const inventoryRouter = express.Router();

inventoryRouter.get('/', getItemsController)


export default inventoryRouter;