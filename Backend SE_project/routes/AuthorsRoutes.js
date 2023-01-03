'use strict';

const express = require('express');
const AuthorsControll = require('../controllers/AuthorsController');
const router = express.Router();

//-----------------------AUTHORS--------------------------------------------
router.get('/countstory/:id', AuthorsControll.countStory);
router.get('/storydatalist/:id', AuthorsControll.storyDatalist);
router.get('/calpairunpairstory/:id', AuthorsControll.calPairUnpairStory);
router.get('/getallchapterofstory/:id', AuthorsControll.getAllChaptersofStory);
router.get('/getdraft/:id', AuthorsControll.getDraft);
router.get('/getoutline/:id', AuthorsControll.getOutline);
router.post('/createstory', AuthorsControll.createStory);
router.post('/createchapter', AuthorsControll.createChapter);
router.post('/createoutline', AuthorsControll.createOutline);
router.put('/updatestory', AuthorsControll.updateStory);
router.put('/updatechapter', AuthorsControll.updateChapter);

// router.put('/updateauthor/:id', AuthorsControll.update_Author);
// router.delete('/deleteauthor/:id', AuthorsControll.delete_Author);

module.exports = {
    routes: router
}