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

const getDraft = async(StoryID) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const draft = await pool.request()
                            .input('storyid', sql.Char(10), StoryID)
                            .query(sqlQueries.getdraft);
        return draft.recordset;
    } catch (error) {
        return error.message;
    }
}

const getOutline = async(StoryID) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const outline = await pool.request()
                            .input('storyid', sql.Char(10), StoryID)
                            .query(sqlQueries.getoutline);
        return outline.recordset;
    } catch (error) {
        return error.message;
    }
}

const createStory = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const insert = await pool.request()
                            .input('storyid', sql.Char(10), data.storyid)
                            .input('authorid', sql.Char(10), data.authorid)
                            .input('storyname', sql.NChar(30), data.storyname)
                            .input('content', sql.NText, data.content)
                            .query(sqlQueries.createstory);
        return insert.recordset;
    } catch (error) {
        return error.message;
    }
}
const createChapter = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const insert = await pool.request()
                            .input('storyid', sql.Char(10), data.storyid)
                            .input('authorid', sql.Char(10), data.authorid)
                            .input('chapterid', sql.Char(10), data.chapterid)
                            .input('chaptername', sql.NChar(30), data.chaptername)
                            .input('content', sql.NText, data.content)
                            .query(sqlQueries.createchapter);
        return insert.recordset;
    } catch (error) {
        return error.message;
    }
}
const createOutline = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const insert = await pool.request()
                            .input('storyid', sql.Char(10), data.storyid)
                            .input('authorid', sql.Char(10), data.authorid)
                            .input('outlineid', sql.Char(10), data.outlineid)
                            .input('content', sql.NText, data.content)
                            .query(sqlQueries.createoutline);
        return insert.recordset;
    } catch (error) {
        return error.message;
    }
}
const updateStory = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const result = await pool.request()
                            .input('id', sql.Char(10), data.id)
                            .input('name', sql.NChar(30), data.name)
                            .input('content', sql.NText, data.content)
                            .query(sqlQueries.updatestory);
        return result.recordset;
    } catch (error) {
        return error.message;
    }
}
const updateChapter = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const result = await pool.request()
                            .input('id', sql.Char(10), data.id)
                            .input('name', sql.NChar(30), data.name)
                            .input('content', sql.NText, data.content)
                            .query(sqlQueries.updatechapter);
        return result.recordset;
    } catch (error) {
        return error.message;
    }
}
module.exports = {
    countStory, storyDatalist, calPairUnpairStory, getAllChaptersofStory, createStory, createChapter,
    createOutline, getDraft, getOutline, updateStory, updateChapter
}