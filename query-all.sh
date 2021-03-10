#!/bin/bash

aws dynamodb scan \
	--table-name 'aggregate_metrics' \
	--region ca-central-1 \
	--filter-expression="#version >= :v AND #appversion = :av" \
	--expression-attribute-names '{"#version": "version", "#appversion": "appversion" }' \
	--expression-attribute-values "{ \":v\": { \"N\": \"3\"  }, \":av\": { \"S\": \"248\"} }" > "all.json"
