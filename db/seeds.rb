# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

WallType.create(up: true, right: true, down: false, left: false)
WallType.create(up: false, right: true, down: true, left: false)
WallType.create(up: false, right: false, down: true, left: true)
WallType.create(up: true, right: false, down: false, left: true)