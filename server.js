const express = require('express');
const cors = require('cors');
const fetch = require('node-fetch');

const app = express();
const PORT = 3000;

app.use(cors());

app.get('/api/users', async (req, res) => {
  const response = await fetch('https://frontend-interview.touchinspiration.net/api/users');
  const data = await response.json();
  res.json(data);
});

app.get('/api/users/:id', async (req, res) => {
  const response = await fetch(`https://frontend-interview.touchinspiration.net/api/users/${req.params.id}`);
  const data = await response.json();
  res.json(data);
});

app.patch('/api/users/:id', async (req, res) => {
  const response = await fetch(`https://frontend-interview.touchinspiration.net/api/users/${req.params.id}`, {
    method: 'PATCH',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(req.body),
  });
  const data = await response.json();
  res.json(data);
});

app.listen(PORT, () => {
  console.log(`Proxy server running on http://localhost:${PORT}`);
});