report:
	./query-active-users.sh
	./query-all.sh
	python generatecsv.py
	unzip all.csv

clean: 
	rm -f *.json
	rm -f *.zip
	rm -f *.csv
