var mysql = require('mysql');

var con = mysql.createConnection({
  host: "195.251.249.131",
  user: "ismgroup7",
  password: "he2kt6",
  database: "ismgroup7"
});

con.connect(function(err) {
  if (err) throw err;
  con.query("SELECT idusers, name FROM users WHERE type='1'", function (err, result) {
    if (err) throw err;
    console.log(result);
  });
});