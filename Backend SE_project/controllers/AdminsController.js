'use strict';

const AdminsData = require('../data/admins');

const get_all_admins = async (req, res, next) => {
    try {

        const adminslist = await AdminsData.getAllAdmins();
        res.send(adminslist);        
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const get_admin_byID = async (req, res, next) => {
    try {
        const adminid = req.params.id;
        const admin = await AdminsData.getAdminById(adminid);
        res.send(admin);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const get_admin_byLikeName = async (req, res, next) => {
    try {
        const likename = req.params.id;
        const admins = await AdminsData.getAdminsByLikeName(likename);
        res.send(admins);
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

const update_Admin = async (req, res, next) => {
    try {
        const adminid =  req.params.id;
        const data = req.body;
        const updated = await AdminsData.updateAdmin(adminid, data);
        res.send(updated);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const delete_Admin = async (req, res, next) => {
    try {
        const adminid = req.params.id;
        const deleted = await AdminsData.deleteAdmin(adminid);
        res.send(deleted);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

module.exports = {
    get_all_admins, get_admin_byID, get_admin_byLikeName, create_Admin, update_Admin, delete_Admin
}