FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app

# Expose the port for Streamlit
EXPOSE 8501

# Expose port for the Agenteer Service (started within streamlit)
EXPOSE 8100

# Set the entrypoint to run Streamlit directly
CMD ["streamlit", "run", "user_interface.py", "--server.port=8501", "--server.address=0.0.0.0"]