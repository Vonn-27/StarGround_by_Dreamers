const express = require('express');
const mysql = require('mysql');
const fetch = require('node-fetch');
const cors = require('cors');

const app = express();
const port = 3000;

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'straground'
});

db.connect(err => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to the MySQL database.');
});

app.use(express.json());
app.use(cors());

app.post('/chat', async (req, res) => {
  console.log('Received a request:', req.body);
  const { messages } = req.body;
  const userMessage = messages[messages.length - 1].content;

  let query = '';

  if (userMessage.includes('senjata')) {
    const weaponName = userMessage.split('senjata ')[1];
    query = `SELECT * FROM senjata WHERE nama LIKE '%${weaponName}%'`;
  } else if (userMessage.includes('map')) {
    query = 'SELECT * FROM map';
  }

  if (query) {
    db.query(query, (err, results) => {
      if (err) {
        console.error('Error executing query:', err);
        res.status(500).send('Database query error');
        return;
      }

      const dbData = { data: results };

      fetch('https://api.groq.com/openai/v1/chat/completions', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer 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' // Replace with your actual API key
        },
        body: JSON.stringify({
          messages: [...messages, { role: 'system', content: `Database data: ${JSON.stringify(dbData)}` }],
          model: 'llama3-70b-8192'
        })
      })
      .then(response => response.json())
      .then(data => {
        console.log('LLM API response:', data);
        if (data.choices && data.choices.length > 0) {
          const botMessageContent = data.choices[0].message.content || "Sorry, I couldn't understand that.";
          res.json({ content: botMessageContent });
        } else {
          res.json({ content: "Sorry, I couldn't understand that." });
        }
      })
      .catch(error => {
        console.error('Error:', error);
        res.status(500).send('LLM request error');
      });
    });
  } else {
    // If no specific query is needed, send a generic message to LLM
    fetch('https://api.groq.com/openai/v1/chat/completions', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer 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' // Replace with your actual API key
      },
      body: JSON.stringify({
        messages,
        model: 'llama3-70b-8192'
      })
    })
    .then(response => response.json())
    .then(data => {
      console.log('LLM API response:', data);
      if (data.choices && data.choices.length > 0) {
        const botMessageContent = data.choices[0].message.content || "Sorry, I couldn't understand that.";
        res.json({ content: botMessageContent });
      } else {
        res.json({ content: "Sorry, I couldn't understand that." });
      }
    })
    .catch(error => {
      console.error('Error:', error);
      res.status(500).send('LLM request error');
    });
  }
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
