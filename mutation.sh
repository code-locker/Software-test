#!/bin/bash
# Change to the directory containing the Python script
cd "./test_suit"
# Define the output file for both stdout and stderr
output_file="mutation_output.log"


coverage run -m pytest test_mutationAdequate.py
coverage report -m --include="test_mutationAdequate.py"
coverage html -d statement_html

coverage run --branch test_mutationAdequate.py
coverage report -m --include="test_mutationAdequate.py"
coverage html -d initial_decision_html


# Check the operating system
if [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    # Linux
    PYTHON_EXECUTABLE="python3"
elif [ "$(expr substr $(uname -s) 1 10)" = "MINGW32_NT" ]; then
    # Windows
    PYTHON_EXECUTABLE="python3.exe"
fi

# Use tee to capture both stdout and stderr and save them to the file
{
    $PYTHON_EXECUTABLE mut.py --target isTriangle --unit-test test_mutationAdequate -m 
    $PYTHON_EXECUTABLE mut.py --target isTriangle --unit-test test_mutationAdequate -m --report-html mutation_report.html 
} 2>&1 | tee "$output_file"


