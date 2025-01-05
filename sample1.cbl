IDENTIFICATION DIVISION.
PROGRAM-ID. SampleProgram.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
   SELECT InputFile ASSIGN TO 'input.dat'
       ORGANIZATION IS LINE SEQUENTIAL.
   SELECT OutputFile ASSIGN TO 'output.dat'
       ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  InputFile.
01  InputRecord.
   05  InputField1   PIC X(10).
   05  InputField2   PIC 9(5).

FD  OutputFile.
01  OutputRecord.
   05  OutputField1  PIC X(10).
   05  OutputField2  PIC 9(5).

WORKING-STORAGE SECTION.
01  WS-EOF            PIC X VALUE 'N'.

PROCEDURE DIVISION.
Main-Logic.
   OPEN INPUT InputFile
   OPEN OUTPUT OutputFile
   PERFORM UNTIL WS-EOF = 'Y'
       READ InputFile INTO InputRecord
           AT END
               MOVE 'Y' TO WS-EOF
           NOT AT END
               MOVE InputField1 TO OutputField1
               ADD 1 TO InputField2
               MOVE InputField2 TO OutputField2
               WRITE OutputRecord
       END-READ
   END-PERFORM
   CLOSE InputFile
   CLOSE OutputFile
   STOP RUN.

Explanation
IDENTIFICATION DIVISION: This section contains the program's metadata, such as the program ID.
ENVIRONMENT DIVISION: Defines the environment in which the program runs, including file assignments.
DATA DIVISION: Contains the definitions of the files and working storage variables.
FILE SECTION: Describes the structure of the input and output files.
WORKING-STORAGE SECTION: Defines temporary variables used during program execution.
PROCEDURE DIVISION: Contains the main logic of the program, including opening files, reading records, processing data, writing records, and closing files.

This example reads records from input.dat, increments a numeric field by 1, and writes the modified records to output.dat. Feel free to adapt this template to fit your specific needs!
