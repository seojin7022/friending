import User from "../models/UserModel";
import bcrypt from 'bcrypt';

export const postJoin = async (req, res) => {
    const {username, password, email, age} = req.body;
    const hashedPassword = await bcrypt.hash(password, 10);
    
    if (await User.findOne({username}) != null || await User.findOne({email}) != null) {
        return res.status(400);
    }

    const user = await User.create({username, password: hashedPassword, email, age});
    if (user) {
        return res.status(200).json({username: user.username, email: user.email, age: user.age});
    } else {
        return res.status(400);
    }
}