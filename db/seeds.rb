# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.create(username: "quoctienphamm", email: "quoctienphamm@gmail.com", password: "123456",admin: "true")
u = User.create(username: "arypham", email: "tigertocdo@gmail.com", password: "123456",admin: "false")
t = Task.create(taskname: "12111111111111111111111111111111", content: "12111111111111111111111111111111", date: DateTime.now.to_date) 

