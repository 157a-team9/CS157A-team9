//imports a mysql connetor module
var mysql = require("mysql2");
//connects to mysql server

let pool = mysql.createPool({
    host: "localhost",
    user: "mysql_user",
    password: "password",
    database: "157a_team9",
});

const promisePool = pool.promise();

module.exports = promisePool;
