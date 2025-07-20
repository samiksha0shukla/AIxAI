FROM python:3.11-slim

WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the MCP server files
COPY . .

# Expose the port for MCP server
EXPOSE 8100

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Command to run the MCP server
CMD ["python", "mcp_server.py"]