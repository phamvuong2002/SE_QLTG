'use strict';
const express = require('express');
const config = require('./config');
const cors = require('cors');
const bodyParser = require('body-parser');

const AuthorsRoutes = require('./routes/AuthorsRoutes');
const EditorsRoutes = require('./routes/EditorsRoutes');
const AdminsRoutes = require('./routes/AdminsRoutes');

const app = express();

app.use(cors());
app.use(bodyParser.json());

app.use('/author', AuthorsRoutes.routes);
app.use('/editor', EditorsRoutes.routes);
app.use('/admin', AdminsRoutes.routes);


app.listen(config.port, () => {
  console.log('app listening on url http://localhost:' + config.port )
});