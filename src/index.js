const express = require("express");
var mysql = require("mysql");

const app = express();
const port = 3000;

var connection = mysql.createConnection({
    host: "localhost",
    user: "mysql_user",
    password: "password",
    database: "157a_team9",
});

connection.connect();

connection.query("USE 157a_team9", function (err, rows, fields) {
    if (err) throw err;
});

app.set("views", __dirname + "/views");
app.set("view engine", "ejs");

app.get("/", (req, res) => {
    connection.query(
        "SELECT * FROM 157a_team9.students;",
        function (err, rows, fields) {
            if (err) throw err;
            console.log(rows);
            res.render("index", {
                data: rows,
            });
        }
    );
});

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});
