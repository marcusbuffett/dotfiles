#!/usr/bin/python

""" 
Usage:
 compile foo       # runs clang++ <options> foo.cpp -o foo
 compile foo.cpp   # same as previous
 compile foo.cpp bar.cpp baz.o -o bar # runs clang++ <options> <args>

To install, put this in ~, chmod u+x it, 
and add 'alias compile .compile.py' to .bashrc 

Contact: dpritcha@usc.edu
"""

if __name__ == "__main__":
    import os, sys
    if len(sys.argv) <= 1:
        print("Error in 'compile': no arguments given")
    else:
        args = sys.argv[1:]
        if len(args) == 1:
            arg = args[0]
            if arg.endswith(".cpp"):
               arg = arg[:-4]
            args = [arg+".cpp", "-o", arg]
        prefix = ["g++", 
                  "-Wall", "-Wvla", "-Wshadow", "-Wunreachable-code",
                  "-Wconversion",
                  "-Wno-shorten-64-to-32", "-Wno-sign-conversion", 
                  "-Wno-sign-compare", "-Wno-write-strings",
                  "-g"]
        os.system(" ".join(prefix + args))

