'use strict';
const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');



const Login = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('login');
        const login = await pool.request()
                            .input('username', sql.VarChar(30), data.username)
                            .input('password', sql.VarChar(30), data.password)
                            .query(sqlQueries.login);
        return login.recordset;
    } catch (error) {
        return error.message;
    }
}

module.exports = {
    Login
}