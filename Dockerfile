FROM alpine:3.18 AS builder

RUN apk add --no-cache python3

FROM builder

COPY script.py .

CMD ["python", "script.py"]