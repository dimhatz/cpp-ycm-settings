#############################################################################
# This is a simple makefile to compile multiple standalone .cpp files
#############################################################################

####### Compiler options
# -W is older name for -Wextra, still supported but -Wextra is more descriptive.
#  Ultimately, they are equivalent.
#
#  -D_REENTRANT use thread safe versions of some functions from libraries
#  -g is for debug
CXX           = g++
DEFINES       = -D_REENTRANT
CXXFLAGS      = -g -pipe -Wall -Wextra -fPIE $(DEFINES)

SRCFILES= $(wildcard *.cpp)
EXECUTABLES= $(patsubst %.cpp, %, $(SRCFILES))

# this will automatically associate with .cpp files and produce executables
all: ${EXECUTABLES}

clean:
	rm -f --verbose $(EXECUTABLES)
