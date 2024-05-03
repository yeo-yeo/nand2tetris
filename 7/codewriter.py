from command_parser import command_type

class Codewriter:
    def __init__(self, output_filename):
        self.output = open(f'{output_filename}.asm','w')
        self.filename = output_filename.split('/')[-1]
        self.label_count = 0
        self.segment_codes = {
            'local': 'LCL',
            'argument': 'ARG',
            'this': 'THIS',
            'that': 'THAT',
            'temp': 'TEMP'
        }

    def get_label_count(self):
        self.label_count += 1
        return self.label_count

    def write_line(self, text):
        self.output.write(f'{text}\n')

    def close(self):
        print('Closing file')
        self.output.close()
    
    def write_arithmetic(self, command):
        self.write_line(f'// {command}')
        if command == 'add':
            # Get the most recent value from stack into data register
            self.write_line(f'@SP')
            self.write_line(f'A=M')
            self.write_line(f'A=A-1')
            self.write_line(f'D=M') 
            # Decrement SP
            self.write_line(f'@SP') 
            self.write_line(f'M=M-1')
            # Add D value to current top of stack
            self.write_line(f'@SP')
            self.write_line(f'A=M')
            self.write_line(f'A=A-1')
            self.write_line(f'M=M+D')
        elif command == 'sub':
            # Get the most recent value from stack into data register
            self.write_line(f'@SP')
            self.write_line(f'A=M')
            self.write_line(f'A=A-1')
            self.write_line(f'D=M')
            # Decrement SP
            self.write_line(f'@SP') 
            self.write_line(f'M=M-1')
            # Remove D value from current top of stack
            self.write_line(f'@SP')
            self.write_line(f'A=M-1')
            self.write_line(f'M=M-D')
        elif command == 'neg':
            # go to top of stack
            self.write_line(f'@SP')
            self.write_line(f'A=M-1')
            # negate it
            self.write_line(f'M=-M')
        elif command == 'not':
            # go to top of stack
            self.write_line(f'@SP')
            self.write_line(f'A=M-1')
            # NOT
            self.write_line(f'M=!M')
        elif command == 'and':
            # go to top of stack, decrement SP and copy top value into D
            self.write_line(f'@SP')
            self.write_line(f'M=M-1')
            self.write_line(f'A=M')
            self.write_line(f'D=M') 
            # go to previous value in stack
            self.write_line(f'@SP')
            self.write_line(f'A=M-1') 
            # AND op on top value in stack plus popped value in D
            self.write_line(f'M=D&M')
        elif command == 'or':
            # go to top of stack, decrement SP and copy top value into D
            self.write_line(f'@SP')
            self.write_line(f'M=M-1')
            self.write_line(f'A=M')
            self.write_line(f'D=M') 
            # go to previous value in stack
            self.write_line(f'@SP')
            self.write_line(f'A=M-1') 
            # OR op on top value in stack plus popped value in D
            self.write_line(f'M=D|M')
        elif command == 'eq':
            # go to top of stack, decrement SP and copy top value into D
            self.write_line(f'@SP')
            self.write_line(f'M=M-1')
            self.write_line(f'A=M')
            self.write_line(f'D=M') 
            # go to previous value in stack
            self.write_line(f'@SP')
            self.write_line(f'A=M-1')
            # store x - y in D: if it's 0, that means they're equal
            self.write_line(f'D=M-D')
            set_true_label_count = self.get_label_count()
            self.write_line(f'@SET_TRUE-{set_true_label_count}')
            self.write_line(f'D;JEQ')
            # if we're here, we're setting FALSE because x - y wasn't 0
            self.write_line(f'@SP')
            self.write_line(f'A=M-1')
            self.write_line(f'M=0')
            # make sure it now skips the set_true path
            continue_label_count = self.get_label_count()
            self.write_line(f'@CONTINUE-{continue_label_count}')
            self.write_line(f'0;JMP')
            # alternative: set true: in two's complement a binary 111111 etc is -1 in decimal
            self.write_line(f'(SET_TRUE-{set_true_label_count})')
            self.write_line(f'@SP')
            self.write_line(f'A=M-1')
            self.write_line(f'M=-1')
            self.write_line(f'(CONTINUE-{continue_label_count})')
        elif command == 'gt':
            # go to top of stack, decrement SP and copy top value into D
            self.write_line(f'@SP')
            self.write_line(f'M=M-1')
            self.write_line(f'A=M')
            self.write_line(f'D=M') 
            # go to previous value in stack
            self.write_line(f'@SP')
            self.write_line(f'A=M-1')
            # store x - y in D: if result is > 0, x is greater than y (TRUE output)
            self.write_line(f'D=M-D')
            set_true_label_count = self.get_label_count()
            self.write_line(f'@SET_TRUE-{set_true_label_count}')
            self.write_line(f'D;JGT')
            # if we're here, we're setting FALSE because x - y wasn't > 0
            self.write_line(f'@SP')
            self.write_line(f'A=M-1')
            self.write_line(f'M=0')
            # make sure it now skips the set_true path
            continue_label_count = self.get_label_count()
            self.write_line(f'@CONTINUE-{continue_label_count}')
            self.write_line(f'0;JMP')
            # alternative: set true: in two's complement a binary 111111 etc is -1 in decimal
            self.write_line(f'(SET_TRUE-{set_true_label_count})')
            self.write_line(f'@SP')
            self.write_line(f'A=M-1')
            self.write_line(f'M=-1')
            self.write_line(f'(CONTINUE-{continue_label_count})')
        elif command == 'lt':
            # go to top of stack, decrement SP and copy top value into D
            self.write_line(f'@SP')
            self.write_line(f'M=M-1')
            self.write_line(f'A=M')
            self.write_line(f'D=M') 
            # go to previous value in stack
            self.write_line(f'@SP')
            self.write_line(f'A=M-1')
            # store x - y in D: if result is < 0, x is greater than y (TRUE output)
            self.write_line(f'D=M-D')
            set_true_label_count = self.get_label_count()
            self.write_line(f'@SET_TRUE-{set_true_label_count}')
            self.write_line(f'D;JLT')
            # if we're here, we're setting FALSE because x - y wasn't < 0
            self.write_line(f'@SP')
            self.write_line(f'A=M-1')
            self.write_line(f'M=0')
            # make sure it now skips the set_true path
            continue_label_count = self.get_label_count()
            self.write_line(f'@CONTINUE-{continue_label_count}')
            self.write_line(f'0;JMP')
            # alternative: set true. in two's complement a binary 111111 etc is -1 in decimal
            self.write_line(f'(SET_TRUE-{set_true_label_count})')
            self.write_line(f'@SP')
            self.write_line(f'A=M-1')
            self.write_line(f'M=-1')
            self.write_line(f'(CONTINUE-{continue_label_count})')

    def write_push_pop(self, command, segment, index):
        self.write_line(f'// {command} {segment} {index}')

        # e.g. push local 2 (push that value onto the stack)
        if command == command_type['C_PUSH']:
            # go to the specified memory address and copy to data register
            if segment == 'constant':
                self.write_line(f'@{index}')
                self.write_line(f'D=A')
            elif segment == 'temp':
                self.write_line(f'@{5 + int(index)}')
                self.write_line(f'D=M')
            # pointer 0 copies the @THIS base address, and 1 the @THAT
            elif segment == 'pointer':
                if index == '0':
                    self.write_line(f'@THIS')
                else:
                    self.write_line(f'@THAT')
                self.write_line(f'D=M')
            elif segment == 'static':
                self.write_line(f'@{self.filename}.{index}')
                self.write_line(f'D=M')
            else:
                # store the memory offset in D so you can then add it to relevant base address
                self.write_line(f'@{self.segment_codes[segment]}')
                self.write_line(f'D=M')
                self.write_line(f'@{index}')
                self.write_line(f'A=A+D')
                # copy the memory location to D
                self.write_line(f'D=M')

            # go to current stack position and write it there
            self.write_line(f'@SP')
            self.write_line(f'A=M')
            self.write_line(f'M=D')
            # increment the stack pointer value
            self.write_line(f'@SP')
            self.write_line(f'M=M+1')
        elif command == command_type['C_POP']:
            if segment == 'temp':
                # decrement the stack pointer and copy the value from stack to data register
                self.write_line(f'@SP')
                self.write_line(f'M=M-1')
                self.write_line(f'A=M')
                self.write_line(f'D=M')
                self.write_line(f'@{5 + int(index)}')
                self.write_line(f'M=D')
            # pointer 0 sets the @THIS base address, and 1 the @THAT
            elif segment == 'pointer':
                # decrement stack pointer and get the value to be copied off it 
                self.write_line(f'@SP')
                self.write_line(f'M=M-1')
                self.write_line(f'A=M')
                self.write_line(f'D=M')
                # copy it to be the new base address of THIS or THAT
                if index == '0':
                    self.write_line(f'@THIS')
                else:
                    self.write_line(f'@THAT')
                self.write_line(f'M=D')
            elif segment == 'static':
                # decrement stack pointer and get the value to be copied off it 
                self.write_line(f'@SP')
                self.write_line(f'M=M-1')
                self.write_line(f'A=M')
                self.write_line(f'D=M')
                # static syntax magic
                self.write_line(f'@{self.filename}.{index}')
                self.write_line(f'M=D') 
            else: 
                # calc the output address
                self.write_line(f'@{self.segment_codes[segment]}')
                self.write_line(f'D=M')
                self.write_line(f'@{index}')
                self.write_line(f'D=A+D')
                # and then put it in R13 temporarily
                self.write_line(f'@R13')
                self.write_line(f'M=D')
                # decrement the stack pointer and copy the value from stack to data register
                self.write_line(f'@SP')
                self.write_line(f'M=M-1')
                self.write_line(f'A=M')
                self.write_line(f'D=M')
                self.write_line(f'@R13')
                self.write_line(f'A=M') 
                self.write_line(f'M=D') 
