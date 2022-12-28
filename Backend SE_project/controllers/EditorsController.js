'use strict';

const editorData = require('../data/editors');

const get_all_editor = async (req, res, next) => {
    try {

        const editorlist = await editorData.getAllEditor();
        res.send(editorlist);        
    } catch (error) {
        res.status(400).send(error.message);
    }
}
const get_editor_byID = async (req, res, next) => {
    try {
        const editorid = req.params.id;
        const editor = await editorData.getEditorById(editorid);
        res.send(editor);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const get_editor_byLikeName = async (req, res, next) => {
    try {
        const likename = req.params.id;
        const editor = await editorData.getEditorByLikeName(likename);
        res.send(editor);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const create_editor = async (req, res, next) => {
    try {
        const data = req.body;
        const inserted = await editorData.createEditor(data);
        res.send(inserted);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const update_editor = async (req, res, next) => {
    try {
        const editorid =  req.params.id;
        const data = req.body;
        const updated = await editorData.updateEditor(editorid, data);
        res.send(updated);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const delete_editor = async (req, res, next) => {
    try {
        const editorid = req.params.id;
        const deleted = await editorData.deleteEditor(editorid);
        res.send(deleted);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
module.exports = {
    get_all_editor, get_editor_byID, get_editor_byLikeName, create_editor, update_editor, delete_editor
}