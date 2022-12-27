'use strict';
const express = require('express');
const EditorsControll = require('../controllers/EditorsController');
const router = express.Router();

//-----------------------EDITORS--------------------------------------------

router.get('/geteditors', EditorsControll.get_all_editor);
router.get('/geteditor/:id', EditorsControll.get_editor_byID);
router.get('/searcheditors/:id', EditorsControll.get_editor_byLikeName);
router.post('/addeditor', EditorsControll.create_editor);
router.put('/updateeditor/:id', EditorsControll.update_editor);
router.delete('/deleteeditor/:id', EditorsControll.delete_editor);

module.exports = {
    routes: router
}