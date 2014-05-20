###
The MIT License (MIT)

Copyright (c) 2014 MRW Neundorf <matt@nax.me>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
###

mongoose = require("mongoose")
extend = require('mongoose-schema-extend')
Schema = mongoose.Schema
BaseSchema = require('./Base').schema

bcrypt = require('bcrypt')
SALT_WORK_FACTOR = 10

UserSchema = BaseSchema.extend
  email: 
    type: String
    required: true
    unique: true

  password: 
    type: String
    required: true

UserSchema.pre "save", (next) ->
  user = this

  return next()  unless user.isModified("password")
  bcrypt.genSalt SALT_WORK_FACTOR, (err, salt) ->
    return next(err)  if err
    bcrypt.hash user.password, salt, (err, hash) ->
      return next(err)  if err
      user.password = hash
      next()

UserSchema.statics.load = (id, cb)->
  @findOne
    _id: id
  .exec(cb);

UserSchema.methods =
  comparePassword: (candidatePassword, cb)->
    bcrypt.compare candidatePassword, @password, (err, isMatch)->
      return cb err if err
      cb null, isMatch

module.exports = mongoose.model 'User', UserSchema