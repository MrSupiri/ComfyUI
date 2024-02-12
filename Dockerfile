FROM pytorch/pytorch:2.2.0-cuda12.1-cudnn8-runtime

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY requirements.txt /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app

# Make port 8188 available to the world outside this container
EXPOSE 8188

# Run app.py when the container launches
CMD ["python", "main.py", "--listen", "0.0.0.0", "--port", "8188", "--force-fp16"]
