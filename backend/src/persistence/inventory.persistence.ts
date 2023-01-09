// import PocketBase from 'pocketbase'
const PocketBase = require('pocketbase/cjs')

async function getAll(){
  const pb = new PocketBase('http://127.0.0.1:8090');
  const list = await pb.collection('inventory').getFullList();
  console.log(list);

  return list;
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
export {getAll}