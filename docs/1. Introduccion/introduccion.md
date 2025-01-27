# Guía de JCL (Job Control Language)

## JCL: Definición

### ¿Qué es JCL?

**JCL** es el acrónimo de **Lenguaje de Control de Trabajos** (Job Control Language). Es un conjunto de sentencias que describen cómo deben ejecutarse trabajos en un sistema mainframe. Aunque originalmente estos trabajos se definían mediante fichas perforadas, hoy en día se agrupan en lotes que el sistema OS/VS2 ejecuta bajo el subsistema JES2.

### Información que Proporciona JCL al Sistema

- Información contable
- Nombre y número de programas a ejecutar
- Orden de ejecución
- Ficheros o librerías necesarios
- Soportes y periféricos
- Comentarios y mensajes al operador de consola
- Otros...

## Ciclo de Ejecución de un Proceso Batch

| Etapa       | Descripción                                                                                                                                                  |
|-------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Entrada     | Se envía un trabajo al JES para su ejecución. Se identifica con un nombre y número. Las sentencias de JCL se introducen en un fichero SPOOL en cola de entrada. |
| Conversión  | Verificación sintáctica, revisión de existencia de ficheros y librerías, aportación de datos de procedimientos del sistema, y traspaso a la cola de ejecución. |
| Ejecución   | El trabajo se carga en un iniciador y se ejecuta según orden de prioridades, asociando clases a subsistemas o elementos físicos de hardware.                   |
| Salida      | Se da formato de salida al trabajo ejecutado y se pasa a colas de salida.                                                                                     |
| Impresión   | Se especifica la clase de salida: impresión en impresoras, visualización en terminales, o almacenamiento en distintos medios permitidos por el sistema.      |
| Borrado     | El trabajo finalizado se borra del control de JES.                                                                                                             |

*Nota*: Un error en cualquier etapa provoca una finalización anormal del trabajo (**JCL ERROR** para errores sintácticos o de validación, **ABEND** para errores en tiempo de ejecución). La finalización correcta se indica como **ENDED**.
