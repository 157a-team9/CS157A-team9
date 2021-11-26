//imports express
const express = require("express");
const bcrypt = require("bcrypt");
const cookieParser = require("cookie-parser");

const saltRounds = 10;
//import the db connection
const connection = require("./database/connection.js");

//Creates an express webapp
const app = express();
const port = 3000;

//Sets up templeting the templating engine ejs, for html templates with variable inputs
app.set("views", __dirname + "/views");
app.set("view engine", "ejs");

//Setup Middleware
app.use(express.json());
app.use(express.urlencoded());
app.use(cookieParser());

//ROUTES
app.get("/", async (req, res) => {
    res.render("index", (user = req.cookies.user));
});

app.get("/register", async (req, res) => {
    return res.render("register");
});
app.get("/register-seller", async (req, res) => {
    return res.render("register-seller");
});

app.post("/register-seller", async (req, res) => {
    const insertSellerQ =
        "INSERT INTO 157a_team9.seller (user_id, phone, isValid) VALUES (?, ?, 1);";
    const insertAddressQ =
        "INSERT INTO 157a_team9.address (address, city, state, zipcode) VALUES (?, ?, ?, ?);";
    const insertBelongsQ =
        "INSERT INTO 157a_team9.belongs_to (user_id, address_id) VALUES (?, ?);";

    try {
        console.log(req.body);
        let [rows, fields] = await connection.execute(insertSellerQ, [
            req.cookies.user.user_id,
            req.body.phone,
        ]);
        [rows, fields] = await connection.execute(insertAddressQ, [
            req.body.address,
            req.body.city,
            req.body.state,
            req.body.zipcode,
        ]);
        let address_id = rows.insertId;
        [rows, fields] = await connection.execute(insertBelongsQ, [
            req.cookies.user.user_id,
            address_id,
        ]);
        res.redirect("/");
    } catch (err) {
        console.log(err);
    }
});

app.get("/listing", async function (req, res) {
    try {
        const [rows, fields] = await connection.execute(
            "SELECT * FROM 157a_team9.listing;"
        );
        res.render("listings", (listings = rows));
    } catch (err) {
        console.log(err);
    }
});

app.post("/save-listing/:listing_id", async function (req, res) {
    try {
        const [rows, fields] = await connection.execute(
            "INSERT INTO 157a_team9.saves (user_id, listing_id) VALUES (?, ?);",
            [req.cookies.user.user_id, req.params.listing_id]
        );
    } catch (err) {
        console.log(err);
    }
    res.redirect("/listings/?page=mysaved&search=");
});

app.post("/unsave-listing/:listing_id", async function (req, res) {
    try {
        const [rows, fields] = await connection.execute(
            "DELETE FROM 157a_team9.saves WHERE user_id = ? AND listing_id = ?;",
            [req.cookies.user.user_id, req.params.listing_id]
        );
    } catch (err) {
        console.log(err);
    }
    res.redirect("/listings/?page=mysaved&search=");
});

app.post("/delete-listing/:listing_id", async function (req, res) {
    try {
        const [rows, fields] = await connection.execute(
            "DELETE FROM 157a_team9.listing WHERE listing_id = ?;",
            [req.params.listing_id]
        );
    } catch (err) {
        console.log(err);
    }
    res.redirect("/listings/?page=mylisting&search=");
});

app.post("/register", async (req, res) => {
    try {
        const password_hash = await bcrypt.hash(req.body.password, saltRounds);
        const [rows, fields] = await connection.execute(
            "INSERT INTO 157a_team9.user (email, username, password_hash) VALUES (?, ?, ?);",
            [req.body.email, req.body.username, password_hash]
        );
        res.send(rows);
    } catch (err) {
        if (err.code == "ER_DUP_ENTRY") {
            res.send("Username or email already taken");
        }
        console.log(err);
    }
});

app.get("/login", async (req, res) => {
    return res.render("login");
});

app.post("/login", async (req, res) => {
    try {
        const [rows, fields] = await connection.execute(
            "SELECT * FROM 157a_team9.user WHERE user.email LIKE ?;",
            [req.body.email]
        );
        let valid = false;
        if (rows[0]) {
            let user = rows[0];
            valid = await bcrypt.compare(req.body.password, user.password_hash);
            if (valid) {
                res.cookie("user", user);
                return res.send({
                    success: true,
                    user: {
                        user_id: user.user_id,
                        email: user.email,
                        username: user.username,
                    },
                });
            }
        }
        return res.send({ success: false });
    } catch (err) {
        console.log(err);
    }
});

//Starts up the express web server at port 3000
app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});
