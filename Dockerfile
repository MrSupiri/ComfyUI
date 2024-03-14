FROM pytorch/pytorch:2.2.0-cuda12.1-cudnn8-runtime

# Install git
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 git  -y

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN find . -name requirements.txt -print0 | xargs -0 -n1 pip install --no-cache-dir -r

# Make port 8188 available to the world outside this container
EXPOSE 8188

# Run app.py when the container launches
CMD ["python", "main.py", "--listen", "0.0.0.0", "--port", "8188", "--force-fp16"]
