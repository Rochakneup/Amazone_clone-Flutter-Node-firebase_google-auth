//import
const express = require('express');
const mongoose = require('mongoose');



// import for the files 
const authRouter = require('./routes/auth');

const PORT = 3000;

const app = express();

const DB = "mongodb+srv://rochakneupane:rochakneupane1234@amazonclone.g398ffn.mongodb.net/?retryWrites=true&w=majority"

//middleware
app.use(express.json())
app.use(authRouter);

//connection 
mongoose.connect(DB).then(()=>{
    console.log("connection successfull")
})
.catch((e) =>{
    console.log(e);
})

app.listen(3000,'0.0.0.0', () => {
    console.log('Server is running on port 3000');
  });
  



