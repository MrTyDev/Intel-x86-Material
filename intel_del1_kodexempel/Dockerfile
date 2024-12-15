FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    gcc \
    qemu-user-static \
    binutils

# Copy your assembly code to the container
COPY hello.s /hello.s

# Compile the assembly code
RUN gcc -o hello /hello.s

# Set the entrypoint to run the compiled binary
ENTRYPOINT ["/usr/bin/qemu-x86_64-static", "/hello"]