# Proyecto DocuJCL

## Descripción

Este proyecto tiene como objetivo proporcionar documentación para JCL (Job Control Language) con una interfaz fácil de usar que incluye un menú en el lado derecho para una navegación sencilla.

## Estructura del Proyecto

```
web-project
├── src
│   ├── index.html          # Documento HTML principal
│   ├── styles              # Contiene estilos CSS
│   │   └── style.css       # Estilos para el diseño y la disposición
│   ├── scripts             # Contiene archivos JavaScript
│   │   └── app.js          # Funcionalidad para el menú del lado derecho
│   └── docs                # Archivos de documentación
│       ├── jcl             # Documentación específica de JCL
│       │   └── README.md   # Documentación de JCL en Markdown
│       └── README.md       # Resumen de la estructura de la documentación
├── package.json            # Archivo de configuración de npm
└── README.md               # Resumen del proyecto
```

## Características

- Menú en el lado derecho para la navegación
- Documentación en formato Markdown para JCL
- Diseño responsivo para varios dispositivos

## Instalación

Para instalar el proyecto, sigue estos pasos:

1. Clona el repositorio:
    ```bash
    git clone https://github.com/usuario/proyecto.git
    ```
2. Instala las dependencias:
    ```bash
    npm install
    ```

## Uso

Para usar el proyecto, ejecuta el siguiente comando:
```bash
npm start
```

## Contribuir

Si deseas contribuir, por favor sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea una nueva rama (`git checkout -b feature/nueva-funcionalidad`).
3. Realiza tus cambios y haz commit (`git commit -am 'Añadir nueva funcionalidad'`).
4. Sube tus cambios (`git push origin feature/nueva-funcionalidad`).
5. Abre un Pull Request.

## Licencia

Este proyecto está bajo la Licencia MIT. Para más detalles, consulta el archivo [LICENSE](LICENSE).