const dotenv = require('dotenv');
dotenv.config({ path: './config.env' });

const QRCode = require('qrcode');
const express = require('express');

const varietiesRoutes = require('./routes/varietiesRoutes');
const batchesRoutes = require('./routes/batchesRoutes');
const plantsRoutes = require('./routes/plantsRoutes');

const app = express();

const port = process.env.PORT || 3000;

app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);

// dbLookup();
// app.get('/', (req, res) => {
//   res.status(200).send('Hello from the server');
// });

app.listen(port, () => {
  console.log(`Server started.  Listening on port ${port}`);
});
app.use('/api/v1/varieties', varietiesRoutes);
// app.use('/api/v1/batches', batchesRoutes);
// app.use('/api/v1/plants', plantsRoutes);

// QRCode.toString('https://google.com', { type: 'terminal' }, function (err, url) {
//   console.log(url);
// });
