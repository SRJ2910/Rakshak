const connect = require('./db');
const express = require('express');
const cors = require('cors');
require("dotenv").config();

connect(); 
const app = express();
const port = 80;

app.use(cors());
app.use(express.json());

app.get('/', function (req, res) {
 res.send("Rakshak in charge")
});

app.use('/Rakshak/authenticate', require('./routes/authentication'));
app.use('/Rakshak/feature', require('./routes/features'));

app.listen(process.env.PORT || port, () => {
  console.log(`Rakshak backend is listening on port`)
});