# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.26

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2023.2.1\bin\cmake\win\x64\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2023.2.1\bin\cmake\win\x64\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\elias\CLionProjects\Pv_Automation

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\elias\CLionProjects\Pv_Automation\cmake-build-debug-mingw

# Include any dependencies generated for this target.
include CMakeFiles/Pv_Automation.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/Pv_Automation.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/Pv_Automation.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Pv_Automation.dir/flags.make

CMakeFiles/Pv_Automation.dir/main.cpp.obj: CMakeFiles/Pv_Automation.dir/flags.make
CMakeFiles/Pv_Automation.dir/main.cpp.obj: C:/Users/elias/CLionProjects/Pv_Automation/main.cpp
CMakeFiles/Pv_Automation.dir/main.cpp.obj: CMakeFiles/Pv_Automation.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\elias\CLionProjects\Pv_Automation\cmake-build-debug-mingw\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Pv_Automation.dir/main.cpp.obj"
	C:\PROGRA~1\JETBRA~1\CLION2~1.1\bin\mingw\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Pv_Automation.dir/main.cpp.obj -MF CMakeFiles\Pv_Automation.dir\main.cpp.obj.d -o CMakeFiles\Pv_Automation.dir\main.cpp.obj -c C:\Users\elias\CLionProjects\Pv_Automation\main.cpp

CMakeFiles/Pv_Automation.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Pv_Automation.dir/main.cpp.i"
	C:\PROGRA~1\JETBRA~1\CLION2~1.1\bin\mingw\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\elias\CLionProjects\Pv_Automation\main.cpp > CMakeFiles\Pv_Automation.dir\main.cpp.i

CMakeFiles/Pv_Automation.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Pv_Automation.dir/main.cpp.s"
	C:\PROGRA~1\JETBRA~1\CLION2~1.1\bin\mingw\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\Users\elias\CLionProjects\Pv_Automation\main.cpp -o CMakeFiles\Pv_Automation.dir\main.cpp.s

CMakeFiles/Pv_Automation.dir/student_code/main.cpp.obj: CMakeFiles/Pv_Automation.dir/flags.make
CMakeFiles/Pv_Automation.dir/student_code/main.cpp.obj: C:/Users/elias/CLionProjects/Pv_Automation/student_code/main.cpp
CMakeFiles/Pv_Automation.dir/student_code/main.cpp.obj: CMakeFiles/Pv_Automation.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\elias\CLionProjects\Pv_Automation\cmake-build-debug-mingw\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Pv_Automation.dir/student_code/main.cpp.obj"
	C:\PROGRA~1\JETBRA~1\CLION2~1.1\bin\mingw\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Pv_Automation.dir/student_code/main.cpp.obj -MF CMakeFiles\Pv_Automation.dir\student_code\main.cpp.obj.d -o CMakeFiles\Pv_Automation.dir\student_code\main.cpp.obj -c C:\Users\elias\CLionProjects\Pv_Automation\student_code\main.cpp

CMakeFiles/Pv_Automation.dir/student_code/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Pv_Automation.dir/student_code/main.cpp.i"
	C:\PROGRA~1\JETBRA~1\CLION2~1.1\bin\mingw\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\elias\CLionProjects\Pv_Automation\student_code\main.cpp > CMakeFiles\Pv_Automation.dir\student_code\main.cpp.i

CMakeFiles/Pv_Automation.dir/student_code/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Pv_Automation.dir/student_code/main.cpp.s"
	C:\PROGRA~1\JETBRA~1\CLION2~1.1\bin\mingw\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\Users\elias\CLionProjects\Pv_Automation\student_code\main.cpp -o CMakeFiles\Pv_Automation.dir\student_code\main.cpp.s

# Object files for target Pv_Automation
Pv_Automation_OBJECTS = \
"CMakeFiles/Pv_Automation.dir/main.cpp.obj" \
"CMakeFiles/Pv_Automation.dir/student_code/main.cpp.obj"

# External object files for target Pv_Automation
Pv_Automation_EXTERNAL_OBJECTS =

Pv_Automation.exe: CMakeFiles/Pv_Automation.dir/main.cpp.obj
Pv_Automation.exe: CMakeFiles/Pv_Automation.dir/student_code/main.cpp.obj
Pv_Automation.exe: CMakeFiles/Pv_Automation.dir/build.make
Pv_Automation.exe: CMakeFiles/Pv_Automation.dir/linkLibs.rsp
Pv_Automation.exe: CMakeFiles/Pv_Automation.dir/objects1.rsp
Pv_Automation.exe: CMakeFiles/Pv_Automation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\elias\CLionProjects\Pv_Automation\cmake-build-debug-mingw\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable Pv_Automation.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\Pv_Automation.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Pv_Automation.dir/build: Pv_Automation.exe
.PHONY : CMakeFiles/Pv_Automation.dir/build

CMakeFiles/Pv_Automation.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\Pv_Automation.dir\cmake_clean.cmake
.PHONY : CMakeFiles/Pv_Automation.dir/clean

CMakeFiles/Pv_Automation.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\elias\CLionProjects\Pv_Automation C:\Users\elias\CLionProjects\Pv_Automation C:\Users\elias\CLionProjects\Pv_Automation\cmake-build-debug-mingw C:\Users\elias\CLionProjects\Pv_Automation\cmake-build-debug-mingw C:\Users\elias\CLionProjects\Pv_Automation\cmake-build-debug-mingw\CMakeFiles\Pv_Automation.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Pv_Automation.dir/depend

