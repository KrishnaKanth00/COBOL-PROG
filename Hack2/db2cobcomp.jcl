//Z82668C JOB 'ACCT','COBOL COMPILER',CLASS=A,                          00010000
//          TIME=(0,5),NOTIFY=&SYSUID                                   00020000
//***********INITIALIZE**************                                   00030000
// SET MEMBER=HACK2                                                     00040005
// SET LOADMEM=HACK2                                                    00041005
// SET SOURCE=Z82668.KRISHNA.SOURCE                                     00050000
// SET LOAD=Z82668.KRISHNA.LOADLIB                                      00060000
// SET INCLUDE=Z82668.KRISHNA.DB2.DCLGEN                                00061002
// SET DBRMLIB=Z82668.KRISHNA.DB2.DBRMLIB                               00062002
// SET COBCOPY=Z82668.KRISHNA.DB2.COBOL                                 00063000
//*********PRE-COMPILER**************                                   00064000
//DB2PCOMP  EXEC  PGM=DSNHPC,                                           00065004
//             PARM='HOST(IBMCOB),XREF,SOURCE,FLAG(I),APOST,NEWFUN(NO)' 00065104
//STEPLIB  DD  DISP=SHR,DSN=DSND10.SDSNLOAD                             00066002
//DBRMLIB  DD  DISP=SHR,DSN=&DBRMLIB(&LOADMEM)                          00067000
//SYSCIN   DD  DSN=&&DSNHOUT,DISP=(NEW,PASS,DELETE),UNIT=SYSDA,         00068000
//             SPACE=(800,(500,500))                                    00069000
//SYSLIB   DD  DISP=SHR,DSN=&INCLUDE                                    00069100
//         DD  DISP=SHR,DSN=&COBCOPY                                    00069200
//SYSPRINT DD  SYSOUT=*                                                 00069300
//SYSTERM  DD  SYSOUT=*                                                 00069400
//SYSUDUMP DD  SYSOUT=*                                                 00069500
//SYSUT1   DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00069600
//SYSUT2   DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00069700
//SYSIN    DD  DISP=SHR,DSN=&SOURCE(&MEMBER)                            00069800
//***********COMPILER****************                                   00070000
//COBSTEP    EXEC PROC=IGYWCL                                           00080000
//SYSIN DD DSN=&&DSNHOUT,DISP=(OLD,DELETE)                              00090002
//LKED.SYSLIB  DD DISP=SHR,DSN=DSND10.SDSNLOAD                          00091003
//             DD DISP=SHR,DSN=CEE.SCEELKED                             00092003
//             DD DISP=SHR,DSN=CEE.SCEERUN                              00093003
//             DD DISP=SHR,DSN=ISP.SISPLOAD                             00094003
//LKED.SYSLMOD DD DSN=&LOAD(&MEMBER),DISP=SHR                           00100000
//***********BIND********************                                   00110000
//STEPBIND EXEC PGM=IKJEFT01,DYNAMNBR=64                                00120000
//DBRMLIB  DD   DSN=&DBRMLIB,DISP=SHR                                   00130001
//STEPLIB  DD   DSN=&LOAD,DISP=SHR                                      00140001
//         DD   DSN=DSND10.SDSNLOAD,DISP=SHR                            00141003
//SYSUT3   DD   UNIT=SYSDA,SPACE=(CYL,(500,50))                         00150000
//SYSUT4   DD   UNIT=SYSDA,SPACE=(CYL,(500,50))                         00160000
//SYSPRINT DD   SYSOUT=*                                                00170000
//SYSTSPRT DD   SYSOUT=*                                                00180000
//SYSTSIN  DD   *                                                       00190000
   DSN S(DBDG)                                                          00200001
   BIND PLAN(Z82668) MEMBER(HACK2) QUALIFIER(Z82668)  -                 00210007
   PKLIST(Z82668.*) -                                                   00211006
   ACTION(REP) RETAIN ISOLATION(UR) -                                   00220005
   VALIDATE(BIND) ENCODING(EBCDIC)                                      00230005
   END                                                                  00240000
