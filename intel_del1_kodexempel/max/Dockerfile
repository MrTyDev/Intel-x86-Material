FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    gcc \
    gcc-multilib \
    g++ \
    g++-multilib \
    qemu-user-static \
    binutils \
    binfmt-support

# Register qemu-i386-static with binfmt-support
RUN update-binfmts --enable qemu-i386

# Copy your application code to the container
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp

# Compile the assembly and C code
RUN gcc -m32 -c max.s -o max.o
RUN gcc -m32 main.c max.o -o main

# Set the entrypoint to run the compiled binary
ENTRYPOINT ["/usr/src/myapp/main"]