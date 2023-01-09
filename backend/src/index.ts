import * as express from 'express';
import * as cors from "cors";
import itemRouter from "./routes/items.routes";
import inventoryRouter from "./routes/inventory.routes";

const app = express();

app.use(cors());
app.use(express.urlencoded({ extended: false }));
app.use('/api/v1/items', itemRouter);
app.use('/api/v1/inventory', inventoryRouter);

const PORT = 8080
const server = app.listen(PORT, () => {
   console.log(`Express server listening on port`, server.address())
})
server.on('error', error => console.error(`Server error`, error))