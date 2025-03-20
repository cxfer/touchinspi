const express = require('express');
const cors = require('cors');
const fetch = require('node-fetch');

const app = express();
const PORT = 3000;


app.use(cors({ origin: '*' }));


app.use(express.json());

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

app.post('/api/users/:id', async (req, res) => { // Changed to POST
  try {
    const externalUrl = `https://frontend-interview.touchinspiration.net/api/users/${req.params.id}`;
    
    const response = await fetch(externalUrl, {
      method: 'POST', // Use POST instead of PATCH
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(req.body),
    });

    res.status(response.status).send(await response.text());
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});
app.listen(PORT, () => {
  console.log(`Proxy server running on http://localhost:${PORT}`);
});