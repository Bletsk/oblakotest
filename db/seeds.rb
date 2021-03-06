# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
seed_file = Rails.root.join('db','seeds.yml')
config = HashWithIndifferentAccess.new(YAML::load_file(seed_file))
config[:projects].each do |x|
	project = Project.create
	project.title = x[:title]
	x[:todos].each do |y|
		todo = Todo.create
		todo.text = y[:text]
		todo.isCompleted = y[:isCompleted]
		project.todos << todo
	end
	project.save
end