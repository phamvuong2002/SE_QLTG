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
module.exports = {
    countStory, storyDatalist
}