CXXFLAGS = -std=c++11 -D_FILE_OFFSET_BITS=64 -Os -flto
LDFLAGS = -lssl -lcrypto

all: CDecrypt

CDecrypt: main.o
	$(CXX) main.o $(LDFLAGS) -o $@ -s -Wl,--gc-sections -static

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -ffunction-sections -fdata-sections -c $<

clean:
	$(RM) main.o
	$(RM) CDecrypt
