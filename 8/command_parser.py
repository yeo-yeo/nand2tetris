# this was originally an enum but the coursera submission checker uses a version
# of python3 that predates the StrEnum
command_type = {
    'C_ARITHMETIC': 'C_ARITHMETIC',
    'C_PUSH': 'C_PUSH',
    'C_POP': 'C_POP',
    'C_LABEL': 'C_LABEL',
    'C_GOTO': 'C_GOTO',
    'C_IF': 'C_IF',
    'C_FUNCTION': 'C_FUNCTION',
    'C_RETURN': 'C_RETURN',
    'C_CALL': 'C_CALL'
}

arithmetic_commands = ('add', 'sub', 'neg', 'eq', 'gt', 'lt', 'and', 'or', 'not')

class Parser:
    def __init__(self, file_name):
        self.input = open(file_name,'r')
        self.current_line: str | None = None

    def has_more_lines(self):
        start_position = self.input.tell()
        is_another = bool(self.input.readline())
        self.input.seek(start_position)
        return is_another
    
    def advance(self):
        self.current_line = self.input.readline().strip()
        while self.current_line.strip().startswith('//') or len(self.current_line.strip()) == 0:
            self.advance()

    def command_type(self):
        if self.current_line.startswith(arithmetic_commands):
            return command_type['C_ARITHMETIC']
        elif self.current_line.startswith('push'):
            return command_type['C_PUSH']
        elif self.current_line.startswith('pop'):
            return command_type['C_POP']
        elif self.current_line.startswith('label'):
            return command_type['C_LABEL']
        elif self.current_line.startswith('goto'):
            return command_type['C_GOTO']
        elif self.current_line.startswith('if-goto'):
            return command_type['C_IF']
        elif self.current_line.startswith('function'):
            return command_type['C_FUNCTION']
        elif self.current_line.startswith('return'):
            return command_type['C_RETURN']
        elif self.current_line.startswith('call'):
            return command_type['C_CALL']
        raise Exception('Unknown command', self.current_line)
    
    def arg1(self) -> str:
        current_command_type = self.command_type()
        parts = self.current_line.split(' ')
        if current_command_type == command_type['C_ARITHMETIC'] or current_command_type == command_type['C_RETURN']:
            return parts[0]
        else:
            return parts[1]
    
    def arg2(self) -> str:
        parts = self.current_line.split(' ')
        if len(parts) > 2:
            return parts[2]
        return None