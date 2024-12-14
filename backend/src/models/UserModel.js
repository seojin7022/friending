import mongoose from 'mongoose';

const userSchema = new mongoose.Schema({
    username: {type: String, unique: true },
    password: String,
    email: {type: String, unique: true},
    age: Number,
    postings: [mongoose.Types.ObjectId],
})

const User = mongoose.model('User', userSchema);

export default User