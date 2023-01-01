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
const createStory = async (req, res, next) => {
    try {
        const data = req.body;
        const insert = await AuthorsData.createStory(data);
        res.send(insert);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
module.exports = {
    countStory, storyDatalist, calPairUnpairStory, getAllChaptersofStory, createStory
}