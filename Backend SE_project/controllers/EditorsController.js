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

const overviewAuthorList = async (req, res, next) => {
    try {
        const editorid = req.params.id;
        const list = await EditorsData.overviewAuthorList(editorid);
        res.send(list);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const editor_storyDataList = async (req, res, next) => {
    try {
        const editorid = req.params.id;
        const list = await EditorsData.editor_storyDataList(editorid);
        res.send(list);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const author_storyDataList = async (req, res, next) => {
    try {
        const editorid = req.params.id;
        const list = await EditorsData.author_storyDataList(editorid);
        res.send(list);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const calPairUnpairStory = async (req, res, next) => {
    try {
        const storyid = req.params.id;
        const value = await EditorsData.calPairUnpairStory(storyid);
        res.send(value);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const getAllChaptersofStory = async (req, res, next) => {
    try {
        const storyid = req.params.id;
        const value = await EditorsData.getAllChaptersofStory(storyid);
        res.send(value);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
module.exports = {
    countStory, overviewAuthorList, 
    editor_storyDataList, author_storyDataList,
    calPairUnpairStory, getAllChaptersofStory
}