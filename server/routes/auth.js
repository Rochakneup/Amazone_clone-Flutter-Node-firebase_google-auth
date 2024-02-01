const express = require('express');
const bcrypt = require('bcrypt');
const User = require('../../lib/models/user');
const mongoose = require('mongoose');

const authRouter = express.Router();

authRouter.post('/api/signin', async (req, res) => {
    try {
        const { name, email, password } = req.body;

        // Check if user already exists
        let existingUser;
        try {
            existingUser = await User.findOne({ email }).exec({ timeout: 15000 });
        } catch (error) {
            return res.status(500).json({ error: `Error checking existing user: ${error.message}` });
        }

        if (existingUser) {
            return res.status(400).json({ msg: "User with the same email already exists" });
        }

        // Hash the password
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);

        // Create a new user with the hashed password
        const newUser = new User({
            email,
            password: hashedPassword,
            name,
        });

        // Save the user
        const savedUser = await newUser.save();

        res.json(savedUser);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = authRouter;
