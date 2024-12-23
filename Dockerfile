# Use a valid Python base image
FROM python:3.12-slim

# Set environment variables for unbuffered output and default port
ENV PYTHONUNBUFFERED=1
ENV PORT=8000

# Set the working directory
WORKDIR /app

# Copy application code into the container
COPY . /app/

# Upgrade pip and install dependencies
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Expose the default application port
EXPOSE ${PORT}

# Define the command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]