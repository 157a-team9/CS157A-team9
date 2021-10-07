//imports a mysql connetor module
var mysql = require("mysql2");

//connects to mysql server
var connection = mysql.createConnection({
    host: "localhost",
    user: "mysql_user",
    password: "password",
    database: "157a_team9",
});
connection.connect();

module.exports = connection;
