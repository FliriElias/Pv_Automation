
import os
import subprocess

def run_test(student_program, input_file, output_file, expected_output_file):
    # Compile the student's C++ program
    compile_command = f"g++ {student_program} -o program.exe"
    subprocess.run(compile_command, shell=True, check=True)

    # Run the compiled program with input file and create a separate output file for each test case
    test_case_name = os.path.splitext(os.path.basename(input_file))[0]
    output_dir = "tests/output"
    os.makedirs(output_dir, exist_ok=True)  # Create the output directory if it doesn't exist
    program_output_file = os.path.join(output_dir, f"{test_case_name}_output.txt")
    run_command = f".\\program.exe < {input_file} > {program_output_file}"
    subprocess.run(run_command, shell=True, check=True)

    # Compare the generated output with the expected output
    diff_command = f"fc {program_output_file} {expected_output_file}"  # Use 'fc' for file comparison on Windows
    result = subprocess.run(diff_command, shell=True)

    return result.returncode == 0




def generate_html_report(results):
    with open("test_report.html", "w") as report_file:
        report_file.write("<html>\n")
        report_file.write("<head><title>Test Report</title></head>\n")
        report_file.write("<style>\n")
        report_file.write(".scrollable-box { width: 100%; max-width: 100vw; overflow: auto; white-space: pre-wrap; }\n")
        report_file.write(".correct-char { background-color: rgba(0, 255, 0, 0.3); }\n")  # Green with 30% opacity
        report_file.write(".different-char { background-color: rgba(255, 0, 0, 0.3); }\n")  # Red with 30% opacity
        report_file.write("</style>\n")
        report_file.write("<body>\n")
        report_file.write("<h1>Test Report</h1>\n")

        for test_case, result in results.items():
            test_case_name = test_case.split(" (")[0]  # Extract test case name
            program_output_file = f"tests/output/{test_case_name}_output.txt"  # Use the specific program output file
            input_file = f"tests/input/{test_case_name}.in"  # Input file path
            report_file.write(f"<div style='border: 1px solid #ccc; padding: 10px; margin-bottom: 20px;'>\n")
            report_file.write(f"<h2>{test_case_name}</h2>\n")
            report_file.write("<div style='display: flex;'>\n")
          
            
            
            # Left Column: Result (Passed or Failed)
            report_file.write("<div style='flex: 1;'>\n")
            report_file.write("<h3>Result: " + ('<span style="color: green;">Passed</span>' if result else '<span style="color: red;">Failed</span>') + "</h3>\n")
            report_file.write("</div>\n")
            
            # Right Column: Expected Output
            report_file.write("<div style='flex: 1;'>\n")
            report_file.write("<h3>Expected Output</h3>\n")
            with open(f"tests/output/{test_case_name}.out", "r") as expected_output_file:
                expected_output = expected_output_file.read()
                report_file.write(f"<div class='scrollable-box'>")
                highlight_characters(report_file, expected_output, program_output_file)
                report_file.write("</div>\n")
            report_file.write("</div>\n")
            
            # Right Column: Program Output
            report_file.write("<div style='flex: 1;'>\n")
            report_file.write("<h3>Program Output</h3>\n")
            with open(program_output_file, "r") as program_output_file:
                program_output = program_output_file.read()
                report_file.write(f"<div class='scrollable-box'>")
                highlight_characters(report_file, program_output, f"tests/output/{test_case_name}.out")
                report_file.write("</div>\n")
            report_file.write("</div>\n")
            
                # Input
            report_file.write("<h3>Input</h3>\n")
            with open(input_file, "r") as input_file_content:
                input_data = input_file_content.read()
                report_file.write(f"<pre>{input_data}</pre>\n")
            
            report_file.write("</div>\n")
            report_file.write("</div>\n")

        report_file.write("</body>\n")
        report_file.write("</html>\n")

def highlight_characters(report_file, output, expected_output_file):
    with open(expected_output_file, "r") as expected_output_file:
        expected_output = expected_output_file.read()
    
    for char, expected_char in zip(output, expected_output):
        if char == expected_char:
            report_file.write(f"<span class='correct-char'>{char}</span>")
        else:
            report_file.write(f"<span class='different-char'>{char}</span>")



def main():
    student_programs_dir = "student_code"
    input_dir = "tests/input"
    output_dir = "tests/output"

    test_results = {}  # To store test results

    for student_program in os.listdir(student_programs_dir):
        student_program = os.path.join(student_programs_dir, student_program)

        for input_file in os.listdir(input_dir):
            input_file = os.path.join(input_dir, input_file)
            test_case_name = os.path.splitext(os.path.basename(input_file))[0]

            output_file = os.path.join(output_dir, f"{test_case_name}.out")
            expected_output_file = os.path.join(output_dir, f"{test_case_name}.out")

            result = run_test(student_program, input_file, output_file, expected_output_file)
            test_results[f"{test_case_name} ({student_program})"] = result

    generate_html_report(test_results)

if __name__ == "__main__":
    main()
