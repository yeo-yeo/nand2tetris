from command_parser import command_type

class Codewriter:
    def __init__(self, output_filename):
        self.output = open(f'{output_filename}.asm','w')
        self.filename = output_filename.split('/')[-1]
        # these two fields are used to make sure there are distinct labels
        # so that branching happens correctly
        self.label_count = 0
        self.return_label_count = 0
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

    def get_return_label_count(self):
        self.return_label_count += 1
        return self.return_label_count

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

    def write_label(self, command, name):
        self.write_line(f'// {command} {name}')
        self.write_line(f'({name})')

    def write_go_to(self, command, name):
        self.write_line(f'// {command} {name}')
        self.write_line(f'@{name}')
        self.write_line(f'0;JMP')

    def write_if(self, command, name):
        self.write_line(f'// {command} {name}')
        # go to stack and pop last value
        self.write_line('@SP')
        self.write_line('M=M-1')
        self.write_line('A=M')
        self.write_line('D=M')
        # Go to the specified label if popped value > 0
        self.write_line(f'@{name}')
        self.write_line('D;JGT')

    def write_function(self, command, name, nVars):
        # nVars is the number of local variables this fn will define in its scope
        self.write_line(f'// {command} {name} {nVars}')
        self.write_line(f'({name})')
        # push 0s on the stack for however many local vars the fn has 
        # (when the fn begins LCL is the same as SP thanks to call setup)
        # I thought this SHOULDN'T increment the SP because the fn code would
        # push to these which itself increments SP but I think it should
        for _ in range(int(nVars)):
            self.write_line('@SP')
            self.write_line('A=M')
            self.write_line('M=0')
            self.write_line('@SP')
            self.write_line('M=M+1')
    
    def write_return(self, command):
        self.write_line(f'// {command}')
        # save LCL base address to temporary variable.  the return address and saved
        # state of the callee are in the 5 addresses prior to this so we use it to find
        # those later
        self.write_line('@LCL')
        self.write_line('D=M')
        self.write_line('@R13')
        self.write_line('M=D')
        # save LCL base address (R13) minus 5 to another temporary variable. this is the
        # return address where we need to go back to once our cleanup is done
        # TODO: BUG HERE????? it's not getting the right no somewhere around 444
        self.write_line('@5')
        self.write_line('D=A')
        self.write_line('@R13')
        self.write_line('D=M-D')
        self.write_line('A=D')
        self.write_line('D=M')
        self.write_line('@R14')
        self.write_line('M=D')
        # write the return value (the current top of the stack) to where the calling fn
        # will expect to find it - i.e. in what it considers the top of the stack to be
        # (once the callee fn stuff is cleared up), which will be the place it wrote arg[0]
        # too and therefore is the address stored in ARG
        self.write_line('@SP')
        self.write_line('A=M-1')
        self.write_line('D=M')
        self.write_line('@ARG')
        self.write_line('A=M')
        self.write_line('M=D')
        # reset SP to be ARG + 1, i.e. the next memory address after the return value
        # A is already at ARG so we can just stay there and +1 into D
        self.write_line('D=A+1')
        self.write_line('@SP')
        self.write_line('M=D')
        # Restore THAT address of caller (has been temporarily stored in callee stack, at
        # our temp var frame (R13) minus 1)
        self.write_line('@R13')
        self.write_line('A=M-1')
        self.write_line('D=M')
        self.write_line('@THAT')
        self.write_line('M=D')
        # Do same thing for THIS, which is at frame minus 2
        self.write_line('@2')
        self.write_line('D=A')
        self.write_line('@R13')
        self.write_line('D=M-D')
        self.write_line('A=D')
        self.write_line('D=M')
        self.write_line('@THIS')
        self.write_line('M=D')
        # And for ARG, which is at frame minus 3
        self.write_line('@3')
        self.write_line('D=A')
        self.write_line('@R13')
        self.write_line('D=M-D')
        self.write_line('A=D')
        self.write_line('D=M')
        self.write_line('@ARG')
        self.write_line('M=D')
        # And for LCL, which is at frame minus 4
        self.write_line('@4')
        self.write_line('D=A')
        self.write_line('@R13')
        self.write_line('D=M-D')
        self.write_line('A=D')
        self.write_line('D=M')
        self.write_line('@LCL')
        self.write_line('M=D')
        # Finally, jump to the return address we stored in R14
        self.write_line('@R14')
        self.write_line('A=M')
        self.write_line('0;JMP')

    def write_call(self, command, name, nArgs):
        # nArgs is the number of args this fn takes, which have 
        # already been pushed to the stack for it to use
        self.write_line(f'// {command} {name} {nArgs}')
        # ????? do we need to advance SP by number of local variables
        # before saving??
        # generate a label for the return address, get the A value 
        # and push it to the stack
        return_address_label_name = f'return-{self.get_return_label_count()}'
        self.write_line(f'@{return_address_label_name}')
        self.write_line('D=A')
        self.write_line('@SP')
        self.write_line('M=M+1')
        self.write_line('A=M-1')
        self.write_line('M=D')
        # save LCL of caller (push it to stack)
        self.write_line('@LCL')
        self.write_line('D=M')
        self.write_line('@SP')
        self.write_line('M=M+1')
        self.write_line('A=M-1')
        self.write_line('M=D')
        # save ARG of caller
        self.write_line('@ARG')
        self.write_line('D=M')
        self.write_line('@SP')
        self.write_line('M=M+1')
        self.write_line('A=M-1')
        self.write_line('M=D')
        # save THIS of caller
        self.write_line('@THIS')
        self.write_line('D=M')
        self.write_line('@SP')
        self.write_line('M=M+1')
        self.write_line('A=M-1')
        self.write_line('M=D')
        # save THAT of caller
        self.write_line('@THAT')
        self.write_line('D=M')
        self.write_line('@SP')
        self.write_line('M=M+1')
        self.write_line('A=M-1')
        self.write_line('M=D')
        # redefine ARG for new callee: should be SP minus 5 (for the 5 things
        # we've just saved - nArgs, which the code calling this call should have
        # put in place for us)
        self.write_line('@SP')
        self.write_line('D=M')
        self.write_line(f'@{5 + int(nArgs)}')
        self.write_line('D=D-A')
        self.write_line('@ARG')
        self.write_line('M=D')
        # reposition LCL to be SP
        self.write_line('@SP')
        self.write_line('D=M')
        self.write_line('@LCL')
        self.write_line('M=D')
        # go to the beginning of the callee function's code
        self.write_line(f'@{name}')
        self.write_line('0;JMP')
        # add return address label (i.e. mark this spot as where callee should come back to)
        self.write_line(f'({return_address_label_name})')