'use strict';
const express = require('express');
const AdminControll = require('../controllers/AdminsController');
const router = express.Router();

//-----------------------ADMINS--------------------------------------------
router.get('/ADoverview/:id', AdminControll.admin_overview);
router.get('/accounts/:id', AdminControll.get_all_accounts);
router.get('/authors/:id', AdminControll.get_all_authors);
router.get('/editors/:id', AdminControll.get_all_editors);
router.post('/addadmin', AdminControll.create_Admin);
router.post('/addauthor', AdminControll.create_Author);
router.post('/addeditor', AdminControll.create_Editor);
router.delete('/deleteadmin/:id', AdminControll.delete_Admin);
router.delete('/deleteauthor/:id', AdminControll.delete_Author);
router.delete('/deleteeditor/:id', AdminControll.delete_Editor);

module.exports = {
    routes: router
}