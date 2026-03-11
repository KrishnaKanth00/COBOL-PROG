       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID. HACK2.                                               00020000
       DATA DIVISION.                                                   00030000
       WORKING-STORAGE SECTION.                                         00040000
           EXEC SQL INCLUDE SQLCA END-EXEC.                             00050000
           EXEC SQL INCLUDE HACK2 END-EXEC.                             00060000
       01 WS-ACC-NO        PIC X(10).                                   00070001
       01 WS-ACC-BAL       PIC 9(7).99.                                 00080001
       PROCEDURE DIVISION.                                              00100000
           ACCEPT WS-ACC-NO.                                            00110000
           DISPLAY '*************ACCOUNT-DETAILS****************'       00111001
           EXEC SQL                                                     00120000
           SELECT ACC_NAME,ACC_BAL,ACC_NO,ACC_STATUS                    00121001
           INTO :DCL-ACC-NAME,:DCL-ACC-BAL,:DCL-ACC-NO,:DCL-ACC-STATUS  00122001
           FROM ACC_DETAILS                                             00123000
           WHERE ACC_NO=:WS-ACC-NO                                      00124000
           END-EXEC.                                                    00130000
           MOVE DCL-ACC-BAL TO WS-ACC-BAL.                              00130101
           IF SQLCODE = 0                                               00131001
             IF DCL-ACC-STATUS = 'I'                                    00132001
               DISPLAY 'ACCOUNT IS INACTIVE!!!'                         00133001
             ELSE                                                       00134001
               DISPLAY 'ACCOUNT-NUMBER:'DCL-ACC-NO                      00150001
               DISPLAY 'ACCOUNT-NAME  :'DCL-ACC-NAME-TEXT               00160001
               DISPLAY 'ACCOUNT-BAL   :'WS-ACC-BAL                      00170001
           ELSE IF SQLCODE = +100                                       00180001
             DISPLAY 'ACCOUNT NOT FOUND!!!'                             00190001
           ELSE                                                         00200001
             DISPLAY 'SQLERROR:' SQLCODE                                00210001
           END-IF.                                                      00220001
           STOP RUN.                                                    00300000
