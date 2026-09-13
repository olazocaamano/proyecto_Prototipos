# Diccionario de datos - *Nombre del programa*

Este documento describe la estructura, los tipos de datos, y las restriciones de la base de datos en MySQL

---

## Parte 1: Asignado a Mónica

### Tabla: DOCENTES (Módulo 1: Inicio de sesión)
Almacena los datos de las cuentas de los docentes y las credenciales necesarias para acceder al sistema.

| Campo      | Tipo        | Restricción        | Descripción                                               |
| :--------- | :---------- | :----------------- | :-------------------------------------------------------- |
| id         | INT         | PK, Auto Increment | Identificador único para cada docente.                    |
| username   | VARCHAR(50) | Not Null, Unique   | Nombre único utilizado para iniciar sesión en el sistema. |
| email      | VARCHAR(150)| Not Null, Unique   | Correo electrónico del docente utilizado para  iniciar    |
|            |             |                    | sesión y recuperar la contraseña.                         |
| password   | VARCHAR(255)| Not Null           | Contraseña del docente almacenada de forma segura mediante|
|            |             |                    | un hash.                                                  |
| first_name | VARCHAR(100)| Not Null           | Nombre de docente.                                        |
| last_name  | VARCHAR(100)| Not Null           | Apellidos de docente.                                     |

### Tabla: GRUPOS (Módulo 3: Grupos)
Almacena la información general de los grupos creados por el docente, incluyendo la materia, grado, turno, carrera o especialidad y ciclo escolar al que pertenecen.

| Campo            | Tipo         | Restricción        | Descripción                                                             |
| :--------------- | :----------- | :----------------- | :---------------------------------------------------------------------- |
| id               | INT          | PK, Auto Increment | Identificador único para cada grupo.                                    |
| teacher_id       | INT          | FK, Not Null       | Identificador del docente que creó y administra el grupo.               |
| school           | VARCHAR(150) | Null               | Nombre de la escuela a la que pertenece el grupo.                       |
| subject          | VARCHAR(100) | Null               | Materia que imparte el docente al grupo.                                |
| group_name       | VARCHAR(20)  | Null               | Nombre o identificador del grupo.                                       |
| grade_semester   | VARCHAR(30)  | Null               | Grado o semestre al que pertenece el grupo.                             |
| shift            | VARCHAR(30)  | Null               | Turno en el que se imparte la materia.                                  |
| career_specialty | VARCHAR(150) | Null               | Carrera o especialidad a la que pertenece el grupo, cuando corresponda. |
| school_year      | VARCHAR(20)  | Null               | Ciclo escolar al que pertenece el grupo.                                |

### Tabla: ALUMNOS (Módulo 5: Alumnos)
Almacena los datos personales básicos de los estudiantes registrados en el sistema.

| Campo      | Tipo         | Restricción        | Descripción                                                    |
| :--------- | :----------- | :----------------- | :------------------------------------------------------------- |
| id         | INT          | PK, Auto Increment | Identificador único para cada alumno.                          |
| first_name | VARCHAR(100) | Not Null           | Nombre del alumno.                                             |
| last_name  | VARCHAR(100) | Not Null           | Apellidos del alumno.                                          |
| email      | VARCHAR(150) | Null               | Correo electrónico del alumno, cuando se encuentre disponible. |

### Tabla: ALUMNOS_GRUPOS (Módulo 4: Lista de alumnos)
Tabla intermedia para relacionar qué alumnos están inscritos en qué grupo.

| Campo       | Tipo | Restricción        | Descripción                                                    |
| :---------- | :--- | :----------------- | :------------------------------------------------------------- |
| id          | INT  | PK, Auto Increment | Identificador único de la relación entre el alumno y el grupo. |
| student_id  | INT  | FK, Not Null       | Identificador del alumno registrado en el grupo.               |
| group_id    | INT  | FK, Not Null       | Identificador del grupo al que pertenece el alumno.            |
| list_number | INT  | Not Null           | Número de lista asignado al alumno dentro del grupo.           |

### Tabla: HORARIOS (Módulo 6: Horarios)
Almacena la configuración de los días, horas y aulas en las que se imparten las clases de cada grupo.

| Campo       | Tipo        | Restricción        | Descripción                                                             |
| :---------- | :---------- | :----------------- | :---------------------------------------------------------------------- |
| id          | INT         | PK, Auto Increment | Identificador único para cada horario.                                  |
| group_id    | INT         | FK, Not Null       | Identificador del grupo al que pertenece el horario.                    |
| day_of_week | VARCHAR(15) | Not Null           | Día de la semana en el que se imparte la clase.                         |
| start_time  | TIME        | Not Null           | Hora de inicio de la clase.                                             |
| end_time    | TIME        | Not Null           | Hora de finalización de la clase.                                       |
| room        | VARCHAR(50) | Null               | Aula o salón donde se imparte la clase, cuando se encuentre disponible. |

---

## Parte 2: Asignado a Emmanuel

### Tabla: ASISTENCIAS (Módulo 7: Asistencia)
Almacena el registro diario del pase de lista por alumno.

