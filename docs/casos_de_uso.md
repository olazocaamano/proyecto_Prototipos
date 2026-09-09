# Documento de Casos de Uso

## Actores del Sistema
- **Docente:** (Añadir aquí una breve descripción de los permisos de este actor)

---

## Parte 1: Mónica

### Módulo 1: Inicio de sesión
*(Redactar casos de uso aquí)*

### Módulo 2: Panel principal
*(Redactar casos de uso aquí)*

### Módulo 3: Grupos
*(Redactar casos de uso aquí)*

### Módulo 4: Lista de alumnos
*(Redactar casos de uso aquí)*

### Módulo 5: Alumnos
*(Redactar casos de uso aquí)*

### Módulo 6: Horarios
*(Redactar casos de uso aquí)*

---

## Parte 2: Emmanuel

### Módulo 7: Asistencia

---

#### Caso de Uso 25: Registro de asistencia diaria

**ID:** CU-ASISTENCIA-01  
**Actor Principal:** Docente  
**Descripción:** Permite al docente registrar la asistencia diaria mostrando por defecto la fecha actual para un pase de lista rápido. Genera estadísticas y se enlaza automáticamente con el cálculo de calificaciones y alumnos en riesgo.

**Precondiciones:**
- El docente debe tener un grupo con alumnos inscritos.

**Flujo Principal (Escenario de Éxito):**
1. El docente accede al módulo de "Asistencia" y selecciona un grupo.
2. El sistema muestra la lista de alumnos con la fecha del día actual preseleccionada.
3. El docente marca el estado de cada alumno (Presente, Falta, Retardo, Justificado).
4. El docente guarda la asistencia.
5. El sistema registra los datos, actualiza las estadísticas individuales y grupales, y envía el porcentaje de asistencia al módulo de Calificaciones.

**Flujos Alternativos (Excepciones y Errores):**
- **Paso 2a (Consultar historial):** El docente puede cambiar la vista de "Día actual" a "Historial" para visualizar la tabla completa de asistencias pasadas.

**Postcondiciones:**
- Los datos quedan disponibles para los resúmenes estadísticos y se integran al promedio del alumno según los criterios del docente.

---

#### Caso de Uso 26: Justificación de inasistencias históricas

**ID:** CU-ASISTENCIA-25  
**Actor Principal:** Docente  
**Descripción:** Permite al docente modificar el registro de asistencia de un día anterior para cambiar el estado de "Falta" a "Justificado" cuando un alumno presenta un justificante médico o administrativo de forma extemporánea.

**Precondiciones:**
- Debe existir un registro de inasistencia previo para el alumno en una fecha pasada.

**Flujo Principal (Escenario de Éxito):**
1. El docente accede al módulo de "Asistencia" y cambia la vista a "Historial".
2. El sistema muestra el calendario o tabla de registros anteriores.
3. El docente localiza la fecha específica y al alumno con la falta.
4. El docente cambia el estado de "Falta" a "Justificado" y anota el motivo (ej. Receta médica).
5. El docente guarda los cambios.
6. El sistema actualiza el registro, recalcula el porcentaje total de asistencia del alumno y actualiza el módulo de "Alumnos en riesgo" si el alumno sale del umbral crítico.

**Flujos Alternativos (Excepciones y Errores):**
- **Paso 4a (Bloqueo por fin de periodo):** Si el periodo de evaluación ya fue cerrado y enviado a administración, el sistema bloquea la edición y notifica al docente que las modificaciones históricas están deshabilitadas para ese ciclo.

**Postcondiciones:**
- El historial del alumno refleja la justificación y se corrigen sus métricas generales.

---

### Módulo 8: Participaciones

---

#### Caso de Uso 27: Registro de participaciones con valor numérico

**ID:** CU-PARTICIPACIONES-01  
**Actor Principal:** Docente  
**Descripción:** Permite registrar participaciones diarias asignando valores numéricos a los alumnos, generando estadísticas que se enlazan automáticamente al cálculo de calificaciones.

