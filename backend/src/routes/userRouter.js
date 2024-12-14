import express from 'express'
import { postJoin } from '../controllers/joinController.js';
import { postLogin } from '../controllers/loginController.js';

const router = express.Router();

router.post('/api/join', postJoin);
router.post('/api/login', postLogin);

export default router;