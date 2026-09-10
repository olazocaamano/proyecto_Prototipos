# Diccionario de datos - *Nombre del programa*

Este documento describe la estructura, los tipos de datos, y las restriciones de la base de datos en MySQL

---

## Parte 1: Asignado a Mónica

### Tabla: DOCENTES (Módulo 1: Inicio de sesión)
Almacena los datos de las cuentas de los docentes.

| Campo    | Tipo        | Restricción        | Descripción                                        |
| :------- | :---------- | :----------------- | :------------------------------------------------- |
| id       | INT         | PK, Auto Increment | Identificador unico para cada usuario              |
| username | VARCHAR(50) | Not Null, Unique   | Nombre único para el inicio de sesión del sistema. |
|          |             |                    |                                                    |

### Tabla: GRUPOS (Módulo 3: Grupos)
Almacena la información general de los grupos creados por el docente.

| Campo | Tipo | Restricción | Descripción |
| :---- | :--- | :---------- | :---------- |
|       |      |             |             |
|       |      |             |             |
|       |      |             |             |

### Tabla: ALUMNOS (Módulo 5: Alumnos)
Almacena los datos personales de los estudiantes.

| Campo | Tipo | Restricción | Descripción |
| :---- | :--- | :---------- | :---------- |
|       |      |             |             |
|       |      |             |             |
|       |      |             |             |

### Tabla: ALUMNOS_GRUPOS (Módulo 4: Lista de alumnos)
Tabla intermedia para relacionar qué alumnos están inscritos en qué grupo.

| Campo | Tipo | Restricción | Descripción |
| :---- | :--- | :---------- | :---------- |
|       |      |             |             |
|       |      |             |             |
|       |      |             |             |

### Tabla: HORARIOS (Módulo 6: Horarios)
Almacena la configuración de días y horas de clase por grupo.

| Campo | Tipo | Restricción | Descripción |
| :---- | :--- | :---------- | :---------- |
|       |      |             |             |
|       |      |             |             |
|       |      |             |             |

---

## Parte 2: Asignado a Emmanuel

### Tabla: ASISTENCIAS (Módulo 7: Asistencia)
Almacena el registro diario del pase de lista por alumno.

| Campo                | Tipo         | Restricción        | Descripción                                                        |
| :------------------- | :----------- | :----------------- | :----------------------------------------------------------------- |
| id_attendance        | INT          | PK, Auto Increment | Identificador único del registro de asistencia.                    |
| id_student_group     | INT          | FK, Not Null       | Relación con el alumno específico dentro de un grupo.              |
| date                 | DATE         | Not Null           | Fecha exacta del registro de asistencia.                           |
| status               | ENUM         | Not Null           | Valores permitidos: 'Presente', 'Falta', 'Retardo', 'Justificado'. |
| justification_reason | VARCHAR(255) | Null               | Descripción opcional del motivo si el estado es 'Justificado'.     |

### Tabla: PARTICIPACIONES (Módulo 8: Participaciones)
Almacena los valores numéricos asignados por participación en clase.

| Campo            | Tipo         | Restricción        | Descripción                                                          |
| :--------------- | :----------- | :----------------- | :------------------------------------------------------------------- |
| id_participation | INT          | PK, Auto Increment | Identificador único del registro de participación.                   |
| id_student_group | INT          | FK, Not Null       | Relación con el alumno que participó.                                |
| date             | DATE         | Not Null           | Fecha en la que se otorgó la participación.                          |
| assigned_value   | DECIMAL(5,2) | Not Null           | Puntaje numérico asignado al alumno (puede ser positivo o negativo). |
| notes            | VARCHAR(255) | Null               | Comentario breve opcional sobre la participación.                    |

### Tabla: CRITERIOS_EVALUACION (Módulo 9: Calificaciones)
Almacena los rubros y porcentajes configurados por el docente para evaluar un periodo.

| Campo          | Tipo         | Restricción        | Descripción                                                              |
| :------------- | :----------- | :----------------- | :----------------------------------------------------------------------- |
| id_criterion   | INT          | PK, Auto Increment | Identificador único del criterio de evaluación.                          |
| id_group       | INT          | FK, Not Null       | Relación con el grupo al que pertenece este criterio.                    |
| criterion_name | VARCHAR(50)  | Not Null           | Nombre del rubro (Ej. Examen, Proyecto, Tareas).                         |
| percentage     | DECIMAL(5,2) | Not Null           | Peso de este criterio en la calificación final (Ej. 30.00).              |
| is_automatic   | BOOLEAN      | Default FALSE      | Indica si el criterio se calcula solo (como asistencia o participación). |

