'use strict';

const express = require('express');
const router = express.Router();
const AuthorsControll = require('../controllers/AuthorsController');



//-----------------------AUTHORS--------------------------------------------
// router.get('/getauthors', AuthorsControll.get_all_authors);
router.get('/countstory/:id', AuthorsControll.countStory);
router.get('/storydatalist/:id', AuthorsControll.storyDatalist);
router.get('/calpairunpairstory/:id', AuthorsControll.calPairUnpairStory);
router.get('/getallchapterofstory/:id', AuthorsControll.getAllChaptersofStory);
// router.get('/searchauthors/:id', AuthorsControll.get_author_byLikeName);
// router.post('/addauthor', AuthorsControll.create_Author);
// router.put('/updateauthor/:id', AuthorsControll.update_Author);
// router.delete('/deleteauthor/:id', AuthorsControll.delete_Author);


module.exports ={
    routes: router
}