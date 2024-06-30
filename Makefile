# compiler settings 
CXX = g++
CXXFLAGS = -I ./inc -std=c++11
OPTFLAGS = -march=native -flto -funroll-loops -finline-functions -ffast-math -O3
WARNINGS = -g -Wall

# Source files and object files
SRCDIR = src
OBJDIR = obj
INCDIR = inc
SRCS = $(wildcard $(SRCDIR)/*.cpp)
OBJS = $(patsubst $(SRCDIR)/%.cpp,$(OBJDIR)/%.o,$(SRCS))

# testcase file
CASEDIR = case

TARGET = Partition

all: $(TARGET)

$(OBJDIR):
	@mkdir $(OBJDIR)

$(TARGET): main.cpp $(OBJS)
	$(CXX) $(WARNINGS) $(CXXFLAGS) $(OPTFLAGS) $^ -o $@

$(OBJDIR)/FM_Partition.o: $(SRCDIR)/FM_Partition.cpp | $(OBJDIR)
	$(CXX) $(WARNINGS) $(CXXFLAGS) $(OPTFLAGS) -c $< -o $@

$(OBJDIR)/myLinkedList.o: $(SRCDIR)/myLinkedList.cpp | $(OBJDIR)
	$(CXX) $(WARNINGS) $(CXXFLAGS) $(OPTFLAGS) -c $< -o $@

test:
	./Partition $(CASEDIR)/case3.in case3.out

clean:
	rm -rf $(OBJDIR) $(TARGET) *.out
