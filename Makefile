CXXFLAGS = -std=c++11 -Os -flto
LDFLAGS = -l:libssl.a -l:libcrypto.a

ifeq ($(OS),Windows_NT) 
LDFLAGS := $(LDFLAGS) -static
endif

all: CDecrypt

CDecrypt: main.o
	$(CXX) main.o $(LDFLAGS) -o $@ -s -Wl,--gc-sections

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -ffunction-sections -fdata-sections -c $<

clean:
	$(RM) main.o
	$(RM) CDecrypt