| Campo                | Tipo         | Restricción        | Descripción                                                        |
| :------------------- | :----------- | :----------------- | :----------------------------------------------------------------- |
| id_attendance        | INT          | PK, Auto Increment | Identificador único del registro de asistencia.                    |
| student_group_id     | INT          | FK, Not Null       | Relación con el alumno específico dentro de un grupo.              |
| date                 | DATE         | Not Null           | Fecha exacta del registro de asistencia.                           |
| status               | ENUM         | Not Null           | Valores permitidos: 'Presente', 'Falta', 'Retardo', 'Justificado'. |
| justification_reason | VARCHAR(255) | Null               | Descripción opcional del motivo si el estado es 'Justificado'.     |

### Tabla: PARTICIPACIONES (Módulo 8: Participaciones)
Almacena los valores numéricos asignados por participación en clase.

| Campo            | Tipo         | Restricción        | Descripción                                                          |
| :--------------- | :----------- | :----------------- | :------------------------------------------------------------------- |
| id_participation | INT          | PK, Auto Increment | Identificador único del registro de participación.                   |
| student_group_id | INT          | FK, Not Null       | Relación con el alumno que participó.                                |
| date             | DATE         | Not Null           | Fecha en la que se otorgó la participación.                          |
| assigned_value   | DECIMAL(5,2) | Not Null           | Puntaje numérico asignado al alumno (puede ser positivo o negativo). |
| notes            | VARCHAR(255) | Null               | Comentario breve opcional sobre la participación.                    |

### Tabla: CRITERIOS_EVALUACION (Módulo 9: Calificaciones)
Almacena los rubros y porcentajes configurados por el docente para evaluar un periodo.

| Campo          | Tipo         | Restricción        | Descripción                                                              |
| :------------- | :----------- | :----------------- | :----------------------------------------------------------------------- |
| id_criterion   | INT          | PK, Auto Increment | Identificador único del criterio de evaluación.                          |
| group_id       | INT          | FK, Not Null       | Relación con el grupo al que pertenece este criterio.                    |
| criterion_name | VARCHAR(50)  | Not Null           | Nombre del rubro (Ej. Examen, Proyecto, Tareas).                         |
| percentage     | DECIMAL(5,2) | Not Null           | Peso de este criterio en la calificación final (Ej. 30.00).              |
| is_automatic   | BOOLEAN      | Default FALSE      | Indica si el criterio se calcula solo (como asistencia o participación). |

### Tabla: CALIFICACIONES (Módulo 9: Calificaciones)
Almacena las notas específicas asignadas a cada alumno según los criterios.

| Campo            | Tipo         | Restricción               | Descripción                                                |
| :--------------- | :----------- | :------------------------ | :--------------------------------------------------------- |
| id_grade         | INT          | PK, Auto Increment        | Identificador único del registro de calificación.          |
| student_group_id | INT          | FK, Not Null              | Relación con el alumno evaluado.                           |
| id_criterion     | INT          | FK, Not Null              | Relación con el criterio bajo el cual se está evaluando.   |
| obtained_grade   | DECIMAL(5,2) | Not Null                  | Nota numérica registrada por el docente para ese criterio. |
| created_at       | DATETIME     | Default CURRENT_TIMESTAMP | Fecha y hora exacta en la que se guardó la calificación.   |

### Tabla: ALERTAS_RIESGO (Módulo 10: Alumnos en riesgo)
Almacena el historial de notificaciones, acuerdos y tutorías de estudiantes detectados.

| Campo            | Tipo         | Restricción        | Descripción                                                         |
| :--------------- | :----------- | :----------------- | :------------------------------------------------------------------ |
| id_alert         | INT          | PK, Auto Increment | Identificador único del registro de alerta.                         |
| student_group_id | INT          | FK, Not Null       | Relación con el alumno detectado en riesgo.                         |
| main_reason      | VARCHAR(100) | Not Null           | Razón detectada (Ej. Inasistencias críticas, Bajas calificaciones). |
| detection_date   | DATE         | Not Null           | Fecha en la que el sistema o el docente generó la alerta.           |
| follow_up_note   | TEXT         | Null               | Registro textual sobre tutorías, citatorios o acuerdos logrados.    |
| alert_status     | ENUM         | Default 'Activa'   | Valores permitidos: 'Activa', 'Resuelta'.                           |

### Tabla: ARCHIVOS (Módulo 11: Archivos)
Almacena los metadatos, etiquetas y rutas de los documentos subidos por el docente.

| Campo         | Tipo         | Restricción               | Descripción                                                   |
| :------------ | :----------- | :------------------------ | :------------------------------------------------------------ |
| id_file       | INT          | PK, Auto Increment        | Identificador único del documento en la base de datos.        |
| teacher_id    | INT          | FK, Not Null              | Relación con el docente propietario del archivo.              |
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
| teacher_id         | INT      | FK, Not Null              | Relación con el docente que ejecutó la consulta.                           |
| request_prompt     | TEXT     | Not Null                  | Texto o instrucción ingresada por el docente (la pregunta).                |
| generated_response | TEXT     | Not Null                  | El resultado en texto devuelto por el servicio de Inteligencia Artificial. |
| query_date         | DATETIME | Default CURRENT_TIMESTAMP | Momento exacto de la interacción.                                          |