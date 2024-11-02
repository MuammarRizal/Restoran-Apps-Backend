import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import ProductRoute from "./routes/MenusRoute.js";

dotenv.config();

const app = express();
import os from 'os';

// Mendapatkan alamat IP lokal
const networkInterfaces = os.networkInterfaces();
let localIp;

for (const interfaceKey in networkInterfaces) {
  for (const inter of networkInterfaces[interfaceKey]) {
    if (inter.family === 'IPv4' && !inter.internal) {
      localIp = inter.address;
      break;
    }
  }
}


// middlewares
app.use(cors());
app.use(express.json());

// routes
app.use("/api", ProductRoute);

const PORT = process.env.PORT || 5000;
const HOST = "0.0.0.0"; // Host, bisa diubah sesuai kebutuhan

app.listen(PORT, HOST, () => {
  console.log(`Server up and running at http://${localIp}:${PORT}`);
});
