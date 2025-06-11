// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-rm-mongo.mongodb.js

// Student ID: 34076352
// Student Name: Ong Jin Xiang

// Comments for your marker:

// ===================================================================================
// DO NOT modify or remove any of the comments below (items marked with //)
// ===================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username

use("jong0092");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection
db.teams.drop();


// Create collection and insert documents

db.teams.insertMany([
	{"_id":1,"carn_name":"RM Spring Series Clayton 2024","carn_date":"22-Sep-2024","team_name":"Speed Demons","team_leader":{"name":"Alice Wong","phone":"0400000001","email":"alice.wong@monash.edu"},"team_no_of_members":3,"team_members":[{"competitor_name":"Alice Wong","competitor_phone":"0400000001","event_type":"10 Km Run","entry_no":1,"starttime":"08:31:00","finishtime":"09:25:00","elapsedtime":"00:54:00"},{"competitor_name":"Bob Smith","competitor_phone":"0400000002","event_type":"10 Km Run","entry_no":2,"starttime":"08:32:00","finishtime":"09:30:00","elapsedtime":"00:58:00"},{"competitor_name":"Carol Johnson","competitor_phone":"0400000003","event_type":"10 Km Run","entry_no":3,"starttime":"08:33:00","finishtime":"09:45:00","elapsedtime":"01:12:00"}]},
	{"_id":2,"carn_name":"RM Spring Series Caulfield 2024","carn_date":"05-Oct-2024","team_name":"Flying Foxes","team_leader":{"name":"David Brown","phone":"0400000004","email":"david.brown@monash.edu"},"team_no_of_members":3,"team_members":[{"competitor_name":"David Brown","competitor_phone":"0400000004","event_type":"10 Km Run","entry_no":1,"starttime":"08:31:00","finishtime":"09:20:00","elapsedtime":"00:49:00"},{"competitor_name":"Emily Davis","competitor_phone":"0400000005","event_type":"10 Km Run","entry_no":2,"starttime":"08:31:00","finishtime":"09:28:00","elapsedtime":"00:57:00"},{"competitor_name":"Frank Wilson","competitor_phone":"0400000006","event_type":"10 Km Run","entry_no":3,"starttime":"08:33:00","finishtime":"09:32:00","elapsedtime":"00:59:00"}]},
	{"_id":3,"carn_name":"RM Summer Series Caulfield 2025","carn_date":"02-Feb-2025","team_name":"Speed Demons","team_leader":{"name":"Alice Wong","phone":"0400000001","email":"alice.wong@monash.edu"},"team_no_of_members":2,"team_members":[{"competitor_name":"Alice Wong","competitor_phone":"0400000001","event_type":"10 Km Run","entry_no":1,"starttime":"08:01:00","finishtime":"09:00:00","elapsedtime":"00:59:00"},{"competitor_name":"Bob Smith","competitor_phone":"0400000002","event_type":"10 Km Run","entry_no":2,"starttime":"08:02:00","finishtime":"09:10:00","elapsedtime":"01:08:00"}]},
	{"_id":4,"carn_name":"RM Summer Series Caulfield 2025","carn_date":"02-Feb-2025","team_name":"Trail Blazers","team_leader":{"name":"Grace Lee","phone":"0400000007","email":"grace.lee@yahoo.com"},"team_no_of_members":2,"team_members":[{"competitor_name":"Grace Lee","competitor_phone":"0400000007","event_type":"5 Km Run","entry_no":1,"starttime":"08:30:00","finishtime":"09:05:00","elapsedtime":"00:35:00"},{"competitor_name":"Henry Clark","competitor_phone":"0400000008","event_type":"5 Km Run","entry_no":2,"starttime":"08:31:00","finishtime":"09:05:00","elapsedtime":"00:34:00"}]},
	{"_id":5,"carn_name":"RM Winter Series Caulfield 2025","carn_date":"29-Jun-2025","team_name":"Night Owls","team_leader":{"name":"Ivy Martinez","phone":"0400000009","email":"ivy.martinez@gmail.com"},"team_no_of_members":4,"team_members":[{"competitor_name":"Ivy Martinez","competitor_phone":"0400000009","event_type":"5 Km Run","entry_no":1,"starttime":"08:45:00","finishtime":"09:25:00","elapsedtime":"00:40:00"},{"competitor_name":"Jack Taylor","competitor_phone":"0400000010","event_type":"5 Km Run","entry_no":2,"starttime":"08:46:00","finishtime":"09:30:00","elapsedtime":"00:44:00"},{"competitor_name":"Karen Anderson","competitor_phone":"0400000011","event_type":"5 Km Run","entry_no":3,"starttime":"08:47:00","finishtime":"09:40:00","elapsedtime":"00:53:00"},{"competitor_name":"Liam Scott","competitor_phone":"0400000012","event_type":"5 Km Run","entry_no":4,"starttime":"08:48:00","finishtime":"09:36:00","elapsedtime":"00:48:00"}]}
]);




// List all documents you added
db.teams.find({});


// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer





// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer


// (i) Add new team





// Illustrate/confirm changes made





// (ii) Add new team member





// Illustrate/confirm changes made


