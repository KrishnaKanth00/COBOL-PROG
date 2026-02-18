       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID. MINBALPE.                                            00020000
       ENVIRONMENT DIVISION.                                            00030000
       INPUT-OUTPUT SECTION.                                            00040000
       FILE-CONTROL.                                                    00050000
           SELECT DATA-IN ASSIGN TO INFILE                              00060000
           ORGANIZATION IS INDEXED                                      00070000
           ACCESS MODE IS SEQUENTIAL                                    00080000
           RECORD KEY IS ACCOUNT-NUMBER                                 00081000
           FILE STATUS IS FS-IN.                                        00090000
       DATA DIVISION.                                                   00100000
       FILE SECTION.                                                    00110000
       FD DATA-IN.                                                      00120000
       01 INREC.                                                        00121000
         05 ACCOUNT-NUMBER            PIC 9(10).                        00130000
         05 CUST-NAME                 PIC A(30).                        00140000
         05 ACC-TYPE                  PIC X(1).                         00150000
         05 BALANCE                   PIC 9(7)V99.                      00160000
         05 ACC-STATUS                PIC X.                            00170000
       WORKING-STORAGE SECTION.                                         00180000
       01 FS-IN                       PIC X(2) VALUE '00'.              00190000
       01 WS-EOF                      PIC X    VALUE 'N'.               00191000
       01 WS-MINBAL-CUR               PIC 9(4) VALUE 5000.              00192000
       01 WS-MINBAL-SAV               PIC 9(4) VALUE 1000.              00193000
       01 WS-PENALTY                  PIC 9(3).                         00194000
       01 WS-APPPENALTY               PIC 9(2) VALUE 00.                00194100
       01 WS-CHECKED                  PIC 9(2) VALUE 00.                00195000
       PROCEDURE DIVISION.                                              00200000
           OPEN I-O DATA-IN.                                            00201001
           PERFORM UNTIL WS-EOF = 'Y'                                   00210000
             READ DATA-IN                                               00211000
               AT END                                                   00212000
                 MOVE 'Y' TO WS-EOF                                     00213000
               NOT AT END                                               00214000
                 ADD 1 TO WS-CHECKED                                    00214100
                 IF ACC-STATUS = 'A'                                    00214200
                  IF ACC-TYPE = 'C'                                     00214300
                    IF BALANCE >= WS-MINBAL-CUR                         00214400
                       CONTINUE                                         00214500
                    ELSE                                                00214600
                       ADD 250 TO WS-PENALTY                            00214700
                       IF BALANCE < 250                                 00214801
                        MOVE 'I' TO ACC-STATUS                          00214901
                       END-IF                                           00215001
                       SUBTRACT 250 FROM BALANCE                        00215100
                       ADD 1 TO WS-APPPENALTY                           00215300
                       REWRITE INREC                                    00215401
                    END-IF                                              00215500
                  ELSE                                                  00215600
                    IF BALANCE >= WS-MINBAL-SAV                         00215700
                       CONTINUE                                         00215800
                    ELSE                                                00215900
                       ADD 250 TO WS-PENALTY                            00216000
                       IF BALANCE < 250                                 00216101
                        MOVE 'I' TO ACC-STATUS                          00216201
                       END-IF                                           00216301
                       SUBTRACT 250 FROM BALANCE                        00216400
                       ADD 1 TO WS-APPPENALTY                           00216600
                       REWRITE INREC                                    00216701
                    END-IF                                              00216800
                  END-IF                                                00216900
                 ELSE                                                   00217000
                   DISPLAY 'ACCOUNT NOT ACTIVE'                         00217100
                 END-IF                                                 00217200
             END-READ                                                   00217300
           END-PERFORM.                                                 00217400
           DISPLAY '------------MINIMUM BALANCE SUMMARY-------------'.  00217500
           DISPLAY 'ACCOUNTS CHECKED: ' WS-CHECKED.                     00218000
           DISPLAY 'PENALTIES APPLIED: ' WS-APPPENALTY.                 00219000
           DISPLAY 'TOTAL PENALTY: ' WS-PENALTY.                        00219100
           DISPLAY 'BATCH COMPLETED SUCCESSFULLY'.                      00219200
           DISPLAY '------------------------------------------------'.  00219300
           CLOSE DATA-IN.                                               00220000
           STOP RUN.                                                    00230000
