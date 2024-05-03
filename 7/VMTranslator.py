#!/usr/bin/env python3

import sys
from command_parser import Parser, command_type
from codewriter import Codewriter

def main():
    if len(sys.argv) < 2:
        print('Please provide a .vm input file')
        sys.exit(1)
    
    filename = sys.argv[1]

    parser = Parser(filename)
    codewriter = Codewriter(filename.split('.vm')[0])

    while parser.has_more_lines():
        parser.advance()
        current_command_type = parser.command_type()
        if current_command_type == command_type['C_ARITHMETIC']:
            codewriter.write_arithmetic(parser.arg1())
        elif current_command_type == command_type['C_PUSH'] or current_command_type == command_type['C_POP']:
            codewriter.write_push_pop(current_command_type, parser.arg1(), parser.arg2())
        else:
            raise Exception('Command not implemented yet', current_command_type)

    codewriter.close()

if __name__ == "__main__":
    main()