************************************************************************
*     * TC0278 05/05/09 JRZ  INTERFASE DB2                   REG:13306 *00000090
************************************************************************
*IDAPL*CDO
*OBJET******************************************************************
*OBJET*** CREA FILE TEMP. DE PARAMETROS-PROCESOS BATCH CON SQL-DB2     *
*OBJET******************************************************************

       IDENTIFICATION DIVISION.                                         00000010
      *-----------------------*                                         00000020
       PROGRAM-ID.            CDOBDB2E.                                 00000030
       AUTHOR.                INTERBANK                                 00000040
       INSTALLATION.          INTERBANK                                 00000050
       DATE-WRITTEN.          31-MAR-09.                                00000060
       REMARKS.                                                         00000070
              -----------------------------------------------           00000080
             |            DB2 -  PROGRAM INTERFACE           |          00000090
             |            ************************           |          00000100
             |                                               |          00000110
             |   OBJETIVO :   CREAR UN ARCHIVO TEMPORAL DE   |          00000120
             |                PARAMETROS DE PROCESOS BATCH   |          00000130
             |                QUE UTILICEN COMANDO SQL-DB2   |          00000140
             |                CLON COMBDB2D                  |          00000150
             |   LENGUAJE :   COBOL-II                       |          00000160
             |                                               |          00000170
             |   ARCHIVOS :   OUTPUR PARAMETRO LF -->  80    |          00000180
             |                                               |          00000190
              -----------------------------------------------           00000200
      *01/09/97  M.SAUSA                                                00000210
      *VERSION CREADA PARA SIST                                         00000220
      *SE CAMBIO EL DSN POR DBT0                                        00000230
      *SE CAMBIO EL NOMBRE DEL PLAN ANTECEDIENDOLE UNA A                00000240
                                                                        00000250
      *22/07/98  JCIC                                                   00000260
      *VERSION MODIFICADA PARA AñO 2000                                 00000270
      *SE AMPLIO EL AñO DE LA FECHA A 4 DIGITOS                         00000280
                                                                        00000290
       ENVIRONMENT DIVISION.                                            00000300
      *--------------------*                                            00000310
       CONFIGURATION SECTION.                                           00000320
      *--------------------*                                            00000330
       SOURCE-COMPUTER. IBM-4341.                                       00000340
       OBJECT-COMPUTER. IBM-4341.                                       00000350
       INPUT-OUTPUT SECTION.                                            00000360
      *--------------------*                                            00000370
       FILE-CONTROL.                                                    00000380
      *------------*                                                    00000390
           SELECT  PARAMETRO     ASSIGN   TO  S-PARAMETS                00000400
                                 FILE STATUS   FS-PAR.                  00000410
       DATA DIVISION.                                                   00000420
      *-------------*                                                   00000430
       FILE SECTION.                                                    00000440
      *------------*                                                    00000450
       FD  PARAMETRO                                                    00000460
           LABEL  RECORDS   IS  STANDARD                                00000470
           BLOCK  CONTAINS   0  RECORDS                                 00000480
           RECORD CONTAINS  80  CHARACTERS.                             00000490
       01  REG-PARAMETRO    PIC X(80).                                  00000500
       WORKING-STORAGE SECTION.                                         00000510
      *-----------------------*                                         00000520
       01  VARIABLES.                                                   00000530
           02 FS-PAR        PIC  X(02)   VALUE SPACES.                  00000540
           02 REG-PAR       PIC  9(03)   VALUE ZEROS.                   00000550
           02 WK-LONGITUD   PIC  9(03)   VALUE ZEROS.                   00000560
           02 WK-STRING     PIC  X(05)   VALUE SPACES.                  00000570
      *    02 WK-FECHA      PIC  X(08)   VALUE ALL '*'.                 00000580
