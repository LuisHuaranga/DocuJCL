# Guía de JCL (Job Control Language)

## JCL: Definición

### ¿Qué es JCL?

**<span style="color:green">JCL</span>** es el acrónimo de **<span style="color:blue">Lenguaje de Control de Trabajos</span>** (Job Control Language). Es un conjunto de sentencias que describen cómo deben ejecutarse trabajos en un sistema mainframe. Aunque originalmente estos trabajos se definían mediante fichas perforadas, hoy en día se agrupan en lotes que el sistema **<span style="color:purple">OS/VS2</span>** ejecuta bajo el subsistema **<span style="color:purple">JES2</span>**.

### Información que Proporciona JCL al Sistema

- **Información contable**
- **Nombre y número de programas a ejecutar**
- **Orden de ejecución**
- **Ficheros o librerías necesarios**
- **Soportes y periféricos**
- **Comentarios y mensajes al operador de consola**
- **Otros...**

## Ciclo de Ejecución de un Proceso Batch

| **<span style="color:red">Etapa</span>** | **<span style="color:red">Descripción</span>**                                                                                                                                                  |
|-------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **<span style="color:green">Entrada</span>**     | Se envía un trabajo al <span style="color:blue">JES</span> para su ejecución. Se identifica con un nombre y número. Las sentencias de <span style="color:blue">JCL</span> se introducen en un fichero <span style="color:blue">SPOOL</span> en cola de entrada. |
| **<span style="color:green">Conversión</span>**  | Verificación sintáctica, revisión de existencia de ficheros y librerías, aportación de datos de procedimientos del sistema, y traspaso a la cola de ejecución. |
| **<span style="color:green">Ejecución</span>**   | El trabajo se carga en un <span style="color:blue">iniciador</span> y se ejecuta según orden de prioridades, asociando clases a subsistemas o elementos físicos de hardware.                   |
| **<span style="color:green">Salida</span>**      | Se da formato de salida al trabajo ejecutado y se pasa a colas de salida.                                                                                     |
| **<span style="color:green">Impresión</span>**   | Se especifica la clase de salida: impresión en impresoras, visualización en terminales, o almacenamiento en distintos medios permitidos por el sistema.      |
| **<span style="color:green">Borrado</span>**     | El trabajo finalizado se borra del control de <span style="color:blue">JES</span>.                                                                                                             |

*Nota*: Un error en cualquier etapa provoca una finalización anormal del trabajo (**<span style="color:red">JCL ERROR</span>** para errores sintácticos o de validación, **<span style="color:red">ABEND</span>** para errores en tiempo de ejecución). La finalización correcta se indica como **<span style="color:green">ENDED</span>**.
