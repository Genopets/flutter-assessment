import { getAll } from "../persistence/items.persistence"


async function getItemService() {
    return await getAll()
 }
 
 export { getItemService }