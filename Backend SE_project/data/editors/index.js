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
const overviewAuthorList = async(EditorId) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('editors');
        const list = await pool.request()
                            .input('editorid', sql.Char(10), EditorId)
                            .query(sqlQueries.overviewAuthorList);
        return list.recordset;
    } catch (error) {
        return error.message;
    }
}

const editor_storyDataList = async(EditorId) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('editors');
        const list = await pool.request()
                            .input('editorid', sql.Char(10), EditorId)
                            .query(sqlQueries.editor_storydatalist);
        return list.recordset;
    } catch (error) {
        return error.message;
    }
}

const author_storyDataList = async(authorid) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('editors');
        const list = await pool.request()
                            .input('authorid', sql.Char(10), authorid)
                            .query(sqlQueries.author_storydatalist);
        return list.recordset;
    } catch (error) {
        return error.message;
    }
}

const calPairUnpairStory = async(EditorId) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('editors');
        const list = await pool.request()
                            .input('storyid', sql.Char(10), EditorId)
                            .query(sqlQueries.calPairUnpairStory);
        return list.recordset;
    } catch (error) {
        return error.message;
    }
}

const getAllChaptersofStory = async(storyid) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('editors');
        const list = await pool.request()
                            .input('storyid', sql.Char(10), storyid)
                            .query(sqlQueries.getAllChaptersofStory);
        return list.recordset;
    } catch (error) {
        return error.message;
    }
}

const getComment = async(ChapterId) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('editors');
        const list = await pool.request()
                            .input('chapterid', sql.Char(10), ChapterId)
                            .query(sqlQueries.getcmt);
        return list.recordset;
    } catch (error) {
        return error.message;
    }
}

const addComment = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('editors');
        const insert = await pool.request()
                            .input('cmtid', sql.Char(10), data.cmtid)
                            .input('chapterid', sql.Char(10), data.chapterid)
                            .input('editorid', sql.Char(10), data.editorid)
                            .input('content', sql.NText, data.content)
                            .query(sqlQueries.addcmt);
        return insert.recordset;
    } catch (error) {
        return error.message;
    }
}

module.exports = {
    countStory, overviewAuthorList, 
    editor_storyDataList, author_storyDataList, 
    calPairUnpairStory, getAllChaptersofStory,
    getComment, addComment
}