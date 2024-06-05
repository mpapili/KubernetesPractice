FROM docker-registry:5000/golang as builder

WORKDIR /app

# add go.sum if applicable
COPY go.mod  ./

RUN go mod download

COPY . . 

RUN go build -o main .


FROM docker-registry:5000/ubuntu

WORKDIR /app/

COPY --from=builder /app/main .
EXPOSE 8080

CMD ["./main"] 
