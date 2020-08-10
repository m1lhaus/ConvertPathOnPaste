#!/usr/bin/python3

import os
import argparse
import subprocess

import pyperclip

CYGPATH = r"C:\cygwin64\bin\cygpath.exe"


def escape_backslashes(path):
    return os.path.normpath(path).replace("\\", "\\\\")


def backward_to_forward_slashes(path):
    return os.path.normpath(path).replace("\\", "/")


def run_cygpath(path, arg):
    if not os.path.isfile(CYGPATH):
        raise Exception(f"Cygpath executable '{CYGPATH}' was not found!")
    proc = subprocess.run([CYGPATH, path, arg], capture_output=True, text=True)
    proc.check_returncode()
    return proc.stdout.strip()


def convert_to_cygpath(path):
    return run_cygpath(path, "-u")


def convert_from_cygpath(path):
    return run_cygpath(path, "-w")


available_features = {
    "normalize": os.path.normpath,
    "double": escape_backslashes,
    "forward": backward_to_forward_slashes,
    "to_cygpath": convert_to_cygpath,
    "from_cygpath": convert_from_cygpath
}


def execute_action(action):
    path = pyperclip.paste()
    print("Input:", path)
    runner = available_features[action]
    print("Action:", action)
    processed_path = runner(path)
    print("Output:", processed_path)
    pyperclip.copy(processed_path)


if __name__ == '__main__':
    arg_parser = argparse.ArgumentParser(description="")
    arg_parser.add_argument("action", type=str, choices=available_features.keys(), help="")
    args = arg_parser.parse_args()
    execute_action(args.action)

