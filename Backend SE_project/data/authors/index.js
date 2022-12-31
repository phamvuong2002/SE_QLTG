'use strict';
const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');

const countStory = async(AuthorID) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const num = await pool.request()
                            .input('authorid', sql.Char(10), AuthorID)
                            .query(sqlQueries.countStory);
        return num.recordset;
    } catch (error) {
        return error.message;
    }
}
const storyDatalist = async(AuthorID) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const list = await pool.request()
                            .input('authorid', sql.Char(10), AuthorID)
                            .query(sqlQueries.storydatalist);
        return list.recordset;
    } catch (error) {
        return error.message;
    }
}
const calPairUnpairStory = async(StoryID) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const value = await pool.request()
                            .input('storyid', sql.Char(10), StoryID)
                            .query(sqlQueries.calPairUnpairStory);
        return value.recordset;
    } catch (error) {
        return error.message;
    }
}
const getAllChaptersofStory = async(StoryID) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const chapters = await pool.request()
                            .input('storyid', sql.Char(10), StoryID)
                            .query(sqlQueries.getallchaptersofstory);
        return chapters.recordset;
    } catch (error) {
        return error.message;
    }
}
module.exports = {
    countStory, storyDatalist, calPairUnpairStory, getAllChaptersofStory
}