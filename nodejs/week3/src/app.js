import express from "express";
import dotenv from "dotenv";
import knexInstance from "./connection.js";

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

app.get("/api/contacts", async (req, res) => {
  let query = knexInstance.select("*").from("contacts");

  if ("sort" in req.query) {
    const allowedColumns = ["id", "name", "email", "phone"];
    const orderBy = req.query.sort?.toString();
    console.log("SQL", query.toSQL().sql);
    if (orderBy && allowedColumns.includes(orderBy)) {
      query = query.orderBy(orderBy);
    }
  }

  try {
    const data = await query;
    res.json({ data });
  } catch (e) {
    console.error(e);
    res.status(500).json({ error: "Internal server error" });
  }
});

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
