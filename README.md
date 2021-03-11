# CSV Parser & Reporter

Reads `input.csv`, transforms values per the data type (configured in `bin/cli` as `HEADER_ROW_METADATA`), and writes transformed data to `out/output.csv`. Additionally, a report file containing various action items is written to `out/report.txt`

Run the program (it takes no options, implicitly reading from `./input.csv`):
```
bin/cli
```

Run the test suite:
```
bin/test
```
