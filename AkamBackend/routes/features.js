const express = require('express');
const sosHistory = require('../Modals/sosHistory');
const router = express.Router();
const user = require('../Modals/user');

//-------------------------------------------------------------------------//
//To fetch sos history
router.get("/userSosHistory", async (req, res) => {

    try {
        const User = await user.findOne({ _id: req.body.id });

        let historyArray = User.sosHistory;
        let historyRes = [];
        for (var i = 0; i < historyArray.length; i++) {
            var result = await sosHistory.findOne({ _id: historyArray[i] });

            historyRes.push(result);
        }
        res.status(201).json(historyRes);
    }
    catch (error) {
        res.status(500).json({ error: "Internal server error" });
    }

});

//-------------------------------------------------------------------------//
//After sending a SOS, updating the message in SOS History
router.put('/sendSos', async (req, res) => {

    try {
        let User = await user.findOne({ _id: req.body.id });
        if (!User)
            throw new Error('User not found, kindly login or signup');

        let sosMessage = await sosHistory.create({
            user: User,
            text: req.body.text,
            location: req.body.location,
            receiverId: req.body.receiverID,
            time: Date.now()
        });


        user.updateOne({ _id: req.body.id }, { $push: { sosHistory: sosMessage._id.toString() } }, (err, doc) => {
            if (err) {
                console.log(err);
            }
        });

        res.status(200).json(User)
    }
    catch (error) {
        res.status(500).json({ error: "Internal server error" });
    }

});

//-------------------------------------------------------------------------//
//To add a guardian
router.put('/addGuardian', async (req, res) => {

 try{
        let User = await user.findOne({ _id: req.body.id });
        if (!User)
            throw new Error('User not found, kindly login or signup');

        let Guardian = await user.findOne({ phoneNo: req.body.phoneNo })
        if (!Guardian)
            throw new Error('Guardian is not registered on Rakshak!');

        user.updateOne({ _id: req.body.id }, { $push: { guardians: Guardian._id.toString() } }, (err, doc) => {
            if (err) {
                console.log(err);
            }
        });
      
        user.updateOne({phoneNo: req.body.phoneNo}, { $push: { guardiansof: User._id.toString() } }, (err, doc) => {
            if (err) {
                console.log(err);
            }
        });

         res.status(200).json("Guardian Successfully added")
    }

    catch (error) {
    res.status(500).json({ error: "Internal server error" });
}

});

module.exports = router;