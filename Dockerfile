# Use the official Miniconda3 image
FROM continuumio/miniconda3

# Set the working directory inside the container
WORKDIR /app

# Install git
RUN apt-get update && apt-get install -y git

# Clone your forked repository
RUN git clone https://github.com/adeslatt/gotranseq.git .

# Install Go using conda
RUN conda install -c conda-forge go

# Build the Go application
RUN go build -o gotranseq

# Run tests
RUN go test ./...

# Run the Go application
CMD ["./gotranseq", "--help"]
