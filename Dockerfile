FROM fedora:31

RUN dnf install -y python3 python3-pip && \
  pip3 install websockets ansi2html

ADD server.py /server.py

RUN mkdir /logs

EXPOSE 8765
ENTRYPOINT ["/bin/bash", "-c"]
CMD ["python3 /server.py --prefix=/logs"]
