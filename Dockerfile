# Grab the latest alpine image
FROM alpine:latest

# Install python and pip
RUN apk add --no-cache --update python3 py3-pip bash

# Create a virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Copy dependencies
ADD ./webapp/requirements.txt /tmp/requirements.txt

# Install dependencies in the virtual environment
RUN pip install --no-cache-dir -q -r /tmp/requirements.txt

# Add our code
ADD ./webapp /opt/webapp/
WORKDIR /opt/webapp

# Run the image as a non-root user
RUN adduser -D myuser
USER myuser

# Run the app
CMD gunicorn --bind 0.0.0.0:$PORT wsgi
