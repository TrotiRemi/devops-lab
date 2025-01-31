// app.js
const express = require('express');
const app = express();
app.get('/', (req, res) => {
    res.send('Hello, World!');
});


app.get('/name/:name', (req, res) => {
    res.send(`Hello, ${req.params.name}!`);
});

app.get('/add/:a/:b', (req, res) => {
    const a = parseFloat(req.params.a);
    const b = parseFloat(req.params.b);

    if (isNaN(a) || isNaN(b)) {
        return res.status(400).send('Invalid input. Both parameters must be numbers.');
    }

    const sum = a + b;
    res.send(`The sum of ${a} and ${b} is ${sum}`);
});
// Example 5-3: Update the app response text (td5/scripts/sample-app/app.js)
res.send('DevOps Labs!');
module.exports = app;