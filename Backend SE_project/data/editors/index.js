'use strict';
const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');


const countStory = async(EditorId) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('editors');
        const num = await pool.request()
                            .input('editorid', sql.Char(10), EditorId)
                            .query(sqlQueries.countStory);
        return num.recordset;
    } catch (error) {
        return error.message;
    }
}
const storyDatalist = async(EditorId) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('editors');
        const list = await pool.request()
                            .input('editorid', sql.Char(10), EditorId)
                            .query(sqlQueries.storydatalist);
        return list.recordset;
    } catch (error) {
        return error.message;
    }
}

module.exports = {
    countStory, storyDatalist
}