**Precondiciones:**
- El grupo debe estar configurado y activo.

**Flujo Principal (Escenario de Éxito):**
1. El docente accede al módulo de "Participaciones" para un grupo específico.
2. El sistema muestra la lista de alumnos correspondiente al día actual.
3. El docente asigna un valor numérico a la participación del alumno destacado.
4. El docente confirma el registro.
5. El sistema guarda el valor, actualiza las estadísticas grupales e individuales, y sincroniza el acumulado con el módulo de Calificaciones.

**Flujos Alternativos (Excepciones y Errores):**
- **Paso 3a (Corrección de error):** Si el docente asigna un valor incorrecto, puede editar o eliminar el registro numérico en el mismo panel antes de cerrar la sesión de ese día.

**Postcondiciones:**
- El puntaje numérico se suma al historial del alumno para su evaluación final.

---

#### Caso de Uso 28: Asignación masiva de participaciones por equipo

**ID:** CU-PARTICIPACIONES-26  
**Actor Principal:** Docente  
**Descripción:** Agiliza el registro de participaciones permitiendo al docente seleccionar a múltiples alumnos al mismo tiempo (por ejemplo, tras una exposición en equipo) para asignarles el mismo valor numérico en una sola acción.

**Precondiciones:**
- El grupo debe tener alumnos inscritos y activos.

**Flujo Principal (Escenario de Éxito):**
1. El docente ingresa al módulo de "Participaciones".
2. El sistema muestra la lista de alumnos.
3. El docente activa la opción de "Selección múltiple" o "Equipos".
4. El docente marca las casillas de varios alumnos simultáneamente.
5. El docente ingresa un valor numérico único y confirma el registro.
6. El sistema aplica el mismo puntaje a todos los alumnos seleccionados de forma masiva.

**Flujos Alternativos (Excepciones y Errores):**
- **Paso 4a (Ningún alumno seleccionado):** Si el docente intenta guardar el puntaje sin haber marcado casillas, el sistema deshabilita el botón de confirmación hasta que se seleccione al menos a un estudiante.

**Postcondiciones:**
- Los puntajes se suman al historial individual de cada alumno seleccionado.

---

### Módulo 9: Calificaciones

---

#### Caso de Uso 29: Configuración de criterios y cálculo automático

**ID:** CU-CALIFICACIONES-01  
**Actor Principal:** Docente  
**Descripción:** Permite al docente definir sus propios criterios de evaluación con porcentajes (incluyendo atajos para asistencia y participación) y calcula los promedios automáticamente.

**Precondiciones:**
- Deben existir registros previos si se van a vincular asistencias y participaciones.

**Flujo Principal (Escenario de Éxito):**
1. El docente ingresa al módulo de "Calificaciones" y selecciona "Configurar criterios".
2. El docente crea criterios (ej. Examen, Proyecto) y les asigna un porcentaje.
3. El docente utiliza los atajos del sistema para asignar un porcentaje directo a los rubros automáticos de "Asistencia" y "Participación".
4. El sistema valida que la suma de todos los porcentajes sea exactamente 100%.
5. El sistema extrae los datos de asistencia y participación, solicita la captura de los criterios manuales y calcula el promedio final automáticamente.
6. El sistema muestra el rendimiento individual de cada alumno y el promedio general del grupo.

**Flujos Alternativos (Excepciones y Errores):**
- **Paso 4a (Porcentaje inválido):** Si la suma de los criterios es menor o mayor a 100%, el sistema bloquea el guardado y resalta el total para solicitar la corrección.

**Postcondiciones:**
- El promedio del alumno queda calculado y disponible para detectar si entra en estado de riesgo.

---

#### Caso de Uso 30: Exportación de actas de calificaciones

**ID:** CU-CALIFICACIONES-27  
**Actor Principal:** Docente  
**Descripción:** Permite al docente exportar la sábana final de calificaciones del grupo en formatos estándar (PDF o Excel) para entregarla a la administración escolar o para archivo personal.

