FROM golang:1.18

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download

# Add dependencies
RUN go get github.com/corazawaf/coraza/v3/seclang
RUN go mod tidy

COPY *.go ./

#Add Coraza to your go project
RUN go get github.com/corazawaf/coraza/v3


# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-coraza


EXPOSE 8080


# Run
CMD [ "/docker-coraza" ]