'use strict';

const AdminsData = require('../data/admins');

const admin_overview = async (req, res, next) => {
    try {

        const overview = await AdminsData.getAdminOverview();
        res.send(overview);        
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const get_all_accounts = async (req, res, next) => {
    try {

        const accountslist = await AdminsData.getAllAccounts();
        res.send(accountslist);        
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const get_all_authors = async (req, res, next) => {
    try {

        const authorslist = await AdminsData.getAllAuthors();
        res.send(authorslist);        
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const get_all_editors = async (req, res, next) => {
    try {

        const editorslist = await AdminsData.getAllEditors();
        res.send(editorslist);        
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

// const update_Admin = async (req, res, next) => {
//     try {
//         const adminid =  req.params.id;
//         const data = req.body;
//         const updated = await AdminsData.updateAdmin(adminid, data);
//         res.send(updated);
//     } catch (error) {
//         res.status(400).send(error.message);
//     }
// }

const delete_Admin = async (req, res, next) => {
    try {
        const adminid = req.params.id;
        const deleted = await AdminsData.deleteAdmin(adminid);
        res.send(deleted);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const delete_Author = async (req, res, next) => {
    try {
        const authorid = req.params.id;
        const deleted = await AdminsData.deleteAuthor(authorid);
        res.send(deleted);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const delete_Editor = async (req, res, next) => {
    try {
        const editorid = req.params.id;
        const deleted = await AdminsData.deleteEditor(editorid);
        res.send(deleted);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

module.exports = {
    admin_overview, get_all_accounts, get_all_authors, get_all_editors, create_Admin, create_Author, create_Editor, delete_Admin, delete_Author, delete_Editor
}