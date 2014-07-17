FROM johntfoster/netcdf:largefiles

MAINTAINER John Foster <johntfosterjr@gmail.com>

ENV HOME /root

RUN apt-get -yq install g++ \ 
                        gfortran \
                        python \ 
                        libblas-dev \
                        liblapack-dev \
                        libboost-dev \
                        libopenmpi-dev \
                        cmake

#Build Trilinos
RUN wget http://trilinos.sandia.gov/download/files/trilinos-11.8.1-Source.tar.bz2; \
    tar xjvf trilinos-11.8.1-Source.tar.bz2; \
    mkdir trilinos-11.8.1-Source/build
ADD trilinos-debian-cmake.sh /trilinos-11.8.1-Source/build/trilinos-debian-cmake.sh
RUN cd trilinos-11.8.1-Source/build; \
    ./trilinos-debian-cmake.sh; \
    make && make install; \
    cd ../..; \
    rm -rf trilinos-11.8.1-Source trilinos-11.8.1-Source.tar.bz2 

