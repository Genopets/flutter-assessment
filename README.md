# Genopark

This repo contains a simple mobile app with the backend powered by [Pocketbase](https://pocketbase.io) and the front-end in Flutter.

#### Challenge Features
* **[x] <del>Create a subscription to the database so that whenever the inventory’s items change, the UI will update automatically<del>**
 * **How?** Using flutter's pocketbase package a suscription that listens to the inventory collection was openned. The inventoryList is observed in each pocketbase change
* **[x] <del>Create an API endpoint using Node.js (You may use whatever framework you are most familiar with) to randomly gift the user an item. (Do not mutate the database directly from the mobile app)<del>**
 * **How?** Using ExpressJs I built a restApi with the multilayer architecture with two endpoints one to gift one item and another to gift multiple items, the last one depends on the firstone at the service level.
* **[x] <del>Create an interaction that pops a modal. Inside the modal there should be a number selector that specifies the number of random items you want to be gifted and a “GO” button. Upon pressing “GO”, the endpoint in #2 should be consumed to gift the user an item. This should automatically update in the UI using #1.<del>** 
 * **How?** A button is placed in the homescreen that allows you to pop in a modal in order to choose the amount of gifts you want to receive.
 
#### Challenge screenshots
<p align="center">
<img src="https://github.com/zphoenixz/geno-park/blob/main/screen0.png" width="400" height="400">
</p>
<p align="center">
<img src="https://github.com/zphoenixz/geno-park/blob/main/screen1.png" width="400" height="400">
</p>
<p align="center">
<img src="https://github.com/zphoenixz/geno-park/blob/main/screen2.png" width="400" height="400">
</p>

#### Project's tech stack
* **Frontend:** Flutter version: 3.3.10
* **Backend:** NodeJs's ExpressJs written in Typescript
* **DB:** Pocketbase

#### Running
**1. Get the repo**
```
git clone https://github.com/zphoenixz/geno-park.git
```
**2. Go to the DB folder and start the docker container**
```
cd backend/DB
```
```
docker-compose up -d
```
**3. Go to the backend folder and start the NodeJs app**
```
cd backend 
```
```
npx ts-node src/index.ts
```
**4. Go the the flutter folder and start preferred mobile emulator**
```
cd flutter_inventory
```
```
Use sdk debug run
```

## Architecture

The Flutter application uses the following libraries:

- [MobX](https://pub.dev/packages/mobx)

This is used for state management. MobX follows the Reactive Programming paradigm and uses code generation to prevent too much boilerplate

- [Flutter Modular](https://pub.dev/packages/flutter_modular)

This is used for dependency-injection. Namely, we use it to inject the MobX store `app_store` wherever we need it
