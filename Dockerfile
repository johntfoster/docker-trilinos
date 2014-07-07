FROM johntfoster/netcdf:largefiles

MAINTAINER John Foster <johntfosterjr@gmail.com>

ENV HOME /root

RUN apt-get -yq install gfortran python
RUN apt-get -yq install libblas-dev liblapack-dev
RUN apt-get -yq install libboost-dev
RUN apt-get -yq install libopenmpi-dev
RUN apt-get -yq install cmake

#Build Trilinos
RUN wget http://trilinos.sandia.gov/download/files/trilinos-11.8.1-Source.tar.bz2;\
    tar xjvf trilinos-11.8.1-Source.tar.bz2;\
    mkdir trilinos-11.8.1-Source/build
ADD trilinos-debian-cmake.sh /trilinos-11.8.1-Source/build/trilinos-debian-cmake.sh
RUN cd trilinos-11.8.1-Source/build;\
    ./trilinos-debian-cmake.sh;\
    make -j16 && make install;\
    cd ../..;\
    rm -rf trilinos-11.8.1-Source trilinos-11.8.1-Source.tar.bz2 

