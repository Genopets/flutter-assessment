import { getAll } from "../persistence/inventory.persistence"


async function getInventoryService() {
    return await getAll()
 }
 
 export { getInventoryService }