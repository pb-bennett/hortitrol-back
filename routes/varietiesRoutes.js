const express = require('express');

const varietiesController = require('../controllers/varietiesController');

const router = express.Router();

router.route('/').get(varietiesController.getAllVarieties).post(varietiesController.newVariety);

router.route('/:id').get(varietiesController.getVariety).delete(varietiesController.deleteVariety).patch(varietiesController.updateVariety);

// router.route('/urls/').get(varietiesController.getAllVarietyUrls).post(varietiesController.newVarietyUrl);

// router.route('/urls/:id').get(varietiesController.getVarietyUrl).delete(varietiesController.deleteVarietyUrl).patch(varietiesController.updateVarietyUrl);

// router.route('/photos/').get(varietiesController.getAllVarietyPhotos).post(varietiesController.newVarietyPhoto);

// router.route('/photos/:id').get(varietiesController.getVarietyPhoto).delete(varietiesController.deleteVarietyPhoto).patch(varietiesController.updateVarietyPhoto);

module.exports = router;