**Precondiciones:**
- Todas las calificaciones del periodo deben estar capturadas y calculadas.

**Flujo Principal (Escenario de Éxito):**
1. El docente ingresa al módulo de "Calificaciones" y selecciona un grupo y periodo finalizado.
2. El docente hace clic en el botón "Exportar acta".
3. El sistema solicita el formato de salida (Excel o PDF).
4. El docente selecciona el formato.
5. El sistema compila los datos, genera el documento con el diseño institucional y descarga el archivo en el dispositivo del docente.

**Flujos Alternativos (Excepciones y Errores):**
- **Paso 2a (Calificaciones incompletas):** Si el sistema detecta que hay alumnos sin calificación asignada en ese periodo, lanza una advertencia preguntando si el docente desea exportar el acta con espacios en blanco.

**Postcondiciones:**
- El docente obtiene un archivo físico o digital listo para trámites administrativos.

---

### Módulo 10: Alumnos en riesgo

---

#### Caso de Uso 31: Detección automática de riesgo académico

**ID:** CU-RIESGO-01  
**Actor Principal:** Docente  
**Descripción:** Sistema automatizado que monitorea faltas, calificaciones y participaciones para detectar estudiantes en riesgo, mostrando el motivo exacto y su perfil completo.

**Precondiciones:**
- El sistema debe tener definidos los parámetros críticos (ej. 3 faltas consecutivas o promedio menor a 6).

**Flujo Principal (Escenario de Éxito):**
1. El docente ingresa al módulo "Alumnos en riesgo".
2. El sistema escanea la base de datos y enlista a los estudiantes que cumplen los criterios de riesgo.
3. El sistema muestra junto al nombre del alumno el motivo principal (ej. "Riesgo por Inasistencias" o "Baja Participación").
4. El docente hace clic sobre el nombre del alumno.
5. El sistema despliega una ficha con los datos completos del estudiante y su historial académico detallado para analizar el caso.

**Flujos Alternativos (Excepciones y Errores):**
- **Paso 2a (Sin riesgos detectados):** El sistema informa que el grupo mantiene un rendimiento estable y oculta la tabla de alertas.

**Postcondiciones:**
- El docente cuenta con información focalizada para tomar decisiones de apoyo o tutoría.

---

#### Caso de Uso 32: Registro de tutoría o acuerdos

**ID:** CU-RIESGO-28  
**Actor Principal:** Docente  
**Descripción:** Permite al docente documentar las acciones tomadas respecto a un alumno en riesgo, como una plática de tutoría, un citatorio a padres o un acuerdo de recuperación, dejando evidencia del seguimiento.

**Precondiciones:**
- El alumno debe aparecer en la lista de riesgo del sistema.

**Flujo Principal (Escenario de Éxito):**
1. El docente ingresa a "Alumnos en riesgo" y selecciona el perfil de un estudiante.
2. El docente hace clic en "Agregar nota de seguimiento".
3. El sistema despliega un formulario solicitando fecha, tipo de acción (Tutoría, Citatorio, Tarea extra) y detalles del acuerdo.
4. El docente llena los datos y guarda el registro.
5. El sistema anexa esta nota al expediente interno del alumno.

**Flujos Alternativos (Excepciones y Errores):**
- **Paso 3a (Cancelación de nota):** Si el docente decide cancelar la redacción de la nota, el sistema descarta los cambios sin guardar nada en la base de datos.

**Postcondiciones:**
- Existe un respaldo formal del esfuerzo del docente por ayudar al estudiante a mejorar su rendimiento.

---

### Módulo 11: Archivos

---

#### Caso de Uso 33: Carga y clasificación de material didáctico

**ID:** CU-ARCHIVOS-01  
**Actor Principal:** Docente  
**Descripción:** Permite subir documentos al sistema clasificándolos por tipo (examen, planeación, proyecto) y añadiendo etiquetas para facilitar su búsqueda posterior, incluso mediante inteligencia artificial.