JIC        02 WK-FECHA      PIC  X(10)   VALUE ALL '*'.                 00000590
           02 WK-PROGRAMA   PIC  X(08)   VALUE ALL '*'.                 00000600
           02 WK-LIBRERIA   PIC  X(40)   VALUE ALL '*'.                 00000610
           02 WK-FREE       PIC  X(40)   VALUE ALL '*'.                 00000620
           02 I             PIC  9(03)   VALUE ZEROS.                   00000630
           02 J             PIC  9(03)   VALUE ZEROS.                   00000640
           02 L             PIC  9(03)   VALUE ZEROS.                   00000650
           02 W-FILLERX     PIC  S9(03)  VALUE ZEROS  COMP-3.           00000660
           02 W-FILLER      REDEFINES W-FILLERX.                        00000670
              04 WK-00      PIC  X.                                     00000680
              04 FILLER     PIC  X.                                     00000690
           02 WK-APOSX      PIC  9(03)   VALUE 125    COMP.             00000700
           02 FILLER        REDEFINES WK-APOSX.                         00000710
              04 FILLER     PIC  X.                                     00000720
              04 WK-APOS    PIC  X.                                     00000730
           02 WK-ARREGLO    PIC X(100)    VALUE SPACES.                 00000740
           02 WK-LETRA      PIC X        VALUE SPACES.                  00000750
           02 SW-BYTE       PIC 9        VALUE 0.                       00000760
      ******************************************************************00000770
      *              D E T A L L E      D E     S A L I D A            *00000780
      ******************************************************************00000790
       01  LINE-01.                                                     00000800
           02 FILLER  PIC X(17) VALUE ' DSN SYSTEM(DBE0)'.              00000810
       01  LINE-02.                                                     00000820
           02 FILLER  PIC X(14) VALUE ' RUN  PROGRAM('.                 00000830
           02 L02-PGM PIC X(08) VALUE ALL '*'.                          00000840
           02 FILLER  PIC X(08) VALUE ') PLAN(E'.                       00000850
           02 L02-PLA PIC X(07) VALUE 'CDOB001'.                        00000860
           02 FILLER  PIC X(03) VALUE ') -'.                            00000870
       01  LINE-03.                                                     00000880
           02 FILLER  PIC X(10) VALUE '      LIB('.                     00000890
           02 L03-AP1 PIC X     VALUE '*'.                              00000900
           02 L03-LIB PIC X(40) VALUE ALL '*'.                          00000910
           02 L03-AP2 PIC X     VALUE '*'.                              00000920
           02 FILLER  PIC X(03) VALUE ') -'.                            00000930
       01  LINE-04.                                                     00000940
           02 FILLER  PIC X(12) VALUE '      PARMS('.                   00000950
           02 L04-AP1 PIC X     VALUE '*'.                              00000960
           02 FILLER  PIC X(05) VALUE 'DATE='.                          00000970
      *    02 L04-FEC PIC X(08) VALUE ALL '*'.                          00000980
