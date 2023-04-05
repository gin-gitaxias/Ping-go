FROM golang:1.20

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download

# Add dependencies
RUN go mod tidy 
RUN go get github.com/corazawaf/coraza/v3 
RUN go get github.com/corazawaf/coraza/v3/http 
RUN go get github.com/corazawaf/coraza/v3/types

COPY *.go ./

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-coraza


EXPOSE 8080


# Run
CMD [ "/docker-coraza" ]