### Tabla: CALIFICACIONES (Módulo 9: Calificaciones)
Almacena las notas específicas asignadas a cada alumno según los criterios.

| Campo            | Tipo         | Restricción               | Descripción                                                |
| :--------------- | :----------- | :------------------------ | :--------------------------------------------------------- |
| id_grade         | INT          | PK, Auto Increment        | Identificador único del registro de calificación.          |
| id_student_group | INT          | FK, Not Null              | Relación con el alumno evaluado.                           |
| id_criterion     | INT          | FK, Not Null              | Relación con el criterio bajo el cual se está evaluando.   |
| obtained_grade   | DECIMAL(5,2) | Not Null                  | Nota numérica registrada por el docente para ese criterio. |
| created_at       | DATETIME     | Default CURRENT_TIMESTAMP | Fecha y hora exacta en la que se guardó la calificación.   |

### Tabla: ALERTAS_RIESGO (Módulo 10: Alumnos en riesgo)
Almacena el historial de notificaciones, acuerdos y tutorías de estudiantes detectados.

| Campo            | Tipo         | Restricción        | Descripción                                                         |
| :--------------- | :----------- | :----------------- | :------------------------------------------------------------------ |
| id_alert         | INT          | PK, Auto Increment | Identificador único del registro de alerta.                         |
| id_student_group | INT          | FK, Not Null       | Relación con el alumno detectado en riesgo.                         |
| main_reason      | VARCHAR(100) | Not Null           | Razón detectada (Ej. Inasistencias críticas, Bajas calificaciones). |
| detection_date   | DATE         | Not Null           | Fecha en la que el sistema o el docente generó la alerta.           |
| follow_up_note   | TEXT         | Null               | Registro textual sobre tutorías, citatorios o acuerdos logrados.    |
| alert_status     | ENUM         | Default 'Activa'   | Valores permitidos: 'Activa', 'Resuelta'.                           |

### Tabla: ARCHIVOS (Módulo 11: Archivos)
Almacena los metadatos, etiquetas y rutas de los documentos subidos por el docente.

| Campo         | Tipo         | Restricción               | Descripción                                                   |
| :------------ | :----------- | :------------------------ | :------------------------------------------------------------ |
| id_file       | INT          | PK, Auto Increment        | Identificador único del documento en la base de datos.        |
| id_teacher    | INT          | FK, Not Null              | Relación con el docente propietario del archivo.              |
| original_name | VARCHAR(150) | Not Null                  | Nombre del documento al momento de ser subido.                |
| document_type | VARCHAR(50)  | Not Null                  | Clasificación seleccionada (Ej. Planeación, Examen, Lectura). |
| tags          | VARCHAR(255) | Null                      | Palabras clave separadas por comas para búsqueda cruzada.     |
| server_path   | VARCHAR(255) | Not Null                  | Ubicación física o URL donde está guardado el archivo.        |
| upload_date   | DATETIME     | Default CURRENT_TIMESTAMP | Fecha y hora en la que se cargó el archivo al sistema.        |

### Tabla: HISTORIAL_IA (Módulo 12: Inteligencia artificial)
Almacena los registros de consultas hechas al asistente o reactivos generados.

| Campo              | Tipo     | Restricción               | Descripción                                                                |
| :----------------- | :------- | :------------------------ | :------------------------------------------------------------------------- |
| id_ai_query        | INT      | PK, Auto Increment        | Identificador único de la interacción con el modelo de IA.                 |
| id_teacher         | INT      | FK, Not Null              | Relación con el docente que ejecutó la consulta.                           |
| request_prompt     | TEXT     | Not Null                  | Texto o instrucción ingresada por el docente (la pregunta).                |
| generated_response | TEXT     | Not Null                  | El resultado en texto devuelto por el servicio de Inteligencia Artificial. |
| query_date         | DATETIME | Default CURRENT_TIMESTAMP | Momento exacto de la interacción.                                          |