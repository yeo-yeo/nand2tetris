#!/usr/bin/env python3
import os
import sys
from command_parser import Parser, command_type
from codewriter import Codewriter

def main():
    if len(sys.argv) < 2:
        print('Please provide a .vm input file or directory')
        sys.exit(1)

    # the whole path passed in
    input_name = sys.argv[1]

    files = []
    output_name = None

    if os.path.isfile(input_name):
        files.append(input_name)
        output_name = input_name.split('.vm')[0]
    else:
        filename = input_name.split('/')[-1]
        output_name = f'{input_name}/{filename}'
        dir_files = os.listdir(input_name)
        for file in dir_files:
            if file[-3:] == '.vm':
                files.append(f'{input_name}/{file}')

    codewriter = Codewriter(output_name)
    
    if not os.path.isfile(input_name) and len(files) > 1:
        codewriter.write_init()
    
    for file in files:
        codewriter.set_file_name(file.split('/')[-1].split('.vm')[0])
        parser = Parser(file)
    
        while parser.has_more_lines():
            parser.advance()
            current_command_type = parser.command_type()
            if current_command_type == command_type['C_ARITHMETIC']:
                codewriter.write_arithmetic(parser.arg1())
            elif current_command_type == command_type['C_PUSH'] or current_command_type == command_type['C_POP']:
                codewriter.write_push_pop(current_command_type, parser.arg1(), parser.arg2())
            elif current_command_type == command_type['C_LABEL']:
                codewriter.write_label(current_command_type, parser.arg1())
            elif current_command_type == command_type['C_GOTO']:
                codewriter.write_go_to(current_command_type, parser.arg1())
            elif current_command_type == command_type['C_IF']:
                codewriter.write_if(current_command_type, parser.arg1())
            elif current_command_type == command_type['C_FUNCTION']:
                codewriter.write_function(current_command_type, parser.arg1(), parser.arg2())
            elif current_command_type == command_type['C_RETURN']:
                codewriter.write_return(current_command_type)
            elif current_command_type == command_type['C_CALL']:
                codewriter.write_call(current_command_type, parser.arg1(), parser.arg2())
            else:
                raise Exception('Unknown command', current_command_type)

    codewriter.close()

if __name__ == "__main__":
    main()