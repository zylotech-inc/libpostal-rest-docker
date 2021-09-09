
# Libpostal REST Docker

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

## Build image from specific libpostal git hash
```
docker build -t libpostal-rest --build-arg COMMIT=e816b4f77e8c6a7f35207ca77282ffab3712c5b6 .
```

**Works with branch names as well**
```
docker build -t libpostal-rest --build-arg COMMIT=parser-data .
```

### Parser
**Note**: For Local Environment

`curl -X POST -d '{"query": "100 main st buffalo ny"}' <host>:8080/parser`

**Note**: For Kubernetes Environment

`curl -X POST -d '{"query": "100 main st buffalo ny"}' <host>/libpostal/parser`

** Response **
```
[
  {
    "label": "house_number",
    "value": "100"
  },
  {
    "label": "road",
    "value": "main st"
  },
  {
    "label": "city",
    "value": "buffalo"
  },
  {
    "label": "state",
    "value": "ny"
  }
]
```

### Expand
**Note**: For Local Environment

`curl -X POST -d '{"query": "100 main st buffalo ny"}' <host>:8080/expand`

**Note**: For Kubernetes Environment

`curl -X POST -d '{"query": "100 main st buffalo ny"}' <host>/libpostal/expand`

** Response **
```
[
  "100 main saint buffalo new york",
  "100 main saint buffalo ny",
  "100 main street buffalo new york",
  "100 main street buffalo ny"
]
```

See REST API [here](https://github.com/zylotech-inc/libpostal-rest) 
