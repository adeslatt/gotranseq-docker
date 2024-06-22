# gotranseq-docker
[![Docker Image CI](https://github.com/adeslatt/gotranseq-docker/actions/workflows/docker-image.yml/badge.svg)](https://github.com/adeslatt/gotranseq-docker/actions/workflows/docker-image.yml)[![Docker](https://github.com/adeslatt/gotranseq-docker/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/adeslatt/gotranseq-docker/actions/workflows/docker-publish.yml)

#Container for go-transeq

# forked from felixx

Many thanks to Adrien Petel who made a Go version of the transeq software

[gotranseq from felixx](https://github.com/feliixx/gotranseq)

## Go version of EMBOSS transeq

Translate nucleic acid sequences to their corresponding peptide sequences. Like EMBOSS transeq, but written in go

EMBOSS transeq is a great tool, but can be quite painfull for some use cases, because it silently truncate the sequence ID if it contains chars like ':', or rename the sequence ID if it contains chars like '|'


## Update with Adrien

This tool is an attempt to solve this problem. It's also way faster than EMBOSS transeq because it can be parrallelized:

## Improvement

benchmark on ubuntu 16.04, machine with 2 CPU Intel(R) Core(TM)2 Duo CPU 3.00GHz with a 189MB fasta file:

```bash
#EMBOSS transeq
time transeq -sequence file.fna -outseq out.faa -frame 6  
41,82s user 0,76s system 85% cpu 49,696 total

#gotranseq
time ./gotranseq --sequence file.fna --outseq out.faa --frame 6 -n 2
7,75s user 0,98s system 159% cpu 5,472 total
```

Containerized to make it accessible to workflows

Works on Linux, Mac and windows

### Build

To build your image from the command line:
* You can do this on [Google shell](https://shell.cloud.google.com) since docker is installed and available.

```bash
docker build -t gotranseq:latest .
```

### Test

There are unit tests run as well found in the subdirectory `tests`


###
To test this container from the command line:

Set up an environment variable capturing your current command line:

```
PWD=$(pwd)
```

Then mount and use your current directory and call the tool now encapsulated within the environment. The input to gotranseq is one fasta file of open reading frames

```
docker run -it -v $PWD:$PWD -w $PWD gotranseq:latest gotranseq -h
```

Disclaimer
THIS WEBSITE AND CONTENT AND ALL SITE-RELATED SERVICES, INCLUDING ANY DATA, ARE PROVIDED "AS IS," WITH ALL FAULTS, WITH NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, ANY WARRANTIES OF MERCHANTABILITY, SATISFACTORY QUALITY, NON-INFRINGEMENT OR FITNESS FOR A PARTICULAR PURPOSE. YOU ASSUME TOTAL RESPONSIBILITY AND RISK FOR YOUR USE OF THIS SITE, ALL SITE-RELATED SERVICES, AND ANY THIRD PARTY WEBSITES OR APPLICATIONS. NO ORAL OR WRITTEN INFORMATION OR ADVICE SHALL CREATE A WARRANTY OF ANY KIND. ANY REFERENCES TO SPECIFIC PRODUCTS OR SERVICES ON THE WEBSITES DO NOT CONSTITUTE OR IMPLY A RECOMMENDATION OR ENDORSEMENT BY SCIENCE and TECHNOLOGY CONSULTING LLC.

