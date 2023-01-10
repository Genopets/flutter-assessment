import * as itemService from "../service/items.service"
import * as express from "express";

export const getAllItems = async (req: express.Request, res: express.Response) => {
    const response = await itemService.getAllItems();
    res.json(response)
}
 
