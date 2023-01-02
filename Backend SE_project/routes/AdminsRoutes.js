'use strict';
const express = require('express');
const AdminControll = require('../controllers/AdminsController');
const router = express.Router();

//-----------------------ADMINS--------------------------------------------
router.get('/ADoverview/:id', AdminControll.admin_overview);
router.get('/accounts/:id', AdminControll.get_all_accounts);
router.get('/authors/:id', AdminControll.get_all_authors);
router.get('/editors/:id', AdminControll.get_all_editors);
router.get('/stories/:id', AdminControll.get_all_stories);
router.get('/editorAuthorList/:id', AdminControll.get_Authors_From_Editor);
router.get('/storyDataList/:id', AdminControll.story_Data_List);
router.get('/calPaidUnpaidStory/:id', AdminControll.cal_Paid_Unpaid_Story);
router.post('/addadmin', AdminControll.create_Admin);
router.post('/addauthor', AdminControll.create_Author);
router.post('/addeditor', AdminControll.create_Editor);
// router.delete('/deleteadmin/:id', AdminControll.delete_Admin);
// router.delete('/deleteauthor/:id', AdminControll.delete_Author);
// router.delete('/deleteeditor/:id', AdminControll.delete_Editor);

module.exports = {
    routes: router
}