FROM golang:latest as builder
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN go get -v -d \
  && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .


FROM scratch
COPY --from=builder /app/app /app
CMD ["/app"]

