import { createInventory, updateInventory, fetchAllInventory, getInventoryByItemId } from "../persistence/inventory.persistence"
import { fetchAllItems } from "../persistence/items.persistence"


export const getAllInventory = async() => {
    return await fetchAllInventory()
 }

 export const getAGift = async() => {
    const availableItems = await fetchAllItems();
    const randomIndex = Math.floor(Math.random() * availableItems.length);
    const ramdomItem = availableItems[randomIndex];
    const ramdomItemId = ramdomItem.itemId;
    
    const inventoryItem = await getInventoryByItemId(ramdomItemId);
    if(inventoryItem.items.length == 0){
        const newInventory = {
            "item": ramdomItemId,
            "qty": 1,
        };
        return await createInventory(newInventory);
    }
    
    const existingInventory = inventoryItem.items[0];
    const modifiedInventory = {
        "qty": existingInventory.qty += 1,
    };
    ;
    return await updateInventory(existingInventory.id, modifiedInventory);
 }
