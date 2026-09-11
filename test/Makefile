CXX = g++
NVCC = /usr/local/cuda/bin/nvcc

ROOT = ..

CXXFLAGS = -Wall -O2 -I$(ROOT) -I/usr/include/opencv4
NVCCFLAGS = -O2 -I$(ROOT) -I/usr/include/opencv4

LDLIBS = -lopencv_core \
         -lopencv_imgproc \
         -lopencv_highgui \
         -lopencv_imgcodecs

TARGET = stereoCuda
OBJS = stereoCuda.o stereoDepth.o stereoKernel.o

.PHONY: all clean run

all: $(TARGET)

$(TARGET): $(OBJS)
	$(NVCC) -o $@ $^ $(LDLIBS)

stereoCuda.o: stereoCuda.cc
	$(CXX) $(CXXFLAGS) -c $< -o $@

stereoDepth.o: $(ROOT)/stereoDepth.cu
	$(NVCC) $(NVCCFLAGS) -c $< -o $@

stereoKernel.o: $(ROOT)/stereoKernel.cu
	$(NVCC) $(NVCCFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

run: $(TARGET)
	./$(TARGET)