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

const storyDataList = async (req, res, next) => {
    try {
        const editorid = req.params.id;
        const list = await EditorsData.storyDataList(editorid);
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
    countStory, overviewAuthorList, storyDataList, calPairUnpairStory, getAllChaptersofStory
}