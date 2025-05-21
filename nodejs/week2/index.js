import express from "express";
import { fileRouter } from "./customRouter.js";
const port = 3000;
const app = express();
app.use(express.json()); // without this i got 500 error and search was not working in Postman

app.use("/files", fileRouter);

app.listen(port, (err) => {
  if (err) {
    console.error("Error starting server:", err);
  } else {
    console.log(`Server is running on http://localhost:${port}`);
  }
});
