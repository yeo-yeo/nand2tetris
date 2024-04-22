#!/usr/bin/env python3

import io
import subprocess
import unittest

from parser import parse_assembly 

# class TestMainFile(unittest.TestCase):

#     # Check that main can run and output a success code when passed an appropriate argument
#     def test_success(self):
#         result = subprocess.run(['./main.py', './add/Add.asm'])
#         self.assertEqual(result.returncode, 0)
#         # Cleanup the created output test file
#         self.addCleanup(lambda: subprocess.run(['rm','./add/Add.hack']))

#     # Check that main will error if not provided an input file
#     def test_fail(self):
#         result = subprocess.run(['./main.py'])
#         self.assertEqual(result.returncode, 1)     

# passing in things in () is like extends
# with for files means theres nice auto cleanup


class TestParseFile(unittest.TestCase):

    # Drops empty lines
    def test_ignores_white_space(self):
        parsed = parse_assembly(io.StringIO('\n@1\n\n@2\n'))
        self.assertEqual(parsed,['0000000000000001','0000000000000010'])

    # Drops lines that begin with // (comments)
    def test_ignores_whole_line_comments(self):
        parsed = parse_assembly(io.StringIO("\n// This is a comment\n// So is this\n@1\n// Here's another!\n@2"))
        self.assertEqual(parsed,['0000000000000001','0000000000000010'])

    # Can parse an instruction like @2
    def test_parse_simple_a_instruction(self):
        parsed = parse_assembly(io.StringIO('@2\n'))
        self.assertEqual(parsed, ['0000000000000010'])

    # Can parse a comp only C instruction like D+1
    def test_parse_comp_only_c_instruction(self):
        parsed = parse_assembly(io.StringIO('D+1\n'))
        self.assertEqual(parsed, ['0000000000000010']) # not this

    # Can parse a 3 part C instruction like D = D+1; JMP
    def test_parse_full_c_instruction(self):
        parsed = parse_assembly(io.StringIO('D = D+1; JMP\n'))
        self.assertEqual(parsed, ['0000000000000010']) # not this

if __name__ == '__main__':
    unittest.main()
