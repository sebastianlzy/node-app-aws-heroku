const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const pool = require('./pg-pool')

const retrieveEc2Pricing = require('./retrieve-ec2-pricing')


const app = express();
const port = process.env.PORT || 5000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// API calls
app.get('/api/hello', (req, res) => {
    res.send({ express: 'Hello From Express' });
});

app.get('/api/ec2-pricing', async (req, res) => {
    const client = await pool.connect()
    const query = "SELECT * from public.elastic_compute_cloud"
    try {
        console.log(query)
        const prices = await client.query(query)
        res.send({ prices: prices.rows });
    }
    catch(err) {
        console.log(err.stack)
    }
});


app.post('/api/world', (req, res) => {
    console.log(req.body);
    res.send(
        `I received your POST request from ${req.get('host')}: ${req.body.post}`,
    );
});

if (process.env.NODE_ENV === 'production') {
    // Serve any static files
    app.use(express.static(path.join(__dirname, '../build')));

    // Handle React routing, return all requests to React app
    app.get('*', function(req, res) {
        res.sendFile(path.join(__dirname, '../build', 'index.html'));
    });
}

app.listen(port, () => console.log(`Listening on port ${port}`));

