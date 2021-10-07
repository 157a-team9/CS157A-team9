//imports express
const express = require("express");

//import the db connection
const connection = require("./database/connection.js");

//Creates an express webapp
const app = express();
const port = 3000;

//Sets up templeting the templating engine ejs, for html templates with variable inputs
app.set("views", __dirname + "/views");
app.set("view engine", "ejs");

//Exposes a new route. req is the request object, res is the response object
app.get("/", (req, res) => {
    connection.query(
        "SELECT * FROM 157a_team9.students;",
        function (err, rows, fields) {
            if (err) throw err;
            console.log(rows);
            //Sends the html template from the views directory to the client
            return res.render("index", {
                data: rows,
            });
        }
    );
});

//Starts up the express web server at port 3000
app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});
