import { fetchAllItems } from "../persistence/items.persistence"


export const getAllItems = async() => {
    return await fetchAllItems()
 }
