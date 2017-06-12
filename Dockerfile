FROM golang

RUN mkdir -p $GOPATH/src/github.com/madhukard/tail/
ADD . $GOPATH/src/github.com/madhukard/tail/

# expecting to fetch dependencies successfully.
RUN go get -v github.com/madhukard/tail

# expecting to run the test successfully.
RUN go test -v github.com/madhukard/tail

# expecting to install successfully
RUN go install -v github.com/madhukard/tail
RUN go install -v github.com/madhukard/tail/cmd/gotail

RUN $GOPATH/bin/gotail -h || true

ENV PATH $GOPATH/bin:$PATH
CMD ["gotail"]
