report:
	./query-active-users.sh
	./query-all.sh
	python generatecsv.py
	unzip all.csv

clean: 
	rm *.json
	rm *.zip