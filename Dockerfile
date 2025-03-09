# Use an appropriate base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy your requirements.txt file into the container
COPY requirements.txt .

# Install dependencies from the requirements file
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Expose the port that your app will run on
EXPOSE 8080

# Start your application with gunicorn
CMD ["gunicorn", "service:app", "-b", "0.0.0.0:8080"]
