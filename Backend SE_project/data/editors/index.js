'use strict';
const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');

const getAllEditor = async () => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('editors');
        const editorList = await pool.request().query(sqlQueries.geteditor);
        return editorList.recordset;
    } catch (error) {
        console.log(error.message);
    }
}
const getEditorById = async(editorID) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('editors');
        const editor = await pool.request()
                            .input('editorid', sql.Char(10), editorID)
                            .query(sqlQueries.geteditorbyid);
        return editor.recordset;
    } catch (error) {
        return error.message;
    }
}

const getEditorByLikeName = async(likename) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('editors');
        const editor = await pool.request()
                            .input('likename', sql.VarChar(30), likename)
                            .query(sqlQueries.geteditorbylikename);
        return editor.recordset;
    } catch (error) {
        return error.message;
    }
}

const createEditor = async (data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('editors');
        const insert = await pool.request()
                            .input('editorid', sql.Char(10), data.editorid)
                            .input('adminid', sql.Char(10), data.adminid)
                            .input('editorid', sql.Char(10), data.editorid)
                            .input('password', sql.Char(15), data.password)
                            .input('editorname', sql.Char(20), data.editorname)
                            .input('email', sql.Char(30), data.email)
                            .input('address', sql.Char(30), data.address)
                            .input('phonenumber', sql.Char(15), data.phonenumber)
                            .input('accountnumber', sql.Char(15), data.accountnumber)
                            .input('salary', sql.Int, data.salary)
                        .query(sqlQueries.createeditor);
        return insert.recordset;
    } catch (error) {
        return error.message;
    }
}

const updateEditor = async (editorid, data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('editors');
        const update = await pool.request()
                            .input('editorid', sql.Char(10), editorid)
                            .input('adminid', sql.Char(10), data.adminid)
                            .input('editorid', sql.Char(10), data.editorid)
                            .input('password', sql.Char(15), data.password)
                            .input('editorname', sql.Char(20), data.editorname)
                            .input('email', sql.Char(30), data.email)
                            .input('address', sql.Char(30), data.address)
                            .input('phonenumber', sql.Char(15), data.phonenumber)
                            .input('accountnumber', sql.Char(15), data.accountnumber)
                            .input('salary', sql.Int, data.salary)
                            .input('unpair', sql.Int, data.unpair)
                        .query(sqlQueries.updateeditor);
        return update.recordset;
    } catch (error) {
        return error.message;
    }
}

const deleteEditor = async (editorid) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('editors');
        const delete_ = await pool.request()
                            .input('editorid', sql.Char(10), editorid)
                            .query(sqlQueries.deleteeditor);
        return delete_.recordset;
    } catch (error) {
        return error.message;
    }
}
module.exports = {
    getAllEditor, getEditorById, getEditorByLikeName, createEditor, updateEditor, deleteEditor
}