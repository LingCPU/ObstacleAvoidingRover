CXX = g++
NVCC = /usr/local/cuda/bin/nvcc

CXXFLAGS = -Wall -O2 -I/usr/include/opencv4
NVCCFLAGS = -O2 -I/usr/include/opencv4

LDLIBS = -lopencv_core \
         -lopencv_imgproc \
         -lopencv_calib3d \
         -lopencv_highgui \
         -lopencv_videoio

TARGET = rtStereo
OBJS = rtStereo.o stereoDepth.o stereoKernel.o

.PHONY: all clean run test calibration

all: $(TARGET)

$(TARGET): $(OBJS)
	$(NVCC) -o $@ $^ $(LDLIBS)

rtStereo.o: rtStereo.cc stereoDepth.h
	$(CXX) $(CXXFLAGS) -c $< -o $@

stereoDepth.o: stereoDepth.cu stereoDepth.h stereoKernel.h
	$(NVCC) $(NVCCFLAGS) -c $< -o $@

stereoKernel.o: stereoKernel.cu
	$(NVCC) $(NVCCFLAGS) -c $< -o $@

run: $(TARGET)
	./$(TARGET)

test:
	$(MAKE) -C test

calibration:
	$(MAKE) -C pCalib

clean:
	rm -f $(OBJS) $(TARGET)
	$(MAKE) -C test clean
	$(MAKE) -C pCalib clean