'use strict';
const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');

const getAdminOverview = async (adminid) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const overview = await pool.request()
                            .input('adminid', sql.Char(10), adminid)
                            .query(sqlQueries.getAdminOverview);
        return overview.recordset;
    } catch (error) {
        console.log(error.message);
    }
}

const getAllAccounts = async (adminid) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const accountList = await pool.request()
                            .input('adminid', sql.Char(10), adminid)
                            .query(sqlQueries.getAccounts);
        return accountList.recordset;
    } catch (error) {
        console.log(error.message);
    }
}

const getAllAuthors = async (adminid) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const authorList = await pool.request()
                            .input('adminid', sql.Char(10), adminid)
                            .query(sqlQueries.getAuthors);
        return authorList.recordset;
    } catch (error) {
        console.log(error.message);
    }
}

const getAllEditors = async (adminid) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const editorList = await pool.request()
                            .input('adminid', sql.Char(10), adminid)
                            .query(sqlQueries.getEditors);
        return editorList.recordset;
    } catch (error) {
        console.log(error.message);
    }
}

const getAllStories = async (adminid) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const storyList = await pool.request()
                            .input('adminid', sql.Char(10), adminid)
                            .query(sqlQueries.getStories);
        return storyList.recordset;
    } catch (error) {
        console.log(error.message);
    }
}

const getAuthorsFromEditor = async (editorid) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const editorAuthorList = await pool.request()
                            .input('editorid', sql.Char(10), editorid)
                            .query(sqlQueries.getAuthorFromEditor);
        return editorAuthorList.recordset;
    } catch (error) {
        console.log(error.message);
    }
}

const storyDatalist = async(AuthorID) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const list = await pool.request()
                            .input('authorid', sql.Char(10), AuthorID)
                            .query(sqlQueries.storyDataList);
        return list.recordset;
    } catch (error) {
        return error.message;
    }
}

const calPaidUnpaidStory = async(StoryID) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('admins');
        const value = await pool.request()
                            .input('storyid', sql.Char(10), StoryID)
                            .query(sqlQueries.calPaidUnpaidStory);
        return value.recordset;
    } catch (error) {
        return error.message;
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
                            .input('adminid', sql.Char(10), data.adminid)
                            .input('username', sql.Char(20), data.username)
                            .input('password', sql.Char(15), data.password)
                            .input('authorname', sql.NChar(50), data.authorname)
                            .input('email', sql.Char(30), data.email)
                            .input('phonenumber', sql.Char(15), data.phonenumber)
                            .query(sqlQueries.createauthor);
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
                            .input('adminid', sql.Char(10), data.adminid)
                            .input('username', sql.Char(20), data.username)
                            .input('password', sql.Char(15), data.password)
                            .query(sqlQueries.createadmin);
        return insert.recordset;
    } catch (error) {
        return error.message;
    }
}
module.exports = {
    getAdminOverview, getAllAccounts, getAllAuthors, getAllEditors, getAllStories, createAdmin, createAuthor, createEditor, 
    getAuthorsFromEditor, calPaidUnpaidStory, storyDatalist
}