**Precondiciones:**
- El docente debe contar con el archivo localmente.

**Flujo Principal (Escenario de Éxito):**
1. El docente accede al módulo de "Archivos" y selecciona "Subir documento".
2. El sistema solicita el archivo, una breve descripción, el tipo de clasificación (menú desplegable) y etiquetas clave (tags).
3. El docente completa los campos y confirma la subida.
4. El sistema almacena el archivo y lo indexa usando las etiquetas y la clasificación proporcionadas.

**Flujos Alternativos (Excepciones y Errores):**
- **Paso 2a (Campos vacíos):** Si el docente omite el tipo de clasificación o las etiquetas, el sistema advierte que estos campos son obligatorios para mantener el orden del repositorio.

**Postcondiciones:**
- El archivo queda disponible en la nube del docente y rastreable para el motor de búsqueda.

---

#### Caso de Uso 34: Filtrado avanzado de material didáctico

**ID:** CU-ARCHIVOS-29  
**Actor Principal:** Docente  
**Descripción:** Permite localizar rápidamente documentos específicos en el repositorio mediante el uso de filtros cruzados por tipo de archivo, etiquetas, materia y fecha de subida.

**Precondiciones:**
- El sistema debe tener archivos previamente cargados y etiquetados.

**Flujo Principal (Escenario de Éxito):**
1. El docente accede al módulo de "Archivos".
2. El sistema muestra la barra de búsqueda avanzada.
3. El docente selecciona los filtros deseados (ej. Tipo: "Examen", Etiqueta: "Historia").
4. El sistema procesa la consulta y oculta los archivos que no coinciden.
5. El sistema muestra únicamente los documentos exactos que cumplen con los criterios.

**Flujos Alternativos (Excepciones y Errores):**
- **Paso 4a (Sin resultados):** Si ningún archivo coincide con los filtros aplicados, el sistema muestra un mensaje indicando que no hay coincidencias y sugiere limpiar los filtros.

**Postcondiciones:**
- El docente encuentra el material necesario sin perder tiempo buscando carpeta por carpeta.

---

### Módulo 12: Inteligencia artificial

---

#### Caso de Uso 35: Asistente analítico del grupo y recomendaciones

**ID:** CU-IA-01  
**Actor Principal:** Docente  
**Descripción:** El sistema de IA analiza la base de datos para responder consultas en lenguaje natural sobre el rendimiento del grupo, buscar archivos y generar recomendaciones pedagógicas automáticas.

**Precondiciones:**
- El docente debe tener información suficiente registrada en los módulos de calificaciones, asistencia y participación.

**Flujo Principal (Escenario de Éxito):**
1. El docente ingresa al módulo de "Inteligencia artificial".
2. El docente ingresa una consulta en el chat (ej. "¿Qué alumnos necesitan apoyo?" o "¿Cuál fue el tema con peor desempeño?").
3. El sistema procesa la consulta, cruza los datos de inasistencias, calificaciones y participaciones.
4. El sistema devuelve una respuesta detallada con los nombres de los alumnos afectados y el análisis de la situación.
5. El sistema propone recomendaciones automáticas (ej. "Se sugiere conversar con el estudiante X" o "Reforzar el tema Y").

**Flujos Alternativos (Excepciones y Errores):**
- **Paso 2a (Búsqueda de archivos):** Si la consulta del docente es sobre material didáctico, la IA filtra los documentos subidos en el Módulo 11 basándose en las descripciones y etiquetas, devolviendo el enlace directo al archivo.

**Postcondiciones:**
- El docente recibe información digerida y procesada para optimizar su estrategia de enseñanza.

---

#### Caso de Uso 36: Generación de reactivos basados en documentos

**ID:** CU-IA-30  
**Actor Principal:** Docente  
**Descripción:** Permite al docente seleccionar un archivo PDF o documento de texto previamente subido al sistema para que la Inteligencia artificial lo lea y genere automáticamente preguntas de examen basadas estrictamente en ese contenido.

