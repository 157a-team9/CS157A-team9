# meckeys

![alt text](https://github.com/157a-team9/CS157A-team9/blob/main/working_demo.PNG)

## Installation

Download [Node.js](https://nodejs.org/).

Clone the repository

```sh
cd Desktop   *(Replace desktop to the path of wherever you want the files to be)*
git clone https://github.com/157a-team9/CS157A-team9.git
```

Install the dependencies and devDependencies and start the server.

```sh
cd CS157A-team9
npm install
npm start
```

You will also need to setup a new schema and user in mysql. The schema/database name should be 157a_team9. The user should be mysql_user. The users password should be "password".

In the database make a table called students, with columns SJSU_ID, name, major, and add an entry to the table.
