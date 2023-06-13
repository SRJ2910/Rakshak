const express = require('express');
const router = express.Router();
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const User = require('../Modals/user')
// const fetchUser = require('../middleware/fetchUser');
const { body, validationResult } = require('express-validator');
const JWT_SECRET = "**********";

//------------------------------------------------------------------------------//

router.post('/signUp',
  [
    body('name').isLength({min:2}),
    body('email').isEmail(),
    body('phoneNo').isLength({min:10}),
    body('password').isLength({ min: 7 }),
    body('cnfrmPassword').custom((value, { req }) => {
        if (value !== req.body.password) {
          throw new Error('Password confirmation does not match password');
        }
        return true;
      }),
    body()

  ],
  async (req, res) => {

    //Fetching errors of validation
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    try {
      //Checking if the user already exist or not.
      let user = await User.findOne({ email: req.body.phoneNo });

      if (user) {
        return res.status(404).json({ error: "User with the same phone number already exist." });
      }
      
      else {
        const salt = await bcrypt.genSalt(10);
        const hash = await bcrypt.hash(req.body.password, salt);
        
        user = await User.create({
          name: req.body.name,
          email: req.body.email,
          phoneNo: req.body.phoneNo,
          address: req.body.address,
          gender: req.body.gender,
          age: req.body.age,
          password: hash,
        });

        const data = {
          user: {
            id: user.id
          }
        }
        const token = jwt.sign(data, JWT_SECRET);
        const ID = user._id;
        res.status(200).json({ token , ID})
      }
    }
    catch (error) {
      res.status(500).json({ error: "Internal server error" });
    }

  });
//------------------------------------------------------------------------------//
//Login api
router.post('/login',
  [
    body('phoneNo', 'Enter a valid phone number').isLength({min:10}),
    body('password', 'Enter a valid password').exists(),
  ],
  async (req, res) => {
    //Fetching errors of validation
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    try {
      const { phoneNo, password } = req.body;

      //Finding the user using phone number
      let user = await User.findOne({ phoneNo });

      if (!user) {
        return res.status(404).json({ error: "Input correct crediantials" });
      }
      //Comparing password with hash
      const pswrdCheck = await bcrypt.compare(password, user.password);

      if (!pswrdCheck) {
        return res.status(400).json({ error: "Input correct crediantials" });
      }
      //Fetchin user id
      const data = {
        user: { id: user.id }
      }
      //Generating authentication token
      const token = jwt.sign(data, JWT_SECRET);
      const ID = user._id;
      res.status(200).json({ token , user})
    }
    //Catching it there is an internal error
    catch (error) {
      console.log("Internal Server Error");
      res.status(500).json({ error: "Internal Server Error" });
    }
  });

//------------------------------------------------------------------------------//
// Fetch all users
router.get('/getAll',       
  async (req, res) => {
      let user = await User.find( {user: req.user_id} )
      res.send(user);
});
//------------------------------------------------------------------------------//

module.exports = router