//Z82668C JOB 'ACCT','COBOL COMPILER',CLASS=A,                          00010000
//          TIME=(0,5),NOTIFY=&SYSUID                                   00020002
//***********INITIALIZE**************                                   00021000
// SET MEMBER=MINBALPE                                                  00022008
// SET SOURCE=Z82668.KRISHNA.SOURCE                                     00023000
// SET LOAD=Z82668.KRISHNA.LOADLIB                                      00024000
//***********COMPILER****************                                   00030000
//COBSTEP    EXEC PROC=IGYWCL                                           00040004
//SYSIN DD DSN=&SOURCE(&MEMBER),DISP=SHR                                00041003
//LKED.SYSLMOD DD DSN=&LOAD(&MEMBER),DISP=SHR                           00042003
//**********RUNPGM*******************
//RUNCPGM  JOB 'ACCT','RUN COBOL PGM',                                  00010000
//             CLASS=A,NOTIFY=&SYSUID,MSGCLASS=X                        00020000
//STEP01 EXEC PGM=MINBALPE                                              00090000
//STEPLIB DD DSN=Z82668.KRISHNA.LOADLIB,DISP=SHR                        00100000
//INFILE  DD DSN=Z82668.KRISHNA.KSDS,DISP=SHR                           00110000
//SYSOUT  DD SYSOUT=*                                                   00150000
//SYSPRINT DD SYSOUT=*                                                  00160000
