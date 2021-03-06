generate:
	# Build and install generator binary first
	go generate github.com/tobgu/qframe/... || true
	go install github.com/tobgu/qframe/cmd/qfgenerate
	go generate github.com/tobgu/qframe/...

test: generate
	go test ./...

fmt: generate
	go fmt ./...

vet: generate
	go vet ./...

cov: generate
	go test github.com/tobgu/qframe/... -coverprofile=coverage.out -coverpkg=all
	go tool cover -html=coverage.out

deps:
	go get -t ./...

dev-deps: deps
	go get github.com/mauricelam/genny

qplot_examples:
	cd contrib/gonum/qplot/examples \
		&& go run temperatures.go
