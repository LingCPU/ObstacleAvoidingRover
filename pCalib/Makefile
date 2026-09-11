CXX = g++

CXXFLAGS = -Wall -O2 -I/usr/include/opencv4

LDLIBS = -lopencv_core \
         -lopencv_imgproc \
         -lopencv_calib3d \
         -lopencv_highgui \
         -lopencv_imgcodecs

TARGETS = pCalib pPose pRectify

.PHONY: all clean run-calib run-pose run-rectify

all: $(TARGETS)

%: %.cc
	$(CXX) $(CXXFLAGS) $< -o $@ $(LDLIBS)

run-calib: pCalib
	./pCalib

run-pose: pPose
	./pPose

run-rectify: pRectify
	./pRectify

clean:
	rm -f $(TARGETS)
