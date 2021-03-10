report:
	./query-active-users.sh
	./query-all.sh
	python3 generatecsv.py
	unzip all.csv

clean: 
	rm -f *.json
	rm -f *.zip
	rm -f *.csv
