# In Python, a class is a blueprint for creating objects.
# Objects created from a class are instances of that class.
# Classes can have methods, which are like local functions for each instance. 

# Define class for the Sudoku board
class Board:
    # The __init__ method is a special method that allows you to instantiate an object to a customized state. When a class implements an __init__ method, __init__ is automatically called upon instantiation.
        # self: This is a reference to the instance of the class. It is a convention to name this parameter self.
        # board: The board parameter is expected to be passed when creating an instance of the Board class. This will be a 2D list containing 9x9 Board
    def __init__(self, board):
        self.board = board

    # The __str__ method is automatically called when you use the str() function on an instance of the class or when you use print() with the object.
    # This method will be used when we print the board. It will make it visually look like a Sudoku puzzle.
    def __str__(self):
        upper_lines = f'\n╔═══{"╤═══"*2}{"╦═══"}{"╤═══"*2}{"╦═══"}{"╤═══"*2}╗\n'
        middle_lines = f'╟───{"┼───"*2}{"╫───"}{"┼───"*2}{"╫───"}{"┼───"*2}╢\n'
        lower_lines = f'╚═══{"╧═══"*2}{"╩═══"}{"╧═══"*2}{"╩═══"}{"╧═══"*2}╝\n'

        # Initialize the board, which will be printed
        board_string = upper_lines
        # The enumerate() function is a built-in function in Python that takes an iterable (such as a list, tuple, or string) and returns an iterator that produces tuples containing indices and corresponding values from the iterable.
        # Loop through each line(list) of the 2D board as an input
        for index, line in enumerate(self.board):
            row_list = []
            # Divide each line into three equal parts of 3 numbers each
            for square_no, part in enumerate([line[:3], line[3:6], line[6:]], start=1):
                row_square = '|'.join(str(item) for item in part)
                row_list.extend(row_square)
                if square_no != 3:
                    row_list.append('║')

            row = f'║ {" ".join(row_list)} ║\n'
            row_empty = row.replace('0', ' ')
            board_string += row_empty

            # To add closing lines after each row
            # Last line will be handled differently
            if index < 8:
                # To differentiate between row for ending 3x3 squares, and the rest
                if index % 3 == 2:
                    board_string += f'╠═══{"╪═══"*2}{"╬═══"}{"╪═══"*2}{"╬═══"}{"╪═══"*2}╣\n'
                else:
                    board_string += middle_lines
            else:
                board_string += lower_lines

        return board_string

    def find_empty_cell(self):
        for row, contents in enumerate(self.board):
            try:
                col = contents.index(0)
                return row, col
            except ValueError:
                pass
        return None

    def valid_in_row(self, row, num):
        return num not in self.board[row]

    def valid_in_col(self, col, num):
        return all(
            self.board[row][col] != num
            for row in range(9)
        )

    def valid_in_square(self, row, col, num):
        row_start = (row // 3) * 3
        col_start=(col // 3) * 3
        for row_no in range(row_start, row_start + 3):
            for col_no in range(col_start, col_start + 3):
                if self.board[row_no][col_no] == num:
                    return False
        return True

    def is_valid(self, empty, num):
        row, col = empty
        valid_in_row = self.valid_in_row(row, num)
        valid_in_col = self.valid_in_col(col, num)
        valid_in_square = self.valid_in_square(row, col, num)
        return all([valid_in_row, valid_in_col, valid_in_square])

    def solver(self):
        # Walrus operator (:=) to assign the result of self.find_empty_cell() to the variable next_empty.
        # By using the walrus operator, you can combine the assignment and the conditional check into a single line, making the code more concise and readable.
        if (next_empty := self.find_empty_cell()) is None:
            return True
        else:
            for guess in range(1, 10):
                if self.is_valid(next_empty, guess):
                    row, col = next_empty
                    self.board[row][col] = guess
                    if self.solver():
                        return True
                    self.board[row][col] = 0

        return False

# Define function to solve the Sudoku. It takes a 2D Board (List) 9x9 as an input
def solve_sudoku(board):
    # Create a gameboard using the board class.
    gameboard = Board(board)
    print(f'\nPuzzle to solve:\n{gameboard}')
    if gameboard.solver():
        print('\nSolved puzzle:')
        print(gameboard)

    else:
        print('\nThe provided puzzle is unsolvable.')
    return gameboard


puzzle = [
  [0, 0, 2, 0, 0, 8, 0, 0, 0],
  [0, 0, 0, 0, 0, 3, 7, 6, 2],
  [4, 3, 0, 0, 0, 0, 8, 0, 0],
  [0, 5, 0, 0, 3, 0, 0, 9, 0],
  [0, 4, 0, 0, 0, 0, 0, 2, 6],
  [0, 0, 0, 4, 6, 7, 0, 0, 0],
  [0, 8, 6, 7, 0, 4, 0, 0, 0],
  [0, 0, 0, 5, 1, 9, 0, 0, 8],
  [1, 7, 0, 0, 0, 6, 0, 0, 5]
]
solve_sudoku(puzzle)