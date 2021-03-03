const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs")
// mysql connection
const mysql = require('mysql');
const host = 'localhost';
const user = 'root';
const password = '';
const database = 'brainaly';
const con = mysql.createConnection({
  host,
  user,
  password,
  database,
});
con.connect();
const saltRounds = 10

// ================user sign up api
router.post("/signup", async (req, res) => {
  var userEmail = req.body.userEmail;
  var userName = req.body.userName;
  var userPwd = req.body.userPwd;
  var userType = req.body.userType;
  console.log(req.body)
  const query1 = "select * from users where u_email = '" + userEmail + "'";

  console.log("userSign up")
  var flag = false
  res.setHeader('Content-Type', 'text/html');
  await con.query(query1, (err, result, fields) => {
    if (err) throw err;
    if (result.length) {
      flag = true
      res.json({
        flag: false,
        data: "",
        msg: "Email Already Exist!"
      })
      res.send();
      
    } else {
      bcrypt.genSalt(saltRounds, function (err, salt) {
        if (err) {
          throw err
        } else {
          bcrypt.hash(userPwd, salt, function (err, hash) {
            if (err) {
              throw err
            } else {
              //$2a$10$FEBywZh8u9M0Cec/0mWep.1kXrwKeiWDba6tdKvDfEBjyePJnDT7K
              const query1 = "INSERT INTO `users` (`u_name`, `u_email`, `u_pwd`, `u_type`) VALUES ('" + userName + "', '" + userEmail + "', '" + hash + "', '"+userType+"'); ";
              con.query(query1, (err, result, fields) => {
                if (err) throw err;
                res.json({
                  flag: true,
                  data: {
                    userName: userName,
                    userEmail: userEmail,
                    token: hash
                  },
                  msg: "Contratulation! Sign Up is Success"
                })
                res.send();
              });
            }
          })
        }
      })
    }
  });
});

module.exports = router;