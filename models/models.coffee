# This is not being used at the moment but is an example of how to use 
# MongoDB models in your express app.
mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/concept_graph'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

CategoriesSchema = new Schema
  _id: Number
  n: String
  ccs: [Number]

exports.categories = mongoose.model 'categories', CategoriesSchema, 'categories'

