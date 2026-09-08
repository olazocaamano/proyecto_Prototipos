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

#### Caso de Uso 01: Registro de asistencia diaria

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

### Módulo 8: Participaciones

---

#### Caso de Uso 01: Registro de participaciones con valor numérico

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

### Módulo 9: Calificaciones

---

#### Caso de Uso 01: Configuración de criterios y cálculo automático

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
- **Paso 4a (Porcentaje inválido):** Si la suma de los criterios es menor o mayor a 100%, el sistema bloquea el guardado y resalta en rojo el total para solicitar la corrección.

**Postcondiciones:**
- El promedio del alumno queda calculado y disponible para detectar si entra en estado de riesgo.

---

### Módulo 10: Alumnos en riesgo

---

#### Caso de Uso 01: Detección automática de riesgo académico

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

### Módulo 11: Archivos

---

#### Caso de Uso 01: Carga y clasificación de material didáctico

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

### Módulo 12: Inteligencia artificial

---

#### Caso de Uso 01: Asistente analítico del grupo y recomendaciones

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

### Módulo 13: Resumen inteligente

---

#### Caso de Uso 01: Generación de reportes estadísticos y recomendaciones

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