JIC        02 L04-FEC PIC X(10) VALUE ALL '*'.                          00000990
           02 FILLER  PIC X     VALUE '/'.                              00001000
           02 L04-FRE PIC X(40) VALUE ALL '*'.                          00001010
           02 L04-AP2 PIC X     VALUE '*'.                              00001020
           02 FILLER  PIC X     VALUE ')'.                              00001030
       01  LINE-05.                                                     00001040
           02 FILLER  PIC X(04) VALUE ' END'.                           00001050
                                                                        00001060
      * FORMATO DE LINKAGE                                              00001070
      *PARM='DATE=DD/MM/SSAA/PGM=12345678/LIB=T.LIB.LOAD.BATCH       '  00001080
      *               1         2         3         4         5         00001090
      *      12345678901234567890123456789012345678901234567890123456   00001100
                                                                        00001110
      *---------------------------------------------------------------* 00001120
      *                   DB2 -  PROGRAM INTERFACE                    * 00001130
      *   PROGRAMA/LIBRERIA/LIBRE              PARA WORKING STORAGE   * 00001140
      *---------------------------------------------------------------* 00001150
       01  WK-DB2PARM.                                                  00001160
           02 WK-BYTE OCCURS 100 TIMES PIC X.                           00001170
      *---------------------------------------------------------------* 00001180
       LINKAGE SECTION.                                                 00001190
      *---------------*                                                 00001200
      *---------------------------------------------------------------* 00001210
      *                   DB2 -  PROGRAM INTERFACE                    * 00001220
      *   PROGRAMA/LIBRERIA/LIBRE              PARA LINKAGE SECTION   * 00001230
      *---------------------------------------------------------------* 00001240
       01  LK-DB2PARM.                                                  00001250
           02  LL-DB2PARM          PIC S9(4) COMP.                      00001260
           02  LK-BYTE             PIC X(100).                          00001270
      *----------------------------------------------------------------*00001280
       PROCEDURE DIVISION USING LK-DB2PARM.                             00001290
      *******************                                               00001300
                                                                        00001310
       RUTINA-PRINCIPAL.                                                00001320
      *----------------*                                                00001330
           MOVE 16  TO RETURN-CODE.                                     00001340
           PERFORM 100-ABRE.                                            00001350
           PERFORM 200-INICIALIZA.                                      00001360
           PERFORM 300-PROCESO.                                         00001370
           MOVE 00  TO RETURN-CODE.                                     00001380
           PERFORM 400-CIERRA.                                          00001390
                                                                        00001400
      ***************                                                   00001410
      *  PRIMER NIVEL                                                   00001420
      ****************                                                  00001430
                                                                        00001440
       100-ABRE.                                                        00001450
      *********                                                         00001460
           DISPLAY 'INICIO DE DB2BPARM'                    UPON CONSOLE.00001470
           DISPLAY '******************'                    UPON CONSOLE.00001480
           OPEN OUTPUT PARAMETRO.                                       00001490
           DISPLAY 'FS-PAR : ' FS-PAR                      UPON CONSOLE.00001500
           IF (FS-PAR NOT EQUAL '00')                                   00001510
               DISPLAY 'ERROR AL OPEN ' FS-PAR              UPON CONSOLE00001520
               DISPLAY 'CANCELA PROCESO ...'                UPON CONSOLE00001530
               PERFORM 400-CIERRA                                       00001540
           END-IF.                                                      00001550
       200-INICIALIZA.                                                  00001560
      ***************                                                   00001570
           MOVE SPACES     TO WK-DB2PARM.                               00001580
           MOVE LK-BYTE    TO WK-DB2PARM.                               00001590
           DISPLAY 'PARM = '  WK-DB2PARM.                               00001600
                                                                        00001610
      *    LONGITUD DE WK-DB2PARM                                       00001620
           MOVE 100 TO I.                                               00001630
           PERFORM UNTIL (         I  EQUAL ZEROS OR                    00001640
                          WK-BYTE (I) EQUAL '/')                        00001650
               IF (WK-BYTE (I) EQUAL WK-00 OR                           00001660
                   WK-BYTE (I) EQUAL SPACES)                            00001670
                   SUBTRACT 1 FROM I                                    00001680
               ELSE                                                     00001690
                   DISPLAY 'DELIMITADOR PARAMETRO INCORRECTO'           00001700
                                                            UPON CONSOLE00001710
                   DISPLAY 'DEBE DE TERMINAR CON / -> ' WK-BYTE (I)     00001720
                                                            UPON CONSOLE00001730
                   DISPLAY 'CANCELA PROCESO ...'                        00001740
                                                            UPON CONSOLE00001750
                   PERFORM 400-CIERRA                                   00001760
               END-IF                                                   00001770
           END-PERFORM.                                                 00001780
           IF (I GREATER ZEROS)                                         00001790
               MOVE I  TO WK-LONGITUD                                   00001800
            ELSE                                                        00001810
               DISPLAY 'DELIMITADOR PARAMETRO INCORRECTO'   UPON CONSOLE00001820
               DISPLAY 'DEBE DE TERMINAR CON /'             UPON CONSOLE00001830
               DISPLAY 'CANCELA PROCESO ...'                UPON CONSOLE00001840
               PERFORM 400-CIERRA.                                      00001850
            DISPLAY 'LONGITUD DE PARAMETRO : ' WK-LONGITUD.             00001860
                                                                        00001870
      *    CONSISTENCIA LABEL DATE                                      00001880
           MOVE WK-DB2PARM (01 : 05) TO WK-STRING                       00001890
           IF (WK-STRING EQUAL 'DATE=')                                 00001900
               NEXT SENTENCE                                            00001910
           ELSE                                                         00001920
               DISPLAY 'PARAMETRO FECHA INCORRECTO'         UPON CONSOLE00001930
               DISPLAY 'CANCELA PROGRAMA ...'               UPON CONSOLE00001940
               PERFORM 400-CIERRA                                       00001950
           END-IF.                                                      00001960
      *    FECHA ACEPTADA DD/MM/SSAA                                    00001970
           MOVE WK-DB2PARM (06 : 10) TO WK-FECHA.                       00001980
                                                                        00001990
      *    CONSISTENCIA LABEL PGM                                       00002000
           MOVE WK-DB2PARM (17 : 04) TO WK-STRING                       00002010
           IF (WK-STRING EQUAL 'PGM=')                                  00002020
               NEXT SENTENCE                                            00002030
           ELSE                                                         00002040
               DISPLAY 'PARAMETRO PROGRAMA INCORRECTO -> ' WK-STRING    00002050
                                                            UPON CONSOLE00002060
               DISPLAY 'CANCELA PROGRAMA ...'               UPON CONSOLE00002070
               PERFORM 400-CIERRA                                       00002080
           END-IF.                                                      00002090
      *    PROGRAMA ACEPTADO                                            00002100
           MOVE 21 TO I.                                                00002110
           MOVE  0 TO L.                                                00002120
           PERFORM BUSCA-BYTE UNTIL (WK-BYTE (I) EQUAL '/' OR           00002130
                                     L GREATER 07).                     00002140
           IF (L GREATER ZEROS AND                                      00002150
               WK-BYTE(I) EQUAL '/')                                    00002160
               MOVE WK-DB2PARM (21 : L) TO WK-PROGRAMA                  00002170
           ELSE                                                         00002180
               DISPLAY 'DELIMITADOR PROGRAMA INCORRECTO'    UPON CONSOLE00002190
               DISPLAY 'CANCELA PROGRAMA ...'               UPON CONSOLE00002200
               PERFORM 400-CIERRA                                       00002210
           END-IF.                                                      00002220
      *    CONSISTENCIA LABEL LIB                                       00002230
      *    ADD  01 TO I.                                                00002240
      *    MOVE WK-DB2PARM ( I : 04) TO WK-STRING                       00002250
      *    IF (WK-STRING EQUAL 'LIB=')                                  00002260
      *        NEXT SENTENCE                                            00002270
      *    ELSE                                                         00002280
      *        DISPLAY 'PARAMETRO LIBRERIA INCORRECTO -> ' WK-STRING    00002290
      *                                                     UPON CONSOLE00002300
      *        DISPLAY 'CANCELA PROGRAMA ...'               UPON CONSOLE00002310
      *        PERFORM 400-CIERRA                                       00002320
      *    END-IF.                                                      00002330
      *    LIBRERIA ACEPTADA                                            00002340
      *    ADD  04 TO I.                                                00002350
      *    MOVE  I TO J.                                                00002360
      *    MOVE 00 TO L.                                                00002370
      *    PERFORM BUSCA-BYTE UNTIL (WK-BYTE (I) EQUAL '/' OR           00002380
      *                              WK-BYTE (I) EQUAL ' ').            00002390
      *    IF (L GREATER ZEROS AND                                      00002400
      *        WK-BYTE(I) EQUAL '/')                                    00002410
      *        MOVE WK-DB2PARM ( J : L ) TO WK-LIBRERIA                 00002420
      *    ELSE                                                         00002430
      *        DISPLAY 'DELIMITADOR LIBRERIA INCORRECTO'    UPON CONSOLE00002440
      *        DISPLAY 'CANCELA PROGRAMA ...'               UPON CONSOLE00002450
      *        PERFORM 400-CIERRA                                       00002460
      *    END-IF.                                                      00002470
      *    ARMA PARAMETRO FREE                                          00002480
           ADD  01 TO I.                                                00002490
           IF (I LESS WK-LONGITUD)                                      00002500
               MOVE 00 TO L                                             00002510
               SUBTRACT I FROM WK-LONGITUD GIVING L                     00002520
               ADD 1   TO L                                             00002530
               MOVE WK-DB2PARM (I : L) TO WK-FREE                       00002540
               MOVE 01 TO I                                             00002550
               PERFORM FREE-BLANCO UNTIL (I GREATER L)                  00002560
           ELSE                                                         00002570
               MOVE SPACES TO WK-FREE                                   00002580
           END-IF.                                                      00002590
       300-PROCESO.                                                     00002600
      ***********                                                       00002610
           MOVE WK-PROGRAMA TO  L02-PGM.                                00002620
      *    MOVE WK-PROGRAMA TO  L02-PLA.                                00002630
           MOVE WK-LIBRERIA TO  L03-LIB.                                00002640
           MOVE WK-FECHA    TO  L04-FEC.                                00002650
           MOVE WK-FREE     TO  L04-FRE.                                00002660
           MOVE WK-APOS     TO  L03-AP1.                                00002670
           MOVE WK-APOS     TO  L03-AP2.                                00002680
           MOVE WK-APOS     TO  L04-AP1.                                00002690
           MOVE WK-APOS     TO  L04-AP2.                                00002700
                                                                        00002710
           WRITE REG-PARAMETRO FROM LINE-01.                            00002720
                                                                        00002730
      *    COMPACTA ESPACIOS EN BLANCO                                  00002740
           MOVE SPACES      TO  WK-DB2PARM.                             00002750
           MOVE SPACES      TO  WK-ARREGLO.                             00002760
           MOVE LINE-02     TO  WK-ARREGLO.                             00002770
           MOVE ZEROS       TO  SW-BYTE.                                00002780
           MOVE ZEROS       TO  J.                                      00002790
           PERFORM COMPACTA VARYING I FROM 1 BY 1                       00002800
                             UNTIL (I GREATER 80).                      00002810
           MOVE  WK-DB2PARM TO LINE-02.                                 00002820
           WRITE REG-PARAMETRO FROM LINE-02.                            00002830
                                                                        00002840
           MOVE SPACES      TO  WK-DB2PARM.                             00002850
           MOVE SPACES      TO  WK-ARREGLO.                             00002860
           MOVE LINE-03     TO  WK-ARREGLO.                             00002870
           MOVE ZEROS       TO  SW-BYTE.                                00002880
           MOVE ZEROS       TO  J.                                      00002890
           PERFORM COMPACTA VARYING I FROM 1 BY 1                       00002900
                             UNTIL (I GREATER 80).                      00002910
           MOVE  WK-DB2PARM TO LINE-03.                                 00002920
      *    WRITE REG-PARAMETRO FROM LINE-03.                            00002930
                                                                        00002940
           MOVE SPACES      TO  WK-DB2PARM.                             00002950
           MOVE SPACES      TO  WK-ARREGLO.                             00002960
           MOVE LINE-04     TO  WK-ARREGLO.                             00002970
           MOVE ZEROS       TO  SW-BYTE.                                00002980
           MOVE ZEROS       TO  J.                                      00002990
           PERFORM COMPACTA VARYING I FROM 1 BY 1                       00003000
                             UNTIL (I GREATER 80).                      00003010
           MOVE  WK-DB2PARM TO LINE-04.                                 00003020
           WRITE REG-PARAMETRO FROM LINE-04.                            00003030
                                                                        00003040
           WRITE REG-PARAMETRO FROM LINE-05.                            00003050
                                                                        00003060
           DISPLAY ' '                                     UPON CONSOLE.00003070
           DISPLAY 'TERMINO CORRECTAMENTE ...'             UPON CONSOLE.00003080
           DISPLAY ' '                                     UPON CONSOLE.00003090
       400-CIERRA.                                                      00003100
      ***********                                                       00003110
           CLOSE    PARAMETRO.                                          00003120
           DISPLAY 'FIN DE DB2PARM'                        UPON CONSOLE.00003130
           DISPLAY '**************'                        UPON CONSOLE.00003140
                                                                        00003150
           STOP RUN.                                                    00003160
      ****************                                                  00003170
      * SEGUNDO NIVEL                                                   00003180
      ****************                                                  00003190
       BUSCA-BYTE.                                                      00003200
      ***********                                                       00003210
           ADD 1  TO I.                                                 00003220
           ADD 1  TO L.                                                 00003230
       FREE-BLANCO.                                                     00003240
      ************                                                      00003250
           IF (WK-FREE (I : 1) EQUAL SPACES)                            00003260
               MOVE '_' TO WK-FREE (I : 1)                              00003270
           END-IF.                                                      00003280
           ADD 1  TO I.                                                 00003290
       COMPACTA.                                                        00003300
      **********                                                        00003310
           MOVE WK-ARREGLO (I : 1) TO WK-LETRA.                         00003320
           IF (WK-LETRA EQUAL SPACES)                                   00003330
               NEXT SENTENCE                                            00003340
           ELSE                                                         00003350
               MOVE ZEROS TO SW-BYTE                                    00003360
           END-IF.                                                      00003370
           IF (SW-BYTE EQUAL ZEROS)                                     00003380
               ADD 1 TO J                                               00003390
               IF (WK-LETRA EQUAL '_')                                  00003400
                   MOVE SPACES   TO WK-BYTE (J)                         00003410
               ELSE                                                     00003420
                   MOVE WK-LETRA TO WK-BYTE (J)                         00003430
               END-IF                                                   00003440
               IF (WK-LETRA EQUAL SPACES)                               00003450
                   MOVE 1 TO SW-BYTE                                    00003460
               END-IF                                                   00003470
           END-IF.                                                      00003480
           IF (WK-LETRA EQUAL SPACES)                                   00003490
               COMPUTE L = I + 1                                        00003500
               IF (L LESS 101)                                          00003510
                   MOVE WK-ARREGLO (L : 1) TO WK-LETRA                  00003520
                   IF (WK-LETRA EQUAL ')' OR                            00003530
                       WK-LETRA EQUAL WK-APOS)                          00003540
                       SUBTRACT 1 FROM J                                00003550
                    END-IF                                              00003560
               END-IF                                                   00003570
           END-IF.                                                      00003580 