© 2023 Pöhl Luis Lenz
Permission granted for free usage and modification with proper attribution to the owner.

**Note:** This script is designed for single-file testing and does not support testing of source code with self-written includes or multiple files.

Automated Unit Testing with Python and GCC
------------------------------------------

This script automates the process of unit testing C++ programs using Python and GCC (GNU Compiler Collection).
It compiles C++ programs, runs them with input files, and compares their output with expected results.

Prerequisites
-------------

Before using this script, ensure that the following prerequisites are met:

1. GCC (GNU Compiler Collection): GCC is required to compile C++ programs. To check if it's installed, open a console or terminal and run the command "gcc".
  If GCC is not found, you can download it from GCC Official Website.

2. Python: Python is required to run the test script. To check if Python is installed, open a console or terminal and run the command "python -v".
  You can download Python from the Python Official Website.

Getting Started
---------------

Follow these steps to set up and run the automated unit tests:

1. Organize Your Files:
   - Place your C++ source file(s) in the "student_code" folder. Each source file should contain the C++ program you want to test.

2. Prepare Test Cases:
   - Create input files for your test cases in the "tests/input" folder. Name them with a ".in" extension (e.g., test_case1.in).
   - Create corresponding output files for your test cases in the "tests/output" folder. Name them with a ".out" extension (e.g., test_case1.out).

3. Run the Test Script:
   - Execute the test script by running "python test_runner.py" in your console or terminal.

4. Review the Test Report:
   - After running the script, it will generate an HTML test report named "test_report.html" in the same directory. Open this report in a web browser to view the test results.

Test Report
-----------

The test report provides a clear overview of the test results for each test case. It includes the following information for each test case:

- Test Case Name: The name of the test case derived from the input file name.
- Result: Indicates whether the test passed (displayed in green) or failed (displayed in red).
- Expected Output: The expected program output for the test case.
- Program Output: The actual output produced by the program.

Differences between the expected and program output are highlighted for easy identification.

Example Files
-------------

This script includes example files in the "student_code," "tests/input," and "tests/output" directories to demonstrate how to organize your source code and test cases.
You can use these examples as a reference when creating your own tests.

Now you're ready to automate your C++ program testing with this script. Happy coding and testing!
