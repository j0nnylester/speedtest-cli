FROM __base_image__:latest
RUN apk add --no-cache ca-certificates python3
RUN pip3 install speedtest-cli
ENTRYPOINT ["speedtest-cli"]
CMD ["--simple", "--share"]
