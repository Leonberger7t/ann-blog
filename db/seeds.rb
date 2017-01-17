# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



user_1 = User.create(
fname: "Ann",
lname: "Apple",
username: "Ann",
password: "Ann",
email: "ann@nycda.com"
)
user_2 = User.create(
fname: "Matt",
lname: "Avenger",
username: "Matt",
password: "Matt",
email: "Matt@nycda.com"
)

user_3 = User.create(
fname: "Stephanie",
lname: "Charles",
username: "Steaphanie",
password: "Stephanie",
email: "Stephanie@aol.com"
)

post_1 = Post.create(
title: "Today at 5 PM is happy hour",
content: "Find someone to pay for your drink",
user_id: 1
)

post_2 = Post.create(
title: "Today is friday the 13th",
content: "This is Abdul's lucky number",
user_id: 2
)

post_3 = Post.create(
title: "Cats and Dogs",
content: "it's raining cat's and dogs",
user_id: 3
)
