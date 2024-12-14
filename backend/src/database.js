import mongoose from 'mongoose';
const uri = "mongodb+srv://seojin7022:LSmiKynzAI5C84PX@friendingcluster0.hdkdw.mongodb.net/?retryWrites=true&w=majority&appName=FriendingCluster0";

mongoose.connect(uri);

mongoose.connection.on('connected', () => {
  console.log("MongoDB has been successfully connected! ✅");
  
})

mongoose.connection.on('error', () => {
  console.log("Something wents wrong");
  
})