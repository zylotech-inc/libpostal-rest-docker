# Libpostal Rest Docker

libpostal (https://github.com/openvenues/libpostal) is a C library for
parsing and normalizing street addresses. Using libpostal requires
compiling a C program that downloads ~2GB of training data.

This Dockerfile automates that compilation and creates a container
with libpostal and [libpostal-rest](https://github.com/johnlonganecker/libpostal-rest) libpostal-rest which allows for a simple REST API
that makes it easy interact with libpostal.

## Build image and start up container
```
docker build -t libpostal-rest .
docker run -d -p 8080:8080 libpostal-rest
```

See REST API [here](https://github.com/johnlonganecker/libpostal-rest) 
