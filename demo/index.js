const express = require('express');
const app = express();

app.get('/', (req, res) => {
  const now = new Date();
  const type = 'Information';

  res.send(`
    <html>
      <head>
        <style>
          body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-weight: bold;
            text-align: center;
            font-size: 50px;
          }
        </style>
      </head>
      <body>
        <div>
          Practical Security Kubernetes Docker
          <br/>
          ${now}
          <br/>
          ${type}
        </div>
      </body>
    </html>
  `);
});

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});