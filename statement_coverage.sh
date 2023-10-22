#!/bin/sh
# Change to the directory containing the Python script
cd "./test_suit"
coverage run -m pytest test_statementCoverage.py
coverage report -m --include="test_statementCoverage.py"
coverage html -d statement_html


coverage run --branch test_statementCoverage.py
coverage report -m --include="test_statementCoverage.py"
coverage html -d initial_decision_html

##python.exe command works for windows system. Use only python if you are working on a UNIX system.


# Check the operating system
if [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    # Linux
    PYTHON_EXECUTABLE="python3"
elif [ "$(expr substr $(uname -s) 1 10)" = "MINGW32_NT" ]; then
    # Windows
    PYTHON_EXECUTABLE="python3.exe"
fi

# Define the output file for both stdout and stderr
output_file="initial_mutation_output.log"
# Use tee to capture both stdout and stderr and save them to the file
{
    $PYTHON_EXECUTABLE mut.py --target isTriangle --unit-test test_statementCoverage -m
    $PYTHON_EXECUTABLE mut.py --target isTriangle --unit-test test_statementCoverage -m --report-html initial_mutation_report.html
} 2>&1 | tee "$output_file"