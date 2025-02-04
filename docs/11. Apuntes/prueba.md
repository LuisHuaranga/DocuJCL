# Explicación del archivo `prueba.cbl`

## Descripción General

El programa `CDOBDB2E` es una interfaz de DB2 escrita en COBOL-II que crea un archivo temporal de parámetros para procesos batch que utilizan comandos SQL-DB2. A continuación, se detallan las secciones y componentes principales del programa.

## Secciones del Programa

### IDENTIFICATION DIVISION

Esta sección contiene información básica sobre el programa, como el nombre del programa, el autor, la instalación y la fecha de escritura.

| Campo             | Valor         |
|-------------------|---------------|
| PROGRAM-ID        | CDOBDB2E      |
| AUTHOR            | INTERBANK     |
| INSTALLATION      | INTERBANK     |
| DATE-WRITTEN      | 31-MAR-09     |

### ENVIRONMENT DIVISION

Define el entorno en el que se ejecuta el programa, incluyendo la configuración del hardware y los archivos de entrada/salida.

#### FILE-CONTROL

Define el archivo `PARAMETRO` que se utilizará en el programa.

```cobol
SELECT  PARAMETRO     ASSIGN   TO  S-PARAMETS
                      FILE STATUS   FS-PAR.
```

### DATA DIVISION

Contiene la definición de los datos utilizados en el programa.

#### FILE SECTION

Define la estructura del archivo `PARAMETRO`.

```cobol
FD  PARAMETRO
    LABEL  RECORDS   IS  STANDARD
    BLOCK  CONTAINS   0  RECORDS
    RECORD CONTAINS  80  CHARACTERS.
01  REG-PARAMETRO    PIC X(80).
```

#### WORKING-STORAGE SECTION

Define las variables de trabajo utilizadas en el programa.

| Variable      | Tipo       | Valor Inicial |
|---------------|------------|---------------|
| FS-PAR        | PIC X(02)  | SPACES        |
| REG-PAR       | PIC 9(03)  | ZEROS         |
| WK-LONGITUD   | PIC 9(03)  | ZEROS         |
| WK-STRING     | PIC X(05)  | SPACES        |
| WK-FECHA      | PIC X(10)  | ALL '*'       |
| WK-PROGRAMA   | PIC X(08)  | ALL '*'       |
| WK-LIBRERIA   | PIC X(40)  | ALL '*'       |
| WK-FREE       | PIC X(40)  | ALL '*'       |
| I             | PIC 9(03)  | ZEROS         |
| J             | PIC 9(03)  | ZEROS         |
| L             | PIC 9(03)  | ZEROS         |
| W-FILLERX     | PIC S9(03) | ZEROS COMP-3  |
| WK-APOSX      | PIC 9(03)  | 125 COMP      |
| WK-ARREGLO    | PIC X(100) | SPACES        |
| WK-LETRA      | PIC X      | SPACES        |
| SW-BYTE       | PIC 9      | 0             |

### PROCEDURE DIVISION

Contiene la lógica del programa dividida en varios párrafos.

#### RUTINA-PRINCIPAL

Realiza las operaciones principales del programa.

```cobol
RUTINA-PRINCIPAL.
    MOVE 16  TO RETURN-CODE.
    PERFORM 100-ABRE.
    PERFORM 200-INICIALIZA.
    PERFORM 300-PROCESO.
    MOVE 00  TO RETURN-CODE.
    PERFORM 400-CIERRA.
```

#### 100-ABRE

Abre el archivo `PARAMETRO` para salida.

```cobol
100-ABRE.
    DISPLAY 'INICIO DE DB2BPARM' UPON CONSOLE.
    OPEN OUTPUT PARAMETRO.
    IF (FS-PAR NOT EQUAL '00')
        DISPLAY 'ERROR AL OPEN ' FS-PAR UPON CONSOLE
        PERFORM 400-CIERRA
    END-IF.
```

#### 200-INICIALIZA

Inicializa las variables de trabajo.

```cobol
200-INICIALIZA.
    MOVE SPACES TO WK-DB2PARM.
    MOVE LK-BYTE TO WK-DB2PARM.
    DISPLAY 'PARM = '  WK-DB2PARM.
```

#### 300-PROCESO

Procesa los datos y escribe en el archivo `PARAMETRO`.

```cobol
300-PROCESO.
    MOVE WK-PROGRAMA TO  L02-PGM.
    MOVE WK-LIBRERIA TO  L03-LIB.
    MOVE WK-FECHA    TO  L04-FEC.
    MOVE WK-FREE     TO  L04-FRE.
    WRITE REG-PARAMETRO FROM LINE-01.
    WRITE REG-PARAMETRO FROM LINE-02.
    WRITE REG-PARAMETRO FROM LINE-04.
    WRITE REG-PARAMETRO FROM LINE-05.
    DISPLAY 'TERMINO CORRECTAMENTE ...' UPON CONSOLE.
```

#### 400-CIERRA

Cierra el archivo `PARAMETRO`.

```cobol
400-CIERRA.
    CLOSE PARAMETRO.
    DISPLAY 'FIN DE DB2PARM' UPON CONSOLE.
    STOP RUN.
```

## Ejemplo de Uso

Supongamos que queremos crear un archivo temporal con los siguientes parámetros:

- Fecha: 01/01/2023
- Programa: TESTPROG
- Librería: TEST.LIB.LOAD
- Parámetros adicionales: PARAM1=VALUE1

El programa procesará estos parámetros y generará un archivo temporal con el formato especificado.

```cobol
// Parámetros de entrada
01/01/2023/TESTPROG/TEST.LIB.LOAD/PARAM1=VALUE1/

// Salida esperada en el archivo PARAMETRO
DSN SYSTEM(DBE0)
RUN  PROGRAM(TESTPROG) PLAN(ECDOB001) -
      LIB(*TEST.LIB.LOAD*) -
      PARMS(*DATE=01/01/2023/PARAM1=VALUE1*)
END
```

Este ejemplo muestra cómo el programa toma los parámetros de entrada, los procesa y genera un archivo temporal con el formato adecuado para su uso en procesos batch que utilizan comandos SQL-DB2.
