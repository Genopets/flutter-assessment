import { getInventoryService } from "../service/inventory.service"
import * as express from "express";

async function getInventoryController(req: express.Request, res: express.Response) {
    const datos = await getInventoryService()
    res.json(datos)
 }
 
 export { getInventoryController }