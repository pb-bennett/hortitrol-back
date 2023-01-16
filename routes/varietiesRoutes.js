const express = require('express');

const varietiesController = require('../controllers/varietiesController');

const router = express.Router();

router.route('/').get(varietiesController.getAllVarieties);

router.route('/:id').get(varietiesController.getVariety);

module.exports = router;
