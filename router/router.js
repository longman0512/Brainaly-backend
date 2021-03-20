const express = require("express");
var multer = require('multer');
const router = express.Router();
const bcrypt = require("bcryptjs")
// mysql connection
const mysql = require('mysql');
const host = '107.191.49.240:3306';
const user = 'dnrnmnrerv';
const password = 'xcDrRK4xDc';
const database = 'dnrnmnrerv';
const con = mysql.createConnection({
  host,
  user,
  password,
  database,
});
con.connect();

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'upload')
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + '-' +file.originalname )
  }
})
var upload = multer({ storage: storage }).single('file')
//====== Image upload
router.post("/upload", async (req, res) => {
  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
        return res.status(500).json(err)
    } else if (err) {
        return res.status(500).json(err)
    }
  return res.status(200).send(req.file)
  })
})
// ======= Update quiz

router.post("/updatequiz", async (req, res) => {
  console.log(req.body.id);
  const query = "UPDATE `questions` SET `q_content`='"+req.body.data+"' WHERE `q_uid` = '"+req.body.id+"'";
  await con.query(query, (err, result) => {
    if(err) throw err;
    res.json({
      data: result,
      message: 'success'
    })
  });
});

router.post("/getbyid", async (req, res) => {
  console.log(req.body)
  const query = "SELECT * FROM `questions` WHERE q_uid = '"+req.body.id+"'";
  await con.query(query, (err, result, fields) => {
    if(err) throw err;
    console.log(result)
    res.json({
      data: result
    })
  })
})

//============ Insert new quiz
router.post("/newquiz", async (req, res) => {
  console.log(req.body);
  const query = "INSERT INTO `questions` (`q_uid`, `q_name`, `q_description`, `q_content`) VALUES  ('" + req.body.uid + "', '" + req.body.title + "', '" + req.body.description + "', '"+req.body.content+"'); ";
  await con.query(query, (err, result, fields) => {
    if(err) throw err;
    res.json({
      flag: true,
      data: {
        uid: req.body.uid,
      },
      msg: "Contratulation! Create new Quiz is Success"
    })
    res.send();
  });
})

// ================user sign up api
const saltRounds = 10
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

router.post("/signin", async (req, res) => {
  var userEmail = req.body.userEmail;
  var userPwd = req.body.userPwd;
  const query1 = "select * from users where u_email = '" + userEmail + "'";

  res.setHeader('Content-Type', 'text/html');
  await con.query(query1, (err, result, fields) => {
    console.log(result[0].u_pwd, userPwd, "when user signin")
    if (err) throw err;
    if (result.length) {
      bcrypt.compare(userPwd, result[0].u_pwd, function(err, isMatch) {
        if (err) {
          throw err
        } else if (!isMatch) {
          res.json({
            flag: false,
            data: "",
            msg: "Email or Password is incorrect!"
          })
          res.send();
        } else {
          res.json({
            flag: true,
            data: result[0],
            msg: "Login Success!"
          })
          res.send();
        }
      })
      
      
    } else {
      res.json({
        flag: false,
        data: "",
        msg: "Email or Password is incorrect!"
      })
      res.send();
    }
  });
});

router.post("/getquizlist", async (req, res) => {
  const query = "SELECT * FROM `questions`";
  await con.query(query, (err, result, fields) => {
    if(err) throw err;
    res.json({
      result,
      msg: "fetch success"
    })
    res.send();
  });
});

router.post("/getbyid", async (req, res) => {
  console.log(req.body)
  const query = "SELECT * FROM `questions` WHERE q_uid = '"+req.body.id+"'";
  await con.query(query, (err, result, fields) => {
    if(err) throw err;
    console.log(result)
    res.json({
      data: result
    })
  })
});

// ===========  Collection functions

router.post("/newcollection", async (req, res) => {
  console.log(req.body);
  const query = "INSERT INTO `collections` (`col_uid`, `col_name`, `col_description`, `col_image`, `col_quiz`) VALUES  ('" + req.body.uid + "', '" + req.body.title + "', '" + req.body.description + "', '"+req.body.cover+"', '" + req.body.quiz+ "'); ";
  await con.query(query, (err, result, fields) => {
    if(err) throw err;
    res.json({
      flag: true,
      data: {
        uid: req.body.uid,
      },
      msg: "Contratulation! Create new Quiz is Success"
    })
    res.send();
  });
});
router.post("/getcollist", async (req, res) => {
  const query = "SELECT * FROM `collections`";
  await con.query(query, (err, result, fields) => {
    if(err) throw err;
    res.json({
      result,
      msg: "fetch success"
    })
    res.send();
  });
});

router.post("/getcolbyid", async (req, res) => {
  console.log(req.body)
  const query = "SELECT * FROM `collections` WHERE col_uid = '"+req.body.id+"'";
  await con.query(query, (err, result, fields) => {
    if(err) throw err;
    console.log(result)
    res.json({
      data: result
    })
  })
});
router.post("/updatecol", async (req, res) => {
  console.log(req.body);
  let addText = '';
  if(req.body.cover===null || req.body.cover === ''){
    addText = '';
  } else {
    addText = ", `col_image`= '"+ req.body.cover+"'";
  }
  const query = "UPDATE `collections` SET `col_name`='"+req.body.title+"', `col_description`='"+req.body.description+"'"+addText+" WHERE `col_uid` = '"+req.body.uid+"'";
  await con.query(query, (err, result) => {
    if(err) throw err;
    res.json({
      data: result,
      message: 'success'
    })
  });
});
router.post("/updatequizlist", async (req, res) => {
  console.log(req.body);
  const query = "UPDATE `collections` SET `col_quiz`='"+req.body.quiz+"' WHERE `col_uid` = '"+req.body.uid+"'";
  await con.query(query, (err, result) => {
    if(err) throw err;
    res.json({
      data: result,
      message: 'success'
    })
  });
});
module.exports = router;