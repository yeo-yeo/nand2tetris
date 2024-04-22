#!/usr/bin/env python3

import sys
from parser import Parser, instruction_type
from coder import Coder
from consts import a_instruction_bit, c_instruction_bit
from symbol_table import Symbol_Table

"""
Reads the input .asm file, runs code, outputs .hack file!
"""

def main():
    input_file = None
    if len(sys.argv) < 2 or not sys.argv[1].endswith('.asm'):
        print('Please provide a .asm input file')
        sys.exit(1)
    with open(sys.argv[1],'r') as input_file:
        parser = Parser(input_file)
        coder = Coder()
        symbol_table = Symbol_Table()
        line_no = 0
        next_var_address = 16

        # Take a first pass through the file and populate the symbol table
        # with just the label variables
        while parser.has_more_lines():
            parser.advance()
            symbol = parser.symbol()
            if parser.instruction_type() == instruction_type.L:
                symbol_table.add_entry(symbol, line_no)
            if parser.instruction_type() is not instruction_type.L:
                line_no += 1

        # Set the parser back to the first line of the file
        parser.reset()

        filename = sys.argv[1].removesuffix('.asm')
        # Iterate through the lines again, discarding unusable lines, pulling out
        # the relevant pieces of each instruction, storing variables where necesssary,
        # and translating everything to binary 
        with open(f'{filename}.hack','w') as output_file:
            while parser.has_more_lines():
                parser.advance()
                i_type = parser.instruction_type()

                if i_type is instruction_type.A:
                    symbol = parser.symbol()
                    is_normal_address = all(not char.isalpha() for char in symbol)
                    if not is_normal_address and not symbol_table.contains(symbol):
                        symbol_table.add_entry(symbol, next_var_address)
                        next_var_address += 1
                    output = symbol if is_normal_address else symbol_table.get_address(symbol)
                    output_file.write(f'{a_instruction_bit}{format(int(output),'015b')}\n')     
                elif i_type is instruction_type.C:
                    comp = parser.comp()
                    dest = parser.dest()
                    jump = parser.jump()
                    comp_code = coder.comp(comp)
                    dest_code = coder.dest(dest)
                    jump_code = coder.jump(jump)
                    # C instruction bit, filler 11s, comp, dest, jump
                    output_file.write(f'{c_instruction_bit}11{comp_code}{dest_code}{jump_code}\n')

    sys.exit(0)

if __name__ == "__main__":
    main()