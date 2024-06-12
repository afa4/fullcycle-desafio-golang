FROM golang:1.22 as builder

WORKDIR /build

COPY ./go.mod .
COPY ./main.go .

RUN go build -o /bin/app ./main.go

FROM scratch

COPY --from=builder /bin/app /bin/app 

CMD ["/bin/app"]
