all: draft_README README.md

draft_README: 
	touch README.md

README.md: draft_README guessinggame.sh
	echo "guessinggame" > README.md
	date >> README.md
	wc -l guessinggame.sh | egrep -o "[0-9]+" >> README.md

clean:
	rm README.md
