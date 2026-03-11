      ******************************************************************
      * DCLGEN TABLE(Z82668.ACC_DETAILS)                               *
      *        LIBRARY(Z82668.KRISHNA.DB2.DCLGEN(HACK2))               *
      *        ACTION(REPLACE)                                         *
      *        LANGUAGE(COBOL)                                         *
      *        NAMES(DCL-)                                             *
      *        STRUCTURE(DCL-CUST)                                     *
      *        QUOTE                                                   *
      *        COLSUFFIX(YES)                                          *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE Z82668.ACC_DETAILS TABLE
           ( ACC_NO                         CHAR(10) NOT NULL,
             ACC_NAME                       VARCHAR(30) NOT NULL,
             ACC_BAL                        DECIMAL(9, 2),
             ACC_TYPE                       CHAR(1) NOT NULL,
             ACC_STATUS                     CHAR(1) NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE Z82668.ACC_DETAILS                 *
      ******************************************************************
       01  DCL-CUST.
           10 DCL-ACC-NO           PIC X(10).
           10 DCL-ACC-NAME.
              49 DCL-ACC-NAME-LEN
                 PIC S9(4) USAGE COMP-5.
              49 DCL-ACC-NAME-TEXT
                 PIC X(30).
           10 DCL-ACC-BAL          PIC S9(7)V9(2) USAGE COMP-3.
           10 DCL-ACC-TYPE         PIC X(1).
           10 DCL-ACC-STATUS       PIC X(1).
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 5       *
      ******************************************************************
