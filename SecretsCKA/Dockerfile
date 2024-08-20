FROM docker-registry:5000/golang AS builder
RUN mkdir -p /app
COPY . /app
WORKDIR /app
RUN go build -o secret-server main.go

FROM docker-registry:5000/fedora:39

COPY --from=builder /app/secret-server /app/secret-server 

CMD ["/app/secret-server"]
