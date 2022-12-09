fmt:
	bundle exec standardrb --fix
run:
	bundle exec ruby days/$(DAY)/main.rb
add:
	cp -r days/template days/$(DAY) && \
	curl --cookie "session=$(SESSION)" https://adventofcode.com/2022/day/$(DAY)/input > days/$(DAY)/input.txt
