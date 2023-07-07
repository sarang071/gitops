FROM golang:alpine AS builder

ARG version

RUN apk update && \
    apk add --no-cache git

WORKDIR /app

COPY . .

# RUN go mod download && \
#     CGO_ENABLED=0 go build -ldflags="-X main.Version=${version}" -o departments-api

FROM scratch

COPY --from=builder /app/departments-api /

ENTRYPOINT [ "/departments-api" ]