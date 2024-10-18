# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Table.create([
  { capacity: 2 }, { capacity: 2 }, { capacity: 4 },
  { capacity: 4 }, { capacity: 6 }, { capacity: 6 },
  { capacity: 8 }, { capacity: 8 }, { capacity: 4 },
  { capacity: 6 }
])
