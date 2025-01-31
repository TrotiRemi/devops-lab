// Example 5-3: Update the app response text (td5/scripts/sample-app/app.js)
const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.send('DevOps Labs!');
});

module.exports = app;