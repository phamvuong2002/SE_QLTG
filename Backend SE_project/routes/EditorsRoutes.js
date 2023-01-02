'use strict';
const express = require('express');
const EditorsControll = require('../controllers/EditorsController');
const router = express.Router();

//-----------------------EDITORS--------------------------------------------

router.get('/countstory/:id', EditorsControll.countStory);
router.get('/overviewAuthorList/:id', EditorsControll.overviewAuthorList);

router.get('/storydatalist/storytab/:id', EditorsControll.editor_storyDataList);
router.get('/storydatalist/authortab/:id', EditorsControll.author_storyDataList);

router.get('/calpairunpairstory/:id', EditorsControll.calPairUnpairStory);
router.get('/getallchapterofstory/:id', EditorsControll.getAllChaptersofStory);

module.exports = {
    routes: router
}