import subprocess

path_rars = r"..\rars1_6.jar"  # RARS emulator address in the project
path_main = r"..\..\code\main.asm"  # Address of the main file
sample_test_case = r"..\test_cases\test_case"  # To correctly read all the tests, we use a template to which we will
# append paths to test assignments in the project
test_cases = []
flag = True

with open(r'..\test_cases\info.txt') as file:  # The info.txt file contains a single digit - the number of test
    # assignments
    n = int(file.readline())

for i in range(1, n + 1):
    path_input = sample_test_case + str(i) + r"\input.txt"  # Address of the input data file
    path_output = sample_test_case + str(i) + r"\expected_output.txt"  # Address of the output file
    dict_prom = {}  # Dictionary to store input and output
    with open(path_input) as file:
        dict_prom["input"] = file.readlines()
    with open(path_output) as file:
        dict_prom["output"] = [line.rstrip("\n") for line in file.readlines()]  # Since when reading a file using
        # file.readlines(), a \n character remains at the end, but it is not present when capturing the output in
        # subprocess, we remove it from the end
    test_cases.append(dict_prom)

for i in range(0, n):
    process = subprocess.Popen(["java", "-jar", path_rars, path_main],
                               stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    input_txt = test_cases[i]["input"]
    output_txt = test_cases[i]["output"]

    for el in input_txt:
        process.stdin.write(el)  # Enter the value in the console
        process.stdin.flush()  # Clear the buffer
    process.stdin.close()  # Close the input

    stdout, stderr = process.communicate()  # Capture the output
    process.terminate()  # Terminate application playback

    stdout = stdout.splitlines()[2:len(stdout)]  # Since when running the RARS emulator in Python, two unnecessary
    # phrases are displayed at the beginning, remove them
    print(f"Test assignment {i + 1} {'was' if output_txt == stdout else 'was not'} passed{', testing result - success' if output_txt == stdout else ''}.")  # Main check
    if output_txt != stdout:
        flag = False

if flag:
    print('The program passed all tests successfully.')
else:
    print('The program did not pass all tests.')