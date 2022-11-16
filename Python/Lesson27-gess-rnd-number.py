import random
import os
from subprocess import call
from simple_term_menu import TerminalMenu

# ============================================================================================
def get_rnd(rnd_min=1, rnd_max=200):
    return random.randint(rnd_min, rnd_max)

# ============================================================================================
def get_val():
    while True:
        val = input(
            "Gess the integer random number.\nEnter 000 to exit.\n\nEnter your int value: ")
        if val != '000':
            try:
                result = int(val)
                break
            except:
                print('Wrong value. You should enter integer number or 000')
        else:
            result = -1
            break

    return result

# = clear screen =============================================================================
def clear():
    _ = call('cls' if os.name == 'nt' else 'clear')

# ============================================================================================
menu_options = ["repat round", "exit"]

menu_entry_index = 0

while menu_entry_index == 0:
    clear()

    rnd_val = get_rnd(100, 150)

    print(rnd_val)

    ges_val = get_val()

    while ges_val != rnd_val:

        if ges_val == -1:
            print('\nYou almost guessed it. The RND number was', rnd_val)
            break        
        elif ges_val > rnd_val:
            print(f'\trnd number less then {ges_val}\n')
        elif ges_val < rnd_val:
            print(f'\trnd number greater then {ges_val}\n')

        ges_val = get_val()

    else:
        print(f'Congratulations!!! You guess the number - {rnd_val}')

    print('\n')
    terminal_menu = TerminalMenu(menu_options)
    menu_entry_index = terminal_menu.show()
