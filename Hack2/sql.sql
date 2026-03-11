  SELECT * FROM ACC_DETAILS;;;                                          00000199
  INSERT INTO ACC_DETAILS(ACC_NO,ACC_NAME,ACC_BAL,ACC_TYPE,ACC_STATUS)  00000399
  VALUES('9000000001','RAJESH KUMAR',50000,'S','A');                    00000499
  INSERT INTO ACC_DETAILS(ACC_NO,ACC_NAME,ACC_BAL,ACC_TYPE,ACC_STATUS)  00000599
  VALUES('9000000002','PRIYA SHARMA',15000,'S','A');                    00000699
  INSERT INTO ACC_DETAILS(ACC_NO,ACC_NAME,ACC_BAL,ACC_TYPE,ACC_STATUS)  00000799
  VALUES('9000000003','ARUN MENON',200000,'S','A');;;;                  00000899
  CREATE UNIQUE INDEX IX_ACC_DETAILS                                    00001399
  ON Z82668.ACC_DETAILS (ACC_NO)                                        00001499
  USING STOGROUP ZXPUSER;;;                                             00001599
  CREATE TABLE ACC_DETAILS (                                            00001699
      ACC_NO CHAR(10)NOT NULL,                                          00001799
     ACC_NAME VARCHAR(30) NOT NULL,                                     00001899
      ACC_BAL DECIMAL(9,2) CHECK (ACC_BAL > 0),                         00001999
      ACC_TYPE CHAR(1) NOT NULL,                                        00002099
      ACC_STATUS CHAR(1) NOT NULL,                                      00002199
      PRIMARY KEY (ACC_NO)                                              00002299
  )                                                                     00002399
  IN Z82668.Z82668TS;;;                                                 00002499
