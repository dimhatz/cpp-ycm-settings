#############################################################################
# This is a simple makefile to compile multiple standalone .cpp files
#############################################################################

####### Compiler options
# -W is older name for -Wextra, still supported but -Wextra is more descriptive.
#  Ultimately, they are equivalent.
#
#  -D_REENTRANT use thread safe versions of some functions from libraries
#  -g is for debug
#  -pedantic: show warnings when using non-standard extensions
#  TODO: consider adding
#  -Werror : turn every warning into error
#  -Wno-error=unused-variable : together with above, keep unused vars as warnings
CXX           = g++
DEFINES       = -D_REENTRANT
CXXFLAGS      = -pedantic -pedantic-errors -g -pipe -Wall -Wextra -fPIE -std=c++11 $(DEFINES)

SRCFILES= $(wildcard *.cpp)
EXECUTABLES= $(patsubst %.cpp, %, $(SRCFILES))

# this will automatically associate with .cpp files and produce executables
all: ${EXECUTABLES}

clean:
	rm -f --verbose $(EXECUTABLES)
