import User from '../models/UserModel';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';

export const postLogin = async (req, res) => {
    const {username, password, token} = req.body;

    if (token != null) {
        //Token Login
        jwt.verify(token, process.env.SECRET_KEY, async (err, decoded) => {
            if (err) return res.status(403).json({message: "invalid token"});
            const user = await User.findOne({username: decoded['username']});

            const isMatch = await bcrypt.compare(decoded['password'], user.password);

            if (isMatch) {
                return res.status(200).json(user);
            } else {
                return res.status(400);
            }
        })
    } else {
        const user = await User.findOne({username});

        if (user) {
            const isMatch = await bcrypt.compare(password, user.password);
            if (isMatch) {
    
                const payload = {
                    username: username,
                    password: password,
                };
    
                const token = jwt.sign(payload, process.env.SECRET_KEY, {});
    
                return res.status(200).json({user, token});
            } else {
                return res.sendStatus(400);
            }
            
        } else {
            return res.sendStatus(404);
        }
    }
    
    
}