**Precondiciones:**
- El docente debe haber subido el material de lectura al Módulo 11 (Archivos).

**Flujo Principal (Escenario de Éxito):**
1. El docente ingresa al módulo de "Inteligencia artificial" y selecciona la opción "Generar examen desde archivo".
2. El sistema abre el explorador interno de archivos.
3. El docente selecciona un documento y especifica la cantidad y tipo de preguntas (ej. 10 de opción múltiple).
4. El sistema envía el texto del documento a la IA.
5. La IA procesa la información y devuelve el cuestionario estructurado junto con la hoja de respuestas.
6. El docente guarda el resultado como un nuevo archivo.

**Flujos Alternativos (Excepciones y Errores):**
- **Paso 4a (Archivo no soportado para lectura):** Si el docente selecciona una imagen escaneada sin texto seleccionable o un formato no compatible, el sistema advierte que la IA no puede extraer el contenido y solicita un documento de texto válido.

**Postcondiciones:**
- El docente obtiene un examen listo para aplicar, ahorrando horas de redacción.

---

### Módulo 13: Resumen inteligente

---

#### Caso de Uso 37: Generación de reportes estadísticos y recomendaciones

**ID:** CU-RESUMEN-01  
**Actor Principal:** Docente  
**Descripción:** Muestra estadísticas en cada módulo de forma individual y genera un resumen general del grupo que incluye rendimiento, alumnos en riesgo y recomendaciones de mejora basadas en el sistema automatizado.

**Precondiciones:**
- El sistema debe tener datos procesados de todos los módulos anteriores.

**Flujo Principal (Escenario de Éxito):**
1. El docente accede al panel de "Resumen Inteligente" de un grupo específico.
2. El sistema recopila las métricas de asistencia, participación y calificaciones del periodo.
3. El sistema genera una vista principal (Dashboard) que muestra el rendimiento general del grupo mediante gráficas.
4. El sistema anexa en el resumen la lista de alumnos en riesgo.
5. El sistema incluye un bloque de recomendaciones automáticas generadas por el módulo de IA.
6. El docente selecciona la opción de visualizar el detalle por módulo o exportar el reporte general.

**Flujos Alternativos (Excepciones y Errores):**
- **Paso 3a (Datos insuficientes):** Si el ciclo escolar acaba de iniciar, el sistema muestra la estructura del reporte con un aviso indicando que se requiere más tiempo de registro para generar estadísticas precisas y recomendaciones.

**Postcondiciones:**
- El docente obtiene un panorama completo e imprimible del estado actual de su grupo.

---

#### Caso de Uso 38: Envío automatizado de reportes al estudiante

**ID:** CU-RESUMEN-31  
**Actor Principal:** Docente  
**Descripción:** Permite al docente enviar el reporte integral de desempeño generado por el sistema directamente al correo electrónico del alumno o tutor, facilitando la comunicación sobre su rendimiento.

**Precondiciones:**
- El perfil del alumno en la base de datos debe tener un correo electrónico válido registrado.
- El reporte integral debe haberse generado previamente.

**Flujo Principal (Escenario de Éxito):**
1. El docente visualiza el "Resumen inteligente" individual de un estudiante.
2. El docente hace clic en la opción "Enviar reporte por correo".
3. El sistema adjunta el archivo en PDF y genera un mensaje predeterminado.
4. El docente confirma el envío.
5. El sistema utiliza el servidor de correo integrado para despachar el mensaje.
6. El sistema notifica al docente que el correo fue enviado correctamente y registra la acción en el expediente del alumno.

**Flujos Alternativos (Excepciones y Errores):**
- **Paso 3a (Correo faltante):** Si el alumno no tiene un correo registrado en el sistema, la opción de envío se desactiva y el sistema sugiere exportar el documento para entregarlo físicamente.

**Postcondiciones:**
- El estudiante recibe la retroalimentación de su desempeño de forma digital e inmediata.