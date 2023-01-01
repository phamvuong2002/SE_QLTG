'use strict';
const express = require('express');
const EditorsControll = require('../controllers/EditorsController');
const router = express.Router();

//-----------------------EDITORS--------------------------------------------

router.get('/countstory/:id', EditorsControll.countStory);
router.get('/storydatalist/:id', EditorsControll.storyDatalist);

module.exports = {
    routes: router
}