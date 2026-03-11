//DB2RPGM  JOB NOTIFY=&SYSUID,TIME=(1,1)                                00010001
//DBRUN    EXEC PGM=IKJEFT01,DYNAMNBR=20                                00020000
//STEPLIB  DD  DSN=CEE.SCEERUN,DISP=SHR                                 00030000
//         DD  DSN=DSND10.SDSNLOAD,DISP=SHR                             00040000
//SYSTSPRT DD  SYSOUT=*                                                 00050000
//SYSPRINT DD  SYSOUT=*                                                 00060000
//SYSTSIN  DD  *                                                        00070000
   DSN  SYSTEM(DBDG)                                                    00080000
   RUN  PROGRAM(HACK2) PLAN(Z82668) LIB('Z82668.KRISHNA.LOADLIB')       00090002
   END                                                                  00100000
/*                                                                      00110000
//SYSIN    DD  *                                                        00120002
9000000002                                                              00130004
/*                                                                      00140002
