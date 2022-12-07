fmt:
	bundle exec standardrb --fix
run:
	bundle exec ruby days/$(DAY)/main.rb
add:
	cp -r days/template days/$(DAY)
