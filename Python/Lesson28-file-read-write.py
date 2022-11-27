import os
import sys
from simple_term_menu import TerminalMenu

# =================================================================
def print_lines(lines):
        count = 0

        print("Existing data in file:")

        for line in lines:
                count += 1
                data = line.strip().split(',')
                print(f"{count}:\t{data[0]}\t{data[1]}\t{data[2]}\t")

        return count

# =================================================================
def read_data_from_file(file_name = "cred-list.csv", make_search=1):
        
        os.system('cls||clear')

        menu_options = ("by Hots", "by User", "return to main menu")

        terminal_menu = TerminalMenu(menu_options)

        if os.path.exists(file_name):
                print(f"Read data from file: {file_name}")
                
                file_d = open(file_name, 'r', encoding='utf-8', newline='\n')
                
                lines = file_d.readlines()

                file_d.close()

                if make_search==1:
                        
                        count=print_lines(lines)

                        print('\n\nChoice search method:')

                        menu_entry_index = terminal_menu.show()

                        while menu_entry_index != 2:

                                search_value = input(f"Enter seach value ({menu_options[menu_entry_index]}): ")
                                
                                search_data(lines, search_value, menu_entry_index) 

                                menu_entry_index = terminal_menu.show()
        else:
              print(f'File {file_name} doesn\'t exist or empty.')
              lines=''

        return lines

# =================================================================
def search_data(lines, search_value, index):
        count = 0
        count_match = 0

        for line in lines:

                count += 1

                data = line.strip().split(',')

                if data[index]==search_value:

                        count_match += 1

                        print(f"{count}:\t{data[0]}\t{data[1]}\t{data[2]}\t")

        if count_match == 0:
                print('No match values.')

# =================================================================
def write_data_to_file(file_name = "cred-list.csv"):

        os.system('cls||clear')

        old_lines = ''
        new_lines = ''

        if os.path.exists(file_name):
                old_lines = read_data_from_file(file_name, 0)
        
        print_lines(old_lines)

        menu_options = ("enter new data", "write data to file")

        terminal_menu = TerminalMenu(menu_options)
        
        menu_entry_index = 0

        while menu_entry_index == 0:

                print('\nEnter new values:')
                
                new_line = get_new_data()
                
                if check_exists_data(old_lines, new_line) and check_exists_data(new_lines, new_line):
                        if len(new_lines)>0:
                                new_lines = new_lines + '\n' + new_line
                        else: 
                                new_lines = new_line
                
                print('\n')

                print ('Choose operation:')
                
                menu_entry_index = terminal_menu.show()

        if new_lines != '':
                file_d = open(file_name, 'a', encoding='utf-8')
                file_d.writelines('\n'+new_lines)
                file_d.close
                print(f"New data:\n\n{new_lines}\n\nhas been written to file: {file_name}\n")

# =================================================================
def get_new_data():
        host_name = check_valid_char('\tenter Host name: ')

        user_name = check_valid_char('\tenter User name: ')

        pwd_str = check_valid_char('\tenter Password: ')
        
        return host_name + ',' + user_name + ',' + pwd_str

# =================================================================
def check_valid_char(str_name):
        not_valid_chars = ',\'\";\\'

        while True:
                new_value = input(str_name)
                res = set(new_value).intersection(not_valid_chars)
                if len(res) > 0:
                        print('Enter only valid chars for password. ')
                        print(f"\n\t\tDon't use this simbols in string: \n\t\t{not_valid_chars}\n")
                else:
                        break

        return new_value

# =================================================================
def check_exists_data(exists_lines, new_line):

        result = True

        new_data = new_line.strip().split(',')

        for line in exists_lines:
           
                exist_data = line.strip().split(',')

                if new_data[0]==exist_data[0] and new_data[1]==exist_data[1]:
                        print('New data olready exist. Enter unic data.')
                        result = False
                        break
                else:
                        result = True
        
        return result
# =================================================================
def main(file_name):
        os.system('cls||clear')

        menu_options = ("Read data", "write data", "exit")

        terminal_menu = TerminalMenu(menu_options)

        menu_entry_index = terminal_menu.show()

        while menu_entry_index != 2:
                match menu_entry_index:
                        case 0:
                                read_data_from_file(file_name)
                        case 1: 
                                write_data_to_file(file_name)

                menu_entry_index = terminal_menu.show()
# =================================================================

main(os.path.join(os.path.dirname(sys.argv[0]),"cred-list.csv"))