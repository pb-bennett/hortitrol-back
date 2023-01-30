const dotenv = require('dotenv');
dotenv.config({ path: './config.env' });

const QRCode = require('qrcode');
const express = require('express');
const morgan = require('morgan');

const AppError = require('./utils/appError');
const globalErrorHandler = require('./controllers/errorController');
const varietiesRoutes = require('./routes/varietiesRoutes');
const batchesRoutes = require('./routes/batchesRoutes');
const plantsRoutes = require('./routes/plantsRoutes');

const app = express();

// MIDDLEWEAR

app.use(morgan('dev'));
app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);

app.use('/api/v1/varieties', varietiesRoutes);
// app.use('/api/v1/batches', batchesRoutes);
// app.use('/api/v1/plants', plantsRoutes);

app.all('*', (req, res, next) => {
  next(new AppError(`Can't find ${req.originalUrl} on the server!`, 404));
});

app.use(globalErrorHandler);

//  QRCODE

// QRCode.toString('https://google.com', { type: 'terminal' }, function (err, url) {
//   console.log(url);
// });

// START SERVER

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server started.  Listening on port ${port}`);
});

// sequelize-auto -h 192.168.1.100 -d hortitrol -o "./models" -u remote-admin -p 3306 -e mysql -x
