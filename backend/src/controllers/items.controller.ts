import { getItemService as getItemService } from "../service/items.service"
import * as express from "express";

async function getItemsController(req: express.Request, res: express.Response) {
    const datos = await getItemService()
    res.json(datos)
 }
 
 export { getItemsController }