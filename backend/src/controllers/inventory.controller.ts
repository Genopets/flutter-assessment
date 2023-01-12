import * as inventoryService from "../service/inventory.service"
import * as express from "express";

export const getAllInventory = async (req: express.Request, res: express.Response) => {
    const response = await inventoryService.getAllInventory()
    res.status(200).json(response)
 }
//TODO implement
 export const getANumberOfGifts = async (req: express.Request, res: express.Response) => {
    const request = req.body;
    //await 
    inventoryService.getANumberOfGifts(request)
    res.status(200).json("Sucessful")
 }

 export const getAGift = async (req: express.Request, res: express.Response) => {
    const response = await inventoryService.getAGift()
    res.status(200).json(response)
 }
 
