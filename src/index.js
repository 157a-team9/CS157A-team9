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

//Custom Middleware
async function checkState(req, res, next) {
    try {
        if (req.cookies.user) {
            const [rows, fields] = await connection.execute(
                "SELECT * FROM 157a_team9.seller WHERE user_id = ?;",
                [req.cookies.user.user_id]
            );
            if (rows.length > 0) {
                res.locals.state = "seller";
            } else {
                res.locals.state = "user";
            }
        }
        next();
    } catch (err) {
        console.log(err);
    }
}

app.use(checkState);

function isLoggedIn(req, res, next) {
    if (req.cookies.user) {
        next();
    } else {
        res.send("You must be logged in to access this page");
    }
}

//ROUTES
app.get("/", async (req, res) => {
    res.render("index", { user: req.cookies.user });
});

//LISTING ROUTES -----------------------------------------------------------
//LISTING GET ROUTES

app.get("/listings", async function (req, res) {
    const baseQuery = `SELECT * FROM 157a_team9.listing NATURAL JOIN manf_by
        WHERE (title LIKE ? OR description LIKE ?)
        AND brand_id LIKE ?
        AND listing_id IN 
            (SELECT listing_id FROM has_category WHERE category_id LIKE ?);`;

    const myListingsQuery = `SELECT * FROM 157a_team9.listing NATURAL JOIN 157a_team9.sold_by NATURAL JOIN manf_by
        WHERE user_id = ? 
        AND (title LIKE ? OR description LIKE ?) 
        AND brand_id LIKE ?
        AND listing_id IN 
            (SELECT listing_id FROM has_category WHERE category_id LIKE ?);`;

    const savedListingsQuery = `SELECT * FROM 157a_team9.listing NATURAL JOIN saves NATURAL JOIN manf_by
        WHERE user_id = ? 
        AND (title LIKE ? OR description LIKE ?) 
        AND brand_id LIKE ?
        AND listing_id IN 
            (SELECT listing_id FROM has_category WHERE category_id LIKE ?);`;

    try {
        let rows, fields;
        let search = req.query.search;
        if (search) {
            search = "%" + search + "%";
        } else {
            search = "%%";
        }

        let category_filter = req.query.category_id;
        if (category_filter && category_filter != -1) {
            category_filter = "%" + category_filter + "%";
        } else {
            category_filter = "%%";
        }

        let brand_filter = req.query.brand_id;
        if (brand_filter && brand_filter != -1) {
            brand_filter = "%" + brand_filter + "%";
        } else {
            brand_filter = "%%";
        }

        let page = req.query.page;

        if (page == "mysaved") {
            res.locals.onSavedPage = true;
            [rows, fields] = await connection.execute(savedListingsQuery, [
                req.cookies.user.user_id,
                search,
                search,
                brand_filter,
                category_filter,
            ]);
        } else if (page == "mylistings") {
            res.locals.onMyPage = true;
            [rows, fields] = await connection.execute(myListingsQuery, [
                req.cookies.user.user_id,
                search,
                search,
                brand_filter,
                category_filter,
            ]);
        } else {
            [rows, fields] = await connection.execute(baseQuery, [
                search,
                search,
                brand_filter,
                category_filter,
            ]);
        }

        let [categories, fields3] = await connection.execute(
            "SELECT * FROM 157a_team9.category;"
        );
        let [brands, fields2] = await connection.execute(
            "SELECT * FROM 157a_team9.brand;"
        );

        res.render("listings", {
            listings: rows,
            categories: categories,
            brands: brands,
        });
    } catch (err) {
        console.log(err);
    }
});

app.get("/listing/:listing_id", async function (req, res) {
    try {
        const [rows, fields] = await connection.execute(
            `SELECT * 
            FROM 157a_team9.listing NATURAL JOIN manf_by
            NATURAL JOIN 157a_team9.brand NATURAL JOIN 157a_team9.sold_by
            NATURAL JOIN 157a_team9.seller NATURAL JOIN 157a_team9.belongs_to NATURAL JOIN address
            NATURAL JOIN 157a_team9.user
            WHERE listing_id = ?;`,
            [req.params.listing_id]
        );
        const [categories, fields2] = await connection.execute(
            `SELECT category_id, category_name 
            FROM 157a_team9.category NATURAL JOIN has_category
            WHERE listing_id = ?;`,
            [req.params.listing_id]
        );
        console.log(rows);
        res.render("listing", { listing: rows[0], categories: categories });
    } catch (err) {
        console.log(err);
    }
});

app.get("/create-listing", isLoggedIn, async (req, res) => {
    try {
        let [categories, fields] = await connection.execute(
            "SELECT * FROM 157a_team9.category;"
        );
        let [brands, fields2] = await connection.execute(
            "SELECT * FROM 157a_team9.brand;"
        );
        return res.render("createListing", {
            categories: categories,
            brands: brands,
        });
    } catch (err) {
        console.log(err);
    }
});

app.get("/update-listing/:listing_id", isLoggedIn, async (req, res) => {
    try {
        const [rows, fields] = await connection.execute(
            `SELECT * 
            FROM 157a_team9.listing NATURAL JOIN manf_by
            NATURAL JOIN 157a_team9.brand
            WHERE listing_id = ?;`,
            [req.params.listing_id]
        );
        const [selected_categories, fields3] = await connection.execute(
            `SELECT category_id, category_name 
            FROM 157a_team9.category NATURAL JOIN has_category
            WHERE listing_id = ?;`,
            [req.params.listing_id]
        );
        let selectedCategories = [];
        for (const key in selected_categories) {
            selectedCategories.push(selected_categories[key].category_id);
        }

        res.locals.update = true;
        let [categories, fields4] = await connection.execute(
            "SELECT * FROM 157a_team9.category;"
        );
        let [brands, fields2] = await connection.execute(
            "SELECT * FROM 157a_team9.brand;"
        );
        console.log(rows);

        return res.render("createListing", {
            categories: categories,
            brands: brands,
            update: true,
            selectedCategories: selectedCategories,
            listing: rows[0],
        });
    } catch (err) {
        console.log(err);
    }
});

// LISTING POST ROUTES

app.post("/create-listing", async (req, res) => {
    try {
        let rows, fields;
        [rows, fields] = await connection.execute(
            "INSERT INTO 157a_team9.listing (title, description, price) VALUES (?, ?, ?);",
            [req.body.title, req.body.description, req.body.price * 100]
        );
        let listing_id = rows.insertId;
        await connection.execute(
            "INSERT INTO 157a_team9.sold_by (user_id, listing_id) VALUES (?, ?);",
            [req.cookies.user.user_id, listing_id]
        );
        await connection.execute(
            "INSERT INTO 157a_team9.manf_by (brand_id, listing_id) VALUES (?, ?);",
            [req.body.brand, listing_id]
        );
        for (let i = 0; i < req.body.categories.length; i++) {
            await connection.execute(
                "INSERT INTO 157a_team9.has_category (category_id, listing_id) VALUES (?, ?);",
                [req.body.categories[i], listing_id]
            );
        }

        res.redirect("/listings/");
    } catch (err) {
        console.log(err);
    }
});

app.post("/update-listing/:listing_id", async (req, res) => {
    try {
        // UPDATE LISTING TABLE
        let rows, fields;
        await connection.execute(
            "UPDATE 157a_team9.listing SET title = ?, description = ?, price = ? WHERE listing_id = ?;",
            [
                req.body.title,
                req.body.description,
                req.body.price * 100,
                req.params.listing_id,
            ]
        );

        // UPDATE MANF_BY TABLE
        await connection.execute(
            "UPDATE 157a_team9.manf_by SET brand_id = ? WHERE listing_id = ?;",
            [req.body.brand, req.params.listing_id]
        );

        // UPDATE CATEGORIES TABLE. This is done by deleting all has_category relations, and re-inserting the newly selected ones.
        await connection.execute(
            "DELETE FROM 157a_team9.has_category WHERE listing_id = ?;",
            [req.params.listing_id]
        );
        for (let i = 0; i < req.body.categories.length; i++) {
            await connection.execute(
                "INSERT INTO 157a_team9.has_category (category_id, listing_id) VALUES (?, ?);",
                [req.body.categories[i], req.params.listing_id]
            );
        }
        res.redirect("/listings/");
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
    res.redirect("/listings/?page=mysaved");
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
    res.redirect("/listings/?page=mysaved");
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
    res.redirect("/listings/?page=mylisting");
});

//REGISTRATION ROUTES -------------------------------------------------------------

app.get("/register", async (req, res) => {
    return res.render("register");
});

app.post("/register", async (req, res) => {
    try {
        const password_hash = await bcrypt.hash(req.body.password, saltRounds);
        const [rows, fields] = await connection.execute(
            "INSERT INTO 157a_team9.user (email, username, password_hash) VALUES (?, ?, ?);",
            [req.body.email, req.body.username, password_hash]
        );
        //res.send(rows);
        res.redirect("/login");
    } catch (err) {
        if (err.code == "ER_DUP_ENTRY") {
            res.send("Username or email already taken");
        }
        console.log(err);
    }
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

//LOGIN & LOGOUT ROUTES ----------------------------------------------------------

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
                res.locals.state == "user";
                return res.redirect("/");
            }
        }
        return res.send({ success: false });
    } catch (err) {
        console.log(err);
    }
});

app.get("/logout", async (req, res) => {
    res.clearCookie("user");
    res.redirect("/");
});

//Starts up the express web server at port 3000
app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});
