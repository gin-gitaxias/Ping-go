FROM golang:1.20

# Set destination for COPY
WORKDIR /app

# Download Go modules

COPY *.go ./
RUN go mod init github.com/gin-gitaxias/Ping-go
RUN go mod download

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-coraza


EXPOSE 8080


# Run
CMD [ "/docker-coraza" ]