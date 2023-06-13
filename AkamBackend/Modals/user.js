const mongoose= require('mongoose');

const UserSchema= new mongoose.Schema({


    name: {
        type: String,
        required: [true, 'Name is required'],

    },
    email: {
        type: String,
        required: [true, 'Email is required'],
    },

    phoneNo : {
        type: String,
        required: [true, 'Phone is required'],

    },

    address: {
        type: String,
        required: [true, 'Address is required'],
    },

    adhaarNo:{
        type: String,
    },

    password: {
        type: String,
        required: [true, 'Password is required'],
    },
    
    age : {
        type: Number,
        required: [true, 'Age is required'],
    },

    gender: {
        type: String,
        required: [true, 'Gender is required'],
    },

    customText: {
        type: String,
        default: "I am in an emergency. Please help me."
    },

    guardians:{
        type: [String],
    },

    guardiansof:{
        type: [String],
    },


    sosHistory:{
        type: [String],    
    }

},{ collection: 'User' })

module.exports= mongoose.model('user', UserSchema);