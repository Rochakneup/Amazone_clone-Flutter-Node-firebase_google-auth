
const mongoose = require('mongoose');




const userSchema = mongoose.Schema({
    name:{
       required : true,
        type: String,
        trim : true ,

    },
    email:{
        required : true,
        type: String,
        trim : true ,
        validate:{
            validator:(value)=>{
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: '/Please inter a valid email address',
        },
    },
    password:{
        required : true,
        type: String,
       
    },
    address:{
        default:"",
        type: String,
    },
    type:{
        
        type: String,
        default:"user",
    },
    //cart
});
const User =mongoose.model('user',userSchema);
module.exports =User;