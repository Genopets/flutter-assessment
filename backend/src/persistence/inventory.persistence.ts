// import PocketBase from 'pocketbase'
const PocketBase = require('pocketbase/cjs')

const dbHost = 'http://127.0.0.1:8090';
const pb = new PocketBase(dbHost);

async function fetchInventoryById(inventoryId: string){
  const list = await pb.collection('inventory').getOne(inventoryId);
  pb.collection('inventory').create
  return list;
}

async function fetchAllInventory(){
  const list = await pb.collection('inventory').getFullList();
  pb.collection('inventory').create
  return list;
}

async function updateInventory(inventoryId, modifiedInventory:Object){
  const list = await pb.collection('inventory').update(inventoryId,modifiedInventory);
  pb.collection('inventory').create
  return list;
}

async function getInventoryByItemId(inventoryId:string){
  const item = await pb.collection('inventory').getList(1,1,{
    filter: `item = "${inventoryId}"`,
  });
  return item;
}

async function createInventory(newInventory:Object){
  const response = await pb.collection('inventory').create(newInventory);
  return response;
}

// TODO INVENTORY MODEL
// collectionId: 'q1i3bnkmihj57c0',
// collectionName: 'inventory',
// created: '2023-01-07 19:16:40.351Z',
// id: 'npvj13tba8kr26g',
// item: 'FooDCTMCmHnBuW6GbFEw1xerktXR2Mi4NxzSq2TRELC6',
// qty: 2,
// updated: '2023-01-07 19:16:40.351Z',
// expand: {}
export { createInventory, updateInventory, fetchInventoryById, fetchAllInventory, getInventoryByItemId }