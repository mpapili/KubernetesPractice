FROM golang:alpine AS build

WORKDIR /app
COPY . .

RUN go build -o helloworld main.go

FROM alpine
COPY --from=build /app/helloworld /app/helloworld

EXPOSE 8080
ENTRYPOINT ["/app/helloworld"]

