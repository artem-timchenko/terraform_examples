import sys
import hcl2
from os import listdir
from os.path import isfile, join

variables = []
used_variables = []

if len(sys.argv) > 1:
    directory = sys.argv[1]
else:
    directory = "."

files_in_dir = [f for f in listdir(directory) if isfile(join(directory, f))]
var_file = directory + "/variables.tf"

with(open(var_file, 'r')) as file:
    dict = hcl2.load(file)
    for key_value in dict["variable"]:
        variables.append(list(key_value.keys())[0])

for conf_file in files_in_dir:
    if conf_file != "variables.tf":
        tf_src = open(join(directory, conf_file)).read()
        for variable in variables:
            if f"var.{variable}" in tf_src:
                used_variables.append(variable)
for variable in variables:
    if variable not in used_variables:
        print(variable)
