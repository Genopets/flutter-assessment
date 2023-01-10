import * as express from "express";
import * as itemsController  from "../controllers/items.controller";

const inventoryRouter = express.Router();

inventoryRouter.get('/', itemsController.getAllItems)
inventoryRouter.post('/', itemsController.getAllItems)


export default inventoryRouter;