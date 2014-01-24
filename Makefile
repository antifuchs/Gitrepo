fetch:
	bundle check || bundle install

happen: fetch
	bundle exec vagrant up --provider=virtualbox

clean:
	bundle exec vagrant destroy -f

.PHONY: fetch happen clean
