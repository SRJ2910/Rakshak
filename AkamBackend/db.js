const mongoose = require('mongoose');
//add URI
const mongoURI = ('mongodb+srv://usernameakam:passwordakam@cluster0.xth6dmv.mongodb.net/one?retryWrites=true&w=majority');

const connect = ()=>{
    mongoose.connect(mongoURI, ()=>{
        console.log("Connected with Mongo Successfully");
    });
}

module.exports = connect;