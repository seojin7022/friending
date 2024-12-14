require('dotenv').config();
import express from 'express';
import cors from 'cors';
import './database.js';
import userRouter from './routes/userRouter.js';

const app = express();

app.use(cors({
    origin: '*',
    credentials: true,
    methods: ['GET', 'POST'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(userRouter);
app.listen(process.env.PORT, () => {
    console.log(`Server has started successfully!✨ | http://localhost:${process.env.PORT}`);
})