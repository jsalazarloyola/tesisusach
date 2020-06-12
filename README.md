# tesisusach

Intento de realizar un formato de tesis siguiendo los requerimientos de la USACH que funcione con pdflatex.

Basado en el formato de [Emir Muñoz](https://github.com/emir-munoz/tesis-usach), con ediciones de a lo menos dos personas más, no todas reconocidas en la información del paquete que recibí.

Actualizado por **Javier Salazar Loyola** (javier dot salazar dot l at usach dot cl).

(Estoy eliminando todo lo innecesario o que es demasiado específico para un departamento específico, de modo que quede un modelo general para toda la universidad).

## TODO:
* Documentar el código y sus funcionalidades.
* Documentar las opciones de la clase.
* Corregir el comando para hacer la portada (**funciona**).
* Determinar si los entornos nuevos son necesarios.

## Mini manual de uso:

Coloqué un archivo, `ejemplo.tex`, para mostrar cómo se podría ordenar. Este archivo estará actualizado con ejemplos de uso (requiere paquete `lipsum`).

Para usar el formato, copiar los archivos `tesisusach.cls` y `apa-good.bst` en la carpeta del proyecto. Luego, iniciar con:

```\documentclass{tesisusach}```

Las opciones, hasta que logre documentarlas bien, son las mismas que las de la clase `book`, en la que se basa este formato. Ampliaré la documentación en el corto plazo.

## Agradecimientos

A Jacqueline Köhler, profesora del DIINF y estudiante de doctorado del mismo departamento, por servir de conejillo de indias y dar los comentarios necesarios para que esta cosa funcione bien.

