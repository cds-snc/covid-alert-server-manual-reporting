#!/bin/bash

perform_scan () {
	echo "generating $2-$1.json..."
	aws dynamodb scan \
		--table-name 'aggregate_metrics' \
		--region ca-central-1 \
		--filter-expression="#version >= :v AND #date = :date AND #identifier = :identifier" \
		--expression-attribute-names '{"#version": "version", "#date": "date", "#identifier": "identifier"}' \
		--expression-attribute-values "{ \":v\": { \"N\": \"2\"  }, \":date\": { \"S\": \"$2\"  }, \":identifier\" : { \"S\": \"$1\" }}" > "$2-$1.json"
}

query ()
{
	perform_scan "active-user" "$1"
	perform_scan "background-check" "$1"
	perform_scan "exposed" "$1"
}

query "2021-03-09"
query "2021-03-08"
query "2021-03-07"
query "2021-03-06"
query "2021-03-05"
query "2021-03-04"
query "2021-03-03"
query "2021-03-02"
query "2021-03-01"
query "2021-02-28"
query "2021-02-27"
query "2021-02-26"
query "2021-02-25"
query "2021-02-24"
