import express from "express";
import fs from "fs/promises";

export const fileRouter = express.Router();
const filepath = "./data.json";

const loadDocuments = async () => {
  const fileContent = await fs.readFile(filepath, { encoding: "utf-8" });
  return JSON.parse(fileContent);
};

fileRouter.get("/", async (req, res) => {
  try {
    const data = await loadDocuments();
    res.json(data);
  } catch (err) {
    res.status(500).send("Error reading file");
  }
});

fileRouter.get("/update/:content", async (req, res) => {
  try {
    const { content } = req.params;
    const data = await loadDocuments();
    data.push(content);
    await fs.writeFile(filepath, JSON.stringify(data, null, 2));
    res.send("File updated successfully");
  } catch (err) {
    res.status(500).send("Error updating file");
  }
});

fileRouter.get("/search", async (req, res) => {
  try {
    const { q } = req.query;
    const data = await loadDocuments();

    if (!q) {
      return res.json(data);
    }

    const filtered = data.filter((doc) =>
      Object.values(doc).some((value) =>
        String(value).toLowerCase().includes(q.toLowerCase())
      )
    );

    res.json(filtered);
  } catch (err) {
    res.status(500).send("Error during search");
  }
});

fileRouter.get("/documents/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const data = await loadDocuments();

    const doc = data.find((d) => String(d.id) === id);
    if (!doc) {
      return res.status(404).json({ error: "Document not found" });
    }

    res.json(doc);
  } catch (err) {
    res.status(500).send("Error fetching document");
  }
});

fileRouter.post("/search", async (req, res) => {
  try {
    const { q } = req.query;
    const { fields } = req.body;
    const data = await loadDocuments();

    if (q && fields) {
      return res
        .status(400)
        .json({ error: "Cannot use both 'q' and 'fields' at the same time" });
    }

    if (fields) {
      const filtered = data.filter((doc) =>
        Object.entries(fields).every(
          ([key, value]) => String(doc[key]) === String(value)
        )
      );
      return res.json(filtered);
    }

    if (q) {
      const filtered = data.filter((doc) =>
        Object.values(doc).some((value) =>
          String(value).toLowerCase().includes(q.toLowerCase())
        )
      );
      return res.json(filtered);
    }

    res.json(data);
  } catch (err) {
    res.status(500).json({ error: "Error during POST search" });
  }
});
// GET Requests
//http://localhost:3000/files
//http://localhost:3000/files/search?q=hello
//http://localhost:3000/files/documents/1
//http://localhost:3000/files/update/helloSumanKaundinya

//POST Requests tested using Postman
//http://localhost:3000/files/search
//http://localhost:3000/files/search?q=hello   -- "error": "Cannot use both 'q' and 'fields' at the same time"
