'use strict';
const express = require('express');
const AdminControll = require('../controllers/AdminsController');
const router = express.Router();

//-----------------------ADMINS--------------------------------------------
router.get('/getadmins', AdminControll.get_all_admins);
router.get('/getadmin/:id', AdminControll.get_admin_byID);
router.get('/searchadmins/:id', AdminControll.get_admin_byLikeName);
router.post('/addadmin', AdminControll.create_Admin);
router.patch('/updateadmin/:id', AdminControll.update_Admin);
router.delete('/deleteadmin/:id', AdminControll.delete_Admin);

module.exports = {
    routes: router
};