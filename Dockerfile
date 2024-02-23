FROM golang:alpine as builder
COPY . .
RUN go build -o /hello hello.go

FROM scratch
COPY --from=builder /hello /
EXPOSE 8080

ENTRYPOINT [ "/hello" ]