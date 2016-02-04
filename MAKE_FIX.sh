###Shell Script to correct make errors###
#
#initial make
make
#add dedisp libraries (location is computer dependent: this works for transient)
cd Applications
/bin/sh ../libtool --tag=CXX   --mode=link g++  -g -O2  -I/usr/local/cuda/include   -o heimdall heimdall.o ../Formats/libhdformats.la ../Pipeline/libhdpipeline.la ../Network/libhdnetwork.la -L/usr/local/cuda-7.5/targets/x86_64-linux/lib -lcudart  -L/share/apps/pulsar/psrdada/lib -lpsrdada -L/share/apps/pulsar/dedisp-read-only/lib -ldedisp
#
#next make
#
cd ..
make
#
#change compiler to C++ from C and add dedisp libraries
#
cd Applications
/bin/sh ../libtool --tag=CXX   --mode=link g++  -g -O2    -o candidate_profiler candidate_profiler.o ../Formats/libhdformats.la ../Pipeline/libhdpipeline.la ../Network/libhdnetwork.la -L/usr/local/cuda-7.5/targets/x86_64-linux/lib -lcudart  -L/share/apps/pulsar/psrdada/lib -lpsrdada -L/share/apps/pulsar/dedisp-read-only/lib -ldedisp
#
#next make
#
cd ..
make
#
#change compiler, add libraries again
#
cd Applications
/bin/sh ../libtool --tag=CXX   --mode=link g++  -g -O2    -o fil2pgm fil2pgm.o ../Formats/libhdformats.la ../Pipeline/libhdpipeline.la ../Network/libhdnetwork.la -L/usr/local/cuda-7.5/targets/x86_64-linux/lib -lcudart  -L/share/apps/pulsar/psrdada/lib -lpsrdada -L/share/apps/pulsar/dedisp-read-only/lib -ldedisp
#
#final make
#
cd ..
make
echo "Done!"

