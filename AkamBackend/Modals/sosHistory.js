const mongoose= require('mongoose');

const sosSchema= new mongoose.Schema({

    user: {
       type: mongoose.Schema.Types.ObjectId,
       ref: 'user'
    },

    text: {
        type: String,
    },
    
    location: {
        type: String,
    },

    receiverId : {              
        type: String,
    },
    
    time: {
        type: String,
    }
},
{ collection: 'SosHistory' });

module.exports= mongoose.model('sosHistory', sosSchema);