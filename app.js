const dotenv = require('dotenv');
dotenv.config({ path: './config.env' });

const QRCode = require('qrcode');
const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.status(200).send('Hello from the server');
});

app.listen(process.env.PORT, () => {
  console.log(`Server started.  Listening on port ${process.env.PORT}`);
});

// QRCode.toString('https://google.com', { type: 'terminal' }, function (err, url) {
//   console.log(url);
// });
4
