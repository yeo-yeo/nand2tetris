"""
Allows iteration through the lines of the input file
Parses a line at a time into its constituent parts
"""

from enum import StrEnum

class instruction_type(StrEnum):
    A = 'A_Instruction'
    C = 'C_Instruction'
    L = 'L_Instruction'

class Parser:
    def __init__(self, input_file):
        self.input_file = input_file
        self.current_line: str | None = None

    def reset(self):
        self.input_file.seek(0)
        self.current_line = None

    def has_more_lines(self):
        start_position = self.input_file.tell()
        is_another = bool(self.input_file.readline())
        self.input_file.seek(start_position)
        return is_another

    def advance(self):
        self.current_line = self.input_file.readline()
        while self.current_line.strip().startswith('//') or len(self.current_line.strip()) == 0:
            self.advance()

    def instruction_type(self) -> instruction_type:
        if self.current_line.strip().startswith('@'):
            return instruction_type.A
        elif self.current_line.strip().startswith('('):
            return instruction_type.L
        else:
            return instruction_type.C
        
    def symbol(self):
        if self.instruction_type() is instruction_type.C:
            return
        else:
            instruction = self.current_line.strip().split('//')
            return instruction[0][1:].removesuffix(')')
        
    def dest(self):
        if self.instruction_type() is not instruction_type.C:
            return 
        
        dest = None
        if '=' in self.current_line:
            dest, _rest = self.current_line.strip().split('=')
            dest = dest.strip()

        return dest
        
    def comp(self):
        if self.instruction_type() is not instruction_type.C:
            return
        
        comp = None
        if '=' in self.current_line and ';' in self.current_line:
            _dest, rest = self.current_line.strip().split('=')
            comp, _jump = rest.split(';')
        elif '=' in self.current_line:
            _dest, comp = self.current_line.strip().split('=')
        elif ';' in self.current_line:
            comp, _jump = self.current_line.strip().split(';')
        else:
            comp = self.current_line
        comp_split_for_comment = comp.strip().split('//')
        return comp_split_for_comment[0].strip()
    
    def jump(self):
        if self.instruction_type() is not instruction_type.C:
            return
        
        jump = None
        
        if ';' in self.current_line:
            _rest, jump = self.current_line.strip().split(';')
            jump_split_for_comment = jump.split('//')
            jump = jump_split_for_comment[0].strip()

        return jump
