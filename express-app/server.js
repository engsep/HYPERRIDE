'use strict';

const express = require('express');
const bodyParser = require("body-parser");

// Constants
const PORT = 8000;

// App
const app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.json());
app.use(express.text());

app.get('/hello', (req, res) => {
	res.send('Hello world!');
});

app.get('/version', (req, res) => {
	res.send('Express Service v1.0.0');
});

app.get('/', (req, res) => {
	res.send(
		"<!DOCTYPE html>" +
		"<html>" +
		"<head>" +
		"<title>Express Service</title>" +
		"</head>" +
		"<body>" +
		"<form action=\"/check\" method=\"POST\">" +
		"<label>Sensor URI</label><br>" +
		"<input type=\"text\" name=\"sensor\"><br>" +
		"<label>Temperature (°C)</label><br>" +
		"<input type=\"text\" name=\"temperature\"><br><br>" +
		"<input type=\"submit\" name=\"submit\" value=\"Test\">" +
		"</form>" +
		"</body>" +
		"</html>");
});

app.post('/test', (req, res) => {
	res.send(req.body);
});

app.get('/test', (req, res) => {
	res.send(req.query);
});

app.post('/ads', (req, res) => {
	let low = req.query.low || 25;
	let high = req.query.high || 75;
	let response = `{id:\"${req.body.sensor}Test,type:\"Anomaly Detection\",result:${req.body.temperature > low & req.body.temperature < high ? "true" : "false"}}`
	res.send(response);
});

app.listen(PORT, () => {
	console.log(`Server running on port ${PORT}`);
});