NUMBER_OF_DISKS = 4
number_of_moves = 2**NUMBER_OF_DISKS - 1
rods = {
    'A': list(range(NUMBER_OF_DISKS, 0, -1)),
    'B': [],
    'C': []
}

# Algorithm explanation: https://www.freecodecamp.org/news/analyzing-the-algorithm-to-solve-the-tower-of-hanoi-problem-686685f032e3/
# A to C is allowed on 1st, 4th, 7th, etc.
# A to B is allowed on 2nd, 5th, 8th, etc.
# A to C is allowed on 3rd, 6th, 9th, etc.
# Above is for odd number of disks. Will change a bit if disks are even

def make_allowed_move(rod1, rod2):
    # variable to capture the direction of the move.
    forward = False
    # When rod2 is empty, then it will necessarily be forward move
    if not rods[rod2]:
        forward = True
    # When rod1 is not empty, and last disk of rod1 is smaller than last disk of rod2, then it will necessarily be a forward move
    elif rods[rod1] and rods[rod1][-1]<rods[rod2][-1]:
        forward = True
    # Do forward move
    if forward:
        print(f'Moving disk {rods[rod1][-1]} from {rod1} to {rod2}')
        rods[rod2].append(rods[rod1].pop())
    # Do reverse move
    else:
        print(f'Moving disk {rods[rod2][-1]} from {rod1} to {rod2}')
        rods[rod1].append(rods[rod2].pop())
    
    # Display our progress
    print(rods, '\n')


def move(n, source, auxiliary, target):
    # display starting configuration
    print(rods, '\n')
    for i in range(number_of_moves):
        remainder = (i + 1) % 3
        if remainder == 1:
            if n % 2 != 0:
                print(f'Move {i + 1} allowed between {source} and {target}')
                make_allowed_move(source, target)
            else:
                print(f'Move {i + 1} allowed between {source} and {auxiliary}')
                make_allowed_move(source, auxiliary)

        elif remainder == 2:
            if n % 2 != 0:
                print(f'Move {i + 1} allowed between {source} and {auxiliary}')
                make_allowed_move(source, auxiliary)
            else:
                print(f'Move {i + 1} allowed between {source} and {target}')
                make_allowed_move(source, target)

        elif remainder == 0:
            print(f'Move {i + 1} allowed between {auxiliary} and {target}')
            make_allowed_move(auxiliary, target)

# initiate call from source A to target C with auxiliary B
move(NUMBER_OF_DISKS, 'A', 'B', 'C')

