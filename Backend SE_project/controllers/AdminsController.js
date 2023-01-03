'use strict';

const AdminsData = require('../data/admins');

const admin_overview = async (req, res, next) => {
    try {
        const adminid = req.params.id;
        const overview = await AdminsData.getAdminOverview(adminid);
        res.send(overview);        
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const get_all_accounts = async (req, res, next) => {
    try {
        const adminid = req.params.id;
        const accountslist = await AdminsData.getAllAccounts(adminid);
        res.send(accountslist);        
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const get_all_authors = async (req, res, next) => {
    try {
        const adminid = req.params.id;
        const authorslist = await AdminsData.getAllAuthors(adminid);
        res.send(authorslist);        
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const get_all_editors = async (req, res, next) => {
    try {
        const adminid = req.params.id;
        const editorslist = await AdminsData.getAllEditors(adminid);
        res.send(editorslist);        
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const get_all_stories = async (req, res, next) => {
    try {
        const adminid = req.params.id;
        const editorslist = await AdminsData.getAllStories(adminid);
        res.send(editorslist);        
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const get_Authors_From_Editor = async (req, res, next) => {
    try {
        const editorid = req.params.id;
        const authorslist = await AdminsData.getAuthorsFromEditor(editorid);
        res.send(authorslist);        
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const story_Data_List = async (req, res, next) => {
    try {
        const authorid = req.params.id;
        const list = await AdminsData.storyDatalist(authorid);
        res.send(list);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const cal_Paid_Unpaid_Story = async (req, res, next) => {
    try {
        const storyid = req.params.id;
        const value = await AdminsData.calPaidUnpaidStory(storyid);
        res.send(value);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const create_Admin = async (req, res, next) => {
    try {
        const data = req.body;
        const inserted = await AdminsData.createAdmin(data);
        res.send(inserted);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const create_Author = async (req, res, next) => {
    try {
        const data = req.body;
        const inserted = await AdminsData.createAuthor(data);
        res.send(inserted);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const create_Editor = async (req, res, next) => {
    try {
        const data = req.body;
        const inserted = await AdminsData.createEditor(data);
        res.send(inserted);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

module.exports = {
    admin_overview, get_all_accounts, get_all_authors, get_all_editors, get_all_stories, create_Admin, create_Author, create_Editor, 
    get_Authors_From_Editor, cal_Paid_Unpaid_Story, story_Data_List
}