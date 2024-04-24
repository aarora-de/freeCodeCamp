# This is a sorting algorithm that uses the divide-and-conquer principle to sort collections of data.
# That is, it 'divides' a collection into smaller sub-parts, and 'conquers' the sub-parts by sorting them independently, then merges the sorted sub-parts.
# Explanation: https://www.freecodecamp.org/news/merge-sort-algorithm-python-and-java-examples-with-time-complexity/

def merge_sort(array):
    # Stop if array passed has only 1/0 element
    if len(array) <= 1:
        return
    
    # Divide the array into two halves
    middle_point = len(array) // 2
    left_part = array[:middle_point]
    right_part = array[middle_point:]

    # Recursive call to the function for each half
    merge_sort(left_part)
    merge_sort(right_part)

    left_array_index = 0
    right_array_index = 0
    sorted_index = 0

    while left_array_index < len(left_part) and right_array_index < len(right_part):
        if left_part[left_array_index] < right_part[right_array_index]:
            array[sorted_index] = left_part[left_array_index]
            left_array_index += 1
        else:
            array[sorted_index] = right_part[right_array_index]
            right_array_index += 1
        sorted_index += 1

    while left_array_index < len(left_part):
        array[sorted_index] = left_part[left_array_index]
        left_array_index += 1
        sorted_index += 1
    
    while right_array_index < len(right_part):
        array[sorted_index] = right_part[right_array_index]
        right_array_index += 1
        sorted_index += 1

# You can use the __name__ variable to determine if a Python script is being run as the main program or if it is being imported as a module (code written in another Python file).
# If the value of __name__ is set to '__main__', it implies that the current script is the main program, and not a module.

if __name__ == '__main__':
    numbers = [4, 10, 6, 14, 2, 1, 8, 5]
    print('Unsorted array: ')
    print(numbers)
    merge_sort(numbers)
    print('Sorted array: ' + str(numbers))

