# Use official Python image
FROM python:3.10

# Set the working directory
WORKDIR /app

# Copy the project files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Create staticfiles directory before collecting static files
RUN mkdir -p /app/staticfiles && python manage.py collectstatic --noinput

# Expose the application port
EXPOSE 8000

# Start Gunicorn server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "doctor_finder.wsgi:application"]