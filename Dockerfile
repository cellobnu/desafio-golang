FROM golang:alpine AS builder

WORKDIR /build

COPY . .

RUN go build -o main .

WORKDIR /app

RUN cp /build/main .

# Build a small image
FROM scratch

COPY --from=builder /app/main /

# Command to run
ENTRYPOINT ["/main"]