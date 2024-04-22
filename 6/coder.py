"""
Maps from C instruction pieces to their binary equivalents
"""

class Coder:
    def __init__(self):
        self.dest_mappings = {
            'M': '001',
            'D': '010',
            'DM': '011',
            'MD': '011', # tests failed without accounting for this
            'A': '100',
            'AM': '101',
            'MA': '101',
            'AD': '110',
            'DA': '110',
            'ADM': '111',
            'AMD': '111',
            'DMA': '111',
            'DAM': '111',
            'MAD': '111',
            'MDA': '111'
        }
        self.comp_mappings_one = {
            '0': '101010',
            '1': '111111',
            '-1': '111010',
            'D': '001100',
            'A': '110000',
            '!D': '001101',
            '!A': '110001',
            '-D': '001111',
            '-A': '110011',
            'D+1': '011111',
            'A+1': '110111',
            'D-1': '001110',
            'A-1': '110010',
            'D+A': '000010',
            'D-A': '010011',
            'A-D': '000111',
            'D&A': '000000',
            'D|A': '010101'
        }
        self.comp_mappings_two = {
            'M': '110000',
            '!M': '110001',
            '-M': '110011',
            'M+1': '110111',
            'M-1': '110010',
            'D+M': '000010',
            'D-M': '010011',
            'M-D': '000111',
            'D&M': '000000',
            'D|M': '010101'
        }
        self.jump_mappings = {
            'JGT': '001',
            'JEQ': '010',
            'JGE': '011',
            'JLT': '100',
            'JNE': '101',
            'JLE': '110',
            'JMP': '111'
        }

    def dest(self, d):
        if d in self.dest_mappings:
            return self.dest_mappings[d]
        return '000'
        
    def comp(self, c):
        if c in self.comp_mappings_one:
            return f'0{self.comp_mappings_one[c]}'
        return f'1{self.comp_mappings_two[c]}'
    
    def jump(self, j):
        if j in self.jump_mappings:
            return self.jump_mappings[j]
        return '000'

