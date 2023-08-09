# Use the official Python base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the entire project directory into the container
COPY . /app

# Install system dependencies for building NumPy and creating virtual environment
RUN apt-get update \
    && apt-get install -y build-essential python3-venv \
    && apt-get clean

# Create a virtual environment
RUN python3 -m venv env

# Activate the virtual environment
ENV PATH="/app/env/bin:$PATH"

# Install Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port on which Flask runs
EXPOSE 5000

# Command to run the Flask app
CMD ["python", "app.py"]
