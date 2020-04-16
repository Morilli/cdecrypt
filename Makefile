CXXFLAGS = -std=c++11 -D_FILE_OFFSET_BITS=64
LDFLAGS = -lssl -lcrypto

all: CDecrypt

CDecrypt: main.o
	$(CXX) main.o $(LDFLAGS) -o $@

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $<

clean:
	$(RM) main.o
	$(RM) CDecrypt
