'use strict';
const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');

const getAllAdmins = async () => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const adminsList = await pool.request().query(sqlQueries.getadmins);
        return adminsList.recordset;
    } catch (error) {
        console.log(error.message);
    }
}
// const getAdminById = async(adminID) => {
//     try {
//         let pool = await sql.connect(config.sql);
//         const sqlQueries = await utils.loadSqlQueries('admins');
//         const admin = await pool.request()
//                             .input('adminid', sql.Char(10), adminID)
//                             .query(sqlQueries.getadminbyid);
//         return admin.recordset;
//     } catch (error) {
//         return error.message;
//     }
// }

// const getAdminsByLikeName = async(likename) => {
//     try {
//         let pool = await sql.connect(config.sql);
//         const sqlQueries = await utils.loadSqlQueries('admins');
//         const admins = await pool.request()
//                             .input('likename', sql.VarChar(30), likename)
//                             .query(sqlQueries.getadminbylikename);
//         return admins.recordset;
//     } catch (error) {
//         return error.message;
//     }
// }

// const createAdmin = async (data) => {
//     try {
//         let pool = await sql.connect(config.sql);
//         const sqlQueries = await utils.loadSqlQueries('admins');
//         const insert = await pool.request()
//                             .input('adminid', sql.Char(10), data.adminid)
//                             .input('adminid', sql.Char(10), data.adminid)
//                             .input('editorid', sql.Char(10), data.editorid)
//                             .input('password', sql.Char(15), data.password)
//                             .input('adminname', sql.Char(20), data.adminname)
//                             .input('email', sql.Char(30), data.email)
//                             .input('address', sql.Char(30), data.address)
//                             .input('phonenumber', sql.Char(15), data.phonenumber)
//                             .input('accountnumber', sql.Char(15), data.accountnumber)
//                             .input('salary', sql.Int, data.salary)
//                         .query(sqlQueries.createadmin);
//         return insert.recordset;
//     } catch (error) {
//         return error.message;
//     }
// }

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

// const deleteAdmin = async (adminid) => {
//     try {
//         let pool = await sql.connect(config.sql);
//         const sqlQueries = await utils.loadSqlQueries('admins');
//         const delete_ = await pool.request()
//                             .input('adminid', sql.Char(10), adminid)
//                             .query(sqlQueries.deleteadmin);
//         return delete_.recordset;
//     } catch (error) {
//         return error.message;
//     }
// }
module.exports = {
    getAllAdmins//, getAdminById, getAdminsByLikeName, createAdmin, updateAdmin, deleteAdmin
}