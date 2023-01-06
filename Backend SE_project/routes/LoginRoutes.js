'use strict';
const express = require('express');
const LoginControll = require('../controllers/LoginController');
const router = express.Router();

//-----------------------Login--------------------------------------------

router.post('/login', LoginControll.Login);
module.exports = {
    routes: router
}