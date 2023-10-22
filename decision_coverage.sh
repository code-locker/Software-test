#!/bin/bash

cd "./test_suit"
coverage run --branch test_decisionCoverage.py
coverage report -m --include="test_decisionCoverage.py"
coverage html -d decision_html



coverage run --branch test_decisionCoverage.py
coverage report -m --include="test_decisionCoverage.py"
coverage html -d initial_decision_html




# Check the operating system
if [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    # Linux
    PYTHON_EXECUTABLE="python3"
elif [ "$(expr substr $(uname -s) 1 10)" = "MINGW32_NT" ]; then
    # Windows
    PYTHON_EXECUTABLE="python3.exe"
fi


output_file="initial_mutation_output.log"

{
    $PYTHON_EXECUTABLE mut.py --target isTriangle --unit-test test_decisionCoverage -m
    $PYTHON_EXECUTABLE mut.py --target isTriangle --unit-test test_decisionCoverage -m --report-html initial_mutation_report.html
} 2>&1 | tee "$output_file"