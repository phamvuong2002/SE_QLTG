'use strict';

const LoginData = require('../data/login');

const Login = async (req, res, next) => {
    try {
        const data = req.body;
        const result = await LoginData.Login(data);
        res.send(result);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
module.exports = {
    Login
}