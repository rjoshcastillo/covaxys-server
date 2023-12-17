const express = require("express");
const mysql = require("mysql2");
const app = express();
const cors = require("cors");

app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  host: "localhost",
  user: "covaxys",
  password: "@covaxys123",
  database: "covaxysdb",
});

db.connect((error) => {
  if (error) {
    console.error("Connection Error: ", error);
  } else {
    console.log("Connected to database");
  }
});

app.get("/", async (req, res) => {
  res.send("Welcome to covaxys API");
});

//ENDPOINT FOR GETTING ALL DISEASES
app.get("/api/get-diseases", async (req, res) => {
  await db
    .promise()
    .query("SELECT * FROM diseases")
    .then((result) => {
      res.send(result[0]);
    })
    .catch((err) => {
      console.error(err);
      res.status(500).json({
        message: "Internal Server Error",
        error: err.message,
      });
    });
});

//ENDPOINT FOR SEARCHING DISEASES BY NAME
//http://localhost:3000/api/get-disease?name=Eczema
app.get("/api/get-disease", async (req, res) => {
  const diseaseName = req.query.name;
  console.log("Search term:", diseaseName);

  try {
    const [rows] = await db
      .promise()
      .query("SELECT * FROM diseases WHERE diseaseName LIKE ?", [
        `%${diseaseName}%`,
      ]);

    if (rows.length > 0) {
      res.json(rows);
    } else {
      res.status(404).json({ message: "Disease not found" });
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({
      message: "Internal Server Error",
      error: err.message,
    });
  }
});

// Login endpoint
app.post('/api/login', async (req, res) => {
  const { username, password } = req.body;

  try {
    const [rows] = await db.promise().query('SELECT * FROM users WHERE username = ? AND password = ?', [
      username,
      password,
    ]);

    if (rows.length > 0) {
      const user = rows[0];
      res.json({ success: true, user });
    } else {
      res.status(404).json({ success: false, error: 'Invalid username or password' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({
      message: 'Internal Server Error',
      error: error.message,
    });
  }
});

//ENDPOINT FOR UPDATING DISEASE
app.put("/api/update-disease", async (req, res) => {
  const { id, diseaseName, image, description, symptoms, remedy, treatment } =
    req.body;

  try {
    const [data] = await db
      .promise()
      .query(
        "UPDATE diseases SET diseaseName=?, image=?, description=?, symptoms=?, remedy=?, treatment=? WHERE id = ?",
        [diseaseName, image, description, JSON.stringify(symptoms), JSON.stringify(remedy), JSON.stringify(treatment), id]
      );

    if (data.affectedRows > 0) {
      res.json({ message: "Successfully updated" });
    } else {
      res.status(404).json({ message: "Disease not found" });
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({
      message: "Internal Server Error",
      error: err.message,
    });
  }
});

//ENDPOINT FOR DELETE DISEASE
app.delete("/api/delete-disease", async (req, res) => {
  const diseaseId = req.query.id;
  console.log(diseaseId);

  try {
    const [data] = await db
      .promise()
      .query("DELETE FROM diseases WHERE id = ?", [diseaseId]);

    if (data.affectedRows > 0) {
      res.json("Successfully deleted");
    } else {
      res.status(404).json({ message: "Disease not found" });
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({
      message: "Internal Server Error",
      error: err.message,
    });
  }
});

//ENDPOINT FOR ADDING NEW DISEASE
//http://localhost:3000/api/add-disease

/* SAMPLE REQUEST BODY
    {
        "diseaseName": "Eczema 1",
        "image": "TEST IMAGE 1",
        "description": "TEST DESCRIPTION",
        "symptoms": "TEST symptoms",
        "remedy": "TEST REMEDY",
        "treatment": "TEST TREATMENT"
    }
*/
app.post("/api/add-disease", async (req, res) => {
  try {
    const { diseaseName, image, description, symptoms, remedy, treatment } =
      req.body;

    await db.promise().query(
      `INSERT INTO diseases (diseaseName, image, description, symptoms, remedy, treatment) 
       VALUES (?, ?, ?, ?, ?, ?)`,
      [diseaseName, image, description, JSON.stringify(symptoms), JSON.stringify(remedy), JSON.stringify(treatment)]
    );
    res.status(202).json({
      message: "Disease Added",
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({
      message: "Internal Server Error",
      error: err.message,
    });
  }
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
