FROM docker-registry:5000/golang as builder

RUN mkdir -p /app
WORKDIR /app
COPY * /app/
RUN ls

# Build the binary
RUN CGO_ENABLED=0 GOOS=linux go build -o melody-server main.go 

# Final stage
FROM docker-registry:5000/ubuntu
RUN mkdir -p /app
WORKDIR /app

# Copy the binary from the build stage
COPY --from=builder /app/melody-server .

# Run the binary
CMD ["/app/melody-server"]
