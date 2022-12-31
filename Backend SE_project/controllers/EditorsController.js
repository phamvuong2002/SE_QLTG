'use strict';

const EditorsData = require('../data/editors');


const countStory = async (req, res, next) => {
    try {
        const editorid = req.params.id;
        const num = await EditorsData.countStory(editorid);
        res.send(num);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const storyDatalist = async (req, res, next) => {
    try {
        const editorid = req.params.id;
        const list = await EditorsData.storyDatalist(editorid);
        res.send(list);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
module.exports = {
    countStory, storyDatalist
}