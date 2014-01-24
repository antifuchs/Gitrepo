ALL_FILEFILES=$(glob *file)
FILEFILE_FILES=$(filter-out Filefile,$(ALL_FILEFILES))

fetch:
	bundle check || bundle install

happen: fetch
	bundle exec vagrant up --provider=virtualbox

file: Filefile

Filefile: $(FILEFILE_FILES)
	ls *file > Filefile

clean:
	bundle exec vagrant destroy -f

.PHONY: fetch happen clean
