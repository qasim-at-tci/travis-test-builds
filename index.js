const express = require("express");

const app = express();

app.get("/", (req, res) => res.json({ info: "Hello, World!" }));

app.listen(3000, "127.0.0.1", () => console.log("Listening on 3000..."));
