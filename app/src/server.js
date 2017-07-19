const config = require('./config');
const db = require('knex')(config);
const express = require('express');

express()
 .get('*', (req, res) => {
   db('users').then((data) => {
     res.send(data);
   });
 })
 .listen(3000, (err) => {
   if (err) {
     console.error(err);
     return;
   }

   console.log('Express Server listening on port 3000');
 })
;
