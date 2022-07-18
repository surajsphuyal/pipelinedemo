# our base image
FROM alpine:3.5

# Install python and pip
RUN apk add --update py2-pip

# upgrade pip
RUN pip install --upgrade pip

# install Python modules needed by the Python app
WORKDIR /usr/src/app/
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy files required for the app to run
COPY app.py .
COPY templates/index.html templates/

# tell the port number the container should expose
EXPOSE 5000

# run the application
CMD ["python", "/usr/src/app/app.py"]