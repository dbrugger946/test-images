FROM registry.access.redhat.com/ubi9/ubi

RUN adduser \
--no-create-home \
--system \
--shell /usr/sbin/nologin \

python-server

RUN mkdir /test-img
RUN mkdir /test-img/img

WORKDIR /test-img
COPY ./src/* .
COPY ./src/img/* ./img/
USER python-server

CMD ["python3", "-m", "http.server", "5000"]
