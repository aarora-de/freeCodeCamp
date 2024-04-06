#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database
# cat courses.csv ## To print contents into terminal

# Connect to DB
# -c flag is for running a single command and exiting
# The rest of the flags are for formatting
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

# query your database using the PSQL variable: $($PSQL "<query_here>"). 
# The code in the parenthesis will run in a subshell, which is a separate bash process.
# Truncate existing data.
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses;")

# Loop to read contents into variables
# cat courses_test.csv | while IFS=',' read MAJOR COURSE
cat courses.csv | while IFS=',' read MAJOR COURSE
do 
  #  echo $MAJOR $COURSE
  if [[ $MAJOR != major ]] ## Ignore first line (header)
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    #if not found
    if [[ -z $MAJOR_ID ]]
    then
      #insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      # echo $INSERT_MAJOR_RESULT
      if [[ $INSERT_MAJOR_RESULT == 'INSERT 0 1' ]]
      then
        echo Inserted into majors, $MAJOR
      fi
      #get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    #get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    #if not found
    if [[ -z $COURSE_ID ]]
    then
      #insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == 'INSERT 0 1' ]]
      then
        echo Inserted into courses, $COURSE
      fi
      #get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    #insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == 'INSERT 0 1' ]]
    then
      echo Inserted into majors_courses, $MAJOR : $COURSE
    fi
  fi
done

# Loop to read contents into variables
# cat students_test.csv | while IFS=',' read FIRST LAST MAJOR GPA
cat students.csv | while IFS=',' read FIRST LAST MAJOR GPA
do 
  # echo $FIRST
  if [[ $FIRST != first_name ]] ## Ignore first line (header)
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # set to null
      MAJOR_ID=null
    fi
    
    # insert student
    INSERT_STUDENT_RESULT=$($PSQL "INSERT INTO students(first_name, last_name, major_id, gpa) VALUES('$FIRST', '$LAST', $MAJOR_ID, $GPA)")
    if [[ $INSERT_STUDENT_RESULT == 'INSERT 0 1' ]]
    then
      echo Inserted into students, $FIRST $LAST
    fi

  fi
done