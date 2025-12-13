FROM golang:1.25.4-alpine

WORKDIR /app
RUN apk add --no-cache \
            build-base \
            ffmpeg \
            git \
            imagemagick \
            libwebp-tools \
            tzdata

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build

CMD ["./watgbridge"]
