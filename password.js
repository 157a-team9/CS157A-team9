const bcrypt = require("bcrypt");
const saltRounds = 10;

bcrypt.hash("password", saltRounds, function (err, hash) {
    console.log(hash);
});

console.log("hello");
