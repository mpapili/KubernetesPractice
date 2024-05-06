# Temporary builder to compile
FROM golang as builder

RUN mkdir -p /app
WORKDIR /app

COPY . . 

RUN go build -o logserver main.go


# ACTUAL CONTAINER
FROM golang

RUN mkdir -p /app
WORKDIR /app

COPY --from=builder /app/logserver .
CMD ["/app/logserver"]

