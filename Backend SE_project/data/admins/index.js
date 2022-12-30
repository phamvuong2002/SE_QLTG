'use strict';
const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');

const getAdminOverview = async () => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const overview = await pool.request().query(sqlQueries.getAdminOverview);
        return overview.recordset;
    } catch (error) {
        console.log(error.message);
    }
}

const getAllAccounts = async () => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const accountList = await pool.request().query(sqlQueries.getAccounts);
        return accountList.recordset;
    } catch (error) {
        console.log(error.message);
    }
}

const getAllAuthors = async () => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const authorList = await pool.request().query(sqlQueries.getAuthors);
        return authorList.recordset;
    } catch (error) {
        console.log(error.message);
    }
}

const getAllEditors = async () => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const editorList = await pool.request().query(sqlQueries.getEditors);
        return editorList.recordset;
    } catch (error) {
        console.log(error.message);
    }
}

const createAdmin = async (data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const insert = await pool.request()
                            .input('adminid', sql.Char(10), data.adminid)
                            .input('username', sql.Char(20), data.username)
                            .input('password', sql.Char(15), data.password)
                            .query(sqlQueries.createadmin);
        return insert.recordset;
    } catch (error) {
        return error.message;
    }
}

const createAuthor = async (data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const insert = await pool.request()
                            .input('authorid', sql.Char(10), data.authorid)
                            .input('username', sql.Char(20), data.username)
                            .input('password', sql.Char(15), data.password)
                            .query(sqlQueries.createadmin);
        return insert.recordset;
    } catch (error) {
        return error.message;
    }
}

const createEditor = async (data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const insert = await pool.request()
                            .input('editorid', sql.Char(10), data.editorid)
                            .input('username', sql.Char(20), data.username)
                            .input('password', sql.Char(15), data.password)
                            .query(sqlQueries.createadmin);
        return insert.recordset;
    } catch (error) {
        return error.message;
    }
}

// const updateAdmin = async (adminid, data) => {
//     try {
//         let pool = await sql.connect(config.sql);
//         const sqlQueries = await utils.loadSqlQueries('admins');
//         const update = await pool.request()
//                             .input('adminid', sql.Char(10), adminid)
//                             .input('adminid', sql.Char(10), data.adminid)
//                             .input('editorid', sql.Char(10), data.editorid)
//                             .input('password', sql.Char(15), data.password)
//                             .input('adminname', sql.Char(20), data.adminname)
//                             .input('email', sql.Char(30), data.email)
//                             .input('address', sql.Char(30), data.address)
//                             .input('phonenumber', sql.Char(15), data.phonenumber)
//                             .input('accountnumber', sql.Char(15), data.accountnumber)
//                             .input('salary', sql.Int, data.salary)
//                             .input('unpair', sql.Int, data.unpair)
//                         .query(sqlQueries.updateadmin);
//         return update.recordset;
//     } catch (error) {
//         return error.message;
//     }
// }

const deleteAdmin = async (adminid) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const delete_ = await pool.request()
                            .input('adminid', sql.Char(10), adminid)
                            .query(sqlQueries.deleteadmin);
        return delete_.recordset;
    } catch (error) {
        return error.message;
    }
}

const deleteAuthor = async (authorid) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const delete_ = await pool.request()
                            .input('authorid', sql.Char(10), authorid)
                            .query(sqlQueries.deleteadmin);
        return delete_.recordset;
    } catch (error) {
        return error.message;
    }
}

const deleteEditor = async (editorid) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const delete_ = await pool.request()
                            .input('editorid', sql.Char(10), editorid)
                            .query(sqlQueries.deleteadmin);
        return delete_.recordset;
    } catch (error) {
        return error.message;
    }
}
module.exports = {
    getAdminOverview, getAllAccounts, getAllAuthors, getAllEditors, createAdmin, createAuthor, createEditor, deleteAdmin, deleteAuthor, deleteEditor
}