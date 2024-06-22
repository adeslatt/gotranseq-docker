# Set the working directory inside the container
WORKDIR /app

# Copy the environment.yml file and install dependencies
COPY environment.yml /app/environment.yml
RUN conda env create -f environment.yml

# Set the environment variables
ENV PATH /opt/conda/envs/gotranseq/bin:$PATH

# Copy the current directory contents into the container at /app
COPY . /app

# Install Go using conda
RUN conda install -c conda-forge go

# Build the Go application
RUN go build -o gotranseq

# Run tests
RUN go test ./...

# Run the Go application
CMD ["./gotranseq", "--help"]
