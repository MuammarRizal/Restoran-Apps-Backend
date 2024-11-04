import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import ProductRoute from "./routes/MenusRoute.js";
import https from "https";
import fs from "fs";
dotenv.config();

const app = express();
import os from "os";

// Mendapatkan alamat IP lokal
const networkInterfaces = os.networkInterfaces();
let localIp;

for (const interfaceKey in networkInterfaces) {
  for (const inter of networkInterfaces[interfaceKey]) {
    if (inter.family === "IPv4" && !inter.internal) {
      localIp = inter.address;
      break;
    }
  }
}

const options = {
  key: fs.readFileSync("./certificates/key.pem"),
  cert: fs.readFileSync("./certificates/cert.pem"),
};

// middlewares
app.use(cors());
app.use(express.json());

// routes
app.use("/api", ProductRoute);

const PORT = 3002;
const HOST = "0.0.0.0"; // Host, bisa diubah sesuai kebutuhan

https.createServer(options, app).listen(PORT, HOST, () => {
  console.log("SSL Added");
  console.log(`Server up and running at http://${localIp}:${PORT}`);
});
