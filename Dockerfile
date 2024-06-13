# Use the official Ubuntu image as a base
FROM ubuntu:latest


# Update package lists and install necessary packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    && rm -rf /var/lib/apt/lists/*


RUN curl -fsSL https://code-server.dev/install.sh | sh
# Set the working directory in the container
WORKDIR /app

# Copy the entire current directory into the container at /app
COPY . /app

# Install pyxtermjs
RUN pip3 install -r requirements.txt --break-system-packages
RUN code-server --port 6070 --auth none

# Run the pyxtermjs command when the container starts
CMD ["python3", "main.py"]
USER 10008
