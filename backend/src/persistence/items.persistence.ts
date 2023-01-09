// import PocketBase from 'pocketbase'
const PocketBase = require('pocketbase/cjs')

async function getAll(){
  const pb = new PocketBase('http://127.0.0.1:8090');
  const list = await pb.collection('items').getFullList();
  return list;
}

// TODO ITEM MODEL
// collectionId: 'ehv0o0k84n3tmwm',
// collectionName: 'items',
// created: '2023-01-07 19:10:58.265Z',
// description: "An equippable Eye Augment that morphs a Genopet's appearance and performance.",
// id: 't9uthx1zgel25yw',
// itemId: 'AugMiScuycV4gBhC5qonE35eSVkFshBcXTxnBsUhTUKy',
// name: 'Agpo Eye',
// type: 'Augment',
// updated: '2023-01-07 19:10:58.265Z',
// variant: '',
// expand: {}
export {getAll}