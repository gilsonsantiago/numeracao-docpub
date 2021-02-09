const mysql = require('mysql');

const sqlconn = mysql.createPool({

    host : 'localhost',
    user : 'root',
    password : '',
    database : 'numeracaodoc',
    port : 3306

});

module.exports = sqlconn;