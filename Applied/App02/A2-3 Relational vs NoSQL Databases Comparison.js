// Databases Applied 2
// applied2_student.mongodb.js

// student id: 34076352
// student name: Ong Jin Xiang
// last modified date: 11/03/2025

use ("jong0092");

db.student.drop();

db.student.insertMany([{
    "_id": 12345678,
    "firstName": "roy",
    "lastName": "wong",
    "email": "roywong@gmail.com",
    "address": "1234 Moorabbin St",
    "phone": "123-456-7890",
},
{
    "_id": 12345679,
    "firstName": "john",
    "lastName": "smith",
    "email": "johnsmith@gmail.com",
    "address": "1235 Elmo St",
    "phone": "123-456-7890",
},
{
    "_id": 12345680,
    "firstName": "jane",
    "lastName": "doe",
    "email": "janedoe@gmail.com",
    "address": "1236 Elmo St",
    "phone": "123-456-7890",
}
]); 

db.student.find();
db.student.find({"address":{$regex: /Moorabbin/}});
db.student.find({"address":{$regex: /Moorabbin/}},{"_id":0,"firstName":1,"lastName":1});

