import knex from "knex";
const knexInstance = knex({
  client: "mysql2",
  connection: {
    host: "127.0.0.1",
    port: 3306,
    user: "root",
    password: "Shanaya@402",
    database: "hyf_node_week1",
  },
});

import express from "express";
const app = express();
const port = 3000;

app.get("/", (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html>
      <head>
        <title>User Count</title>
      </head>
      <body>
        <h1>Total Users</h1>
        <h2 id="count">Loading...</h2>
        <script>
          async function updateCount() {
            const res = await fetch('/user-count');
            const data = await res.json();
            document.getElementById('count').textContent = data.count;
          }
          updateCount();
          setInterval(updateCount, 2000); 
        </script>
      </body>
    </html>
  `);
});

app.get("/info", async (req, res) => {
  const [rows] = await knexInstance.raw("SELECT VERSION()");

  res.json({
    nodeVersion: process.version,
    mysqlVersion: rows[0]["VERSION()"],
  });
});
app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
app.get("/users", async (req, res) => {
  try {
    const users = await knexInstance.select("*").from("users");
    console.log(users);
    res.json(users);
  } catch (err) {
    console.error("Error fetching users:", err);
    res.status(500).send("Error fetching users");
  }
});
// All users sorted by ID
app.get("/all-users", async (req, res) => {
  const users = await knexInstance("users").select().orderBy("id");
  res.json(users);
});

// Unconfirmed users (confirmed_at is NULL)
app.get("/unconfirmed-users", async (req, res) => {
  const users = await knexInstance("users").whereNull("confirmed_at");
  res.json(users);
});

// Users with Gmail
app.get("/gmail-users", async (req, res) => {
  const users = await knexInstance("users").where(
    "email",
    "like",
    "%@gmail.com"
  );
  res.json(users);
});

// Users created in 2022
app.get("/2022-users", async (req, res) => {
  const users = await knexInstance("users").whereBetween("created_at", [
    "2022-01-01",
    "2022-12-31",
  ]);
  res.json(users);
});

// User count
app.get("/user-count", async (req, res) => {
  const [{ count }] = await knexInstance("users").count("id as count");
  res.json({ count });
});

// Last name count, sorted
app.get("/last-name-count", async (req, res) => {
  const result = await knexInstance("users")
    .select("last_name")
    .count("id as count")
    .groupBy("last_name")
    .orderBy("last_name");
  res.json(result);
});

// First user or 404
app.get("/first-user", async (req, res) => {
  const user = await knexInstance("users").first().orderBy("id");
  if (user) {
    res.json(user);
  } else {
    res.status(404).send("No users found");
  }
});
