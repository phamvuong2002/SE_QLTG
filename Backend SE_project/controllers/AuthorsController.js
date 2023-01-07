'use strict';

const AuthorsData = require('../data/authors');


const countStory = async (req, res, next) => {
    try {
        const authorid = req.params.id;
        const num = await AuthorsData.countStory(authorid);
        res.send(num);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const storyDatalist = async (req, res, next) => {
    try {
        const authorid = req.params.id;
        const list = await AuthorsData.storyDatalist(authorid);
        res.send(list);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
const calPairUnpairStory = async (req, res, next) => {
    try {
        const storyid = req.params.id;
        const value = await AuthorsData.calPairUnpairStory(storyid);
        res.send(value);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
const getAllChaptersofStory = async (req, res, next) => {
    try {
        const storyid = req.params.id;
        const chapters = await AuthorsData.getAllChaptersofStory(storyid);
        res.send(chapters);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
const getDraft = async (req, res, next) => {
    try {
        const storyid = req.params.id;
        const draft = await AuthorsData.getDraft(storyid);
        res.send(draft);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
const getOutline = async (req, res, next) => {
    try {
        const storyid = req.params.id;
        const outline = await AuthorsData.getOutline(storyid);
        res.send(outline);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
const createStory = async (req, res, next) => {
    try {
        const data = req.body;
        const insert = await AuthorsData.createStory(data);
        res.send(insert);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
const createChapter = async (req, res, next) => {
    try {
        const data = req.body;
        const insert = await AuthorsData.createChapter(data);
        res.send(insert);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
const createOutline = async (req, res, next) => {
    try {
        const data = req.body;
        const insert = await AuthorsData.createOutline(data);
        res.send(insert);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
const updateStory = async (req, res, next) => {
    try {
        const data = req.body;
        const result = await AuthorsData.updateStory(data);
        res.send(result);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
const updateChapter = async (req, res, next) => {
    try {
        const data = req.body;
        const result = await AuthorsData.updateChapter(data);
        res.send(result);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
const getCmtChapter = async (req, res, next) => {
    try {
        const chapterid = req.params.id;
        const cmt = await AuthorsData.getCmtChapter(chapterid);
        res.send(cmt);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
module.exports = {
    countStory, storyDatalist, calPairUnpairStory, getAllChaptersofStory, createStory, createChapter,
    createOutline, getDraft, getOutline, updateStory, updateChapter, getCmtChapter
}