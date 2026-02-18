//VSAMCRE  JOB 'ACCT','CREATE VSAM',                                    00010000
//    TIME=(1,0),NOTIFY=&SYSUID,CLASS=A                                 00020000
//STEP00  EXEC PGM=IDCAMS                                               00030000
//SYSPRINT DD SYSOUT=*                                                  00040000
//SYSIN    DD *                                                         00050000
      DELETE Z82668.KRISHNA.KSDS CLUSTER                                00060000
/*                                                                      00070000
//STEP01  EXEC PGM=IDCAMS                                               00080000
//SYSOUT  DD SYSOUT=*                                                   00090000
//SYSPRINT DD SYSOUT=*                                                  00100000
//SYSIN DD *                                                            00110000
       DEFINE CLUSTER(NAME(Z82668.KRISHNA.KSDS)         -               00120000
       INDEXED                                          -               00130000
       KEY(10,0)             -                                          00131001
       RECORDSIZE(51,51)     -                                          00140000
       CISZ(4096)            -                                          00150000
       TRACKS(5,5)           -                                          00160000
       FREESPACE(3 3))       -                                          00170000
       DATA(NAME(Z82668.KRISHNA.KSDS.DATA))                             00180000
/*                                                                      00190000
//STEP2  EXEC PGM=IDCAMS                                                00200000
//SYSPRINT DD  SYSOUT=*                                                 00210000
//IN       DD DSN=Z82668.KRISHNA.INPUT1,DISP=SHR                        00220000
//OUT      DD DSN=Z82668.KRISHNA.KSDS,DISP=SHR                          00230000
//SYSIN    DD  *                                                        00240000
   REPRO INFILE(IN) -                                                   00250000
   OUTFILE(OUT)                                                         00260000
/*                                                                      00270000
