# Use the official Python image from the Docker Hub with a slim variant
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container at /app
COPY . .

EXPOSE 5000

# run the application
CMD ["python", "/usr/src/app/app.py"]
