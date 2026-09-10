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

| Campo | Tipo | Restricción | Descripción |
| :---- | :--- | :---------- | :---------- |
|       |      |             |             |
|       |      |             |             |
|       |      |             |             |

### Tabla: PARTICIPACIONES (Módulo 8: Participaciones)
Almacena los valores numéricos asignados por participación en clase.

| Campo | Tipo | Restricción | Descripción |
| :---- | :--- | :---------- | :---------- |
|       |      |             |             |
|       |      |             |             |
|       |      |             |             |

### Tabla: CRITERIOS_EVALUACION (Módulo 9: Calificaciones)
Almacena los rubros y porcentajes configurados por el docente para evaluar un periodo.

| Campo | Tipo | Restricción | Descripción |
| :---- | :--- | :---------- | :---------- |
|       |      |             |             |
|       |      |             |             |
|       |      |             |             |

### Tabla: CALIFICACIONES (Módulo 9: Calificaciones)
Almacena las notas específicas asignadas a cada alumno según los criterios.

| Campo | Tipo | Restricción | Descripción |
| :---- | :--- | :---------- | :---------- |
|       |      |             |             |
|       |      |             |             |
|       |      |             |             |

### Tabla: ALERTAS_RIESGO (Módulo 10: Alumnos en riesgo)
Almacena el historial de notificaciones, acuerdos y tutorías de estudiantes detectados.

| Campo | Tipo | Restricción | Descripción |
| :---- | :--- | :---------- | :---------- |
|       |      |             |             |
|       |      |             |             |
|       |      |             |             |

### Tabla: ARCHIVOS (Módulo 11: Archivos)
Almacena los metadatos, etiquetas y rutas de los documentos subidos por el docente.

| Campo | Tipo | Restricción | Descripción |
| :---- | :--- | :---------- | :---------- |
|       |      |             |             |
|       |      |             |             |
|       |      |             |             |

### Tabla: HISTORIAL_IA (Módulo 12: Inteligencia artificial)
Almacena los registros de consultas hechas al asistente o reactivos generados.

| Campo | Tipo | Restricción | Descripción |
| :---- | :--- | :---------- | :---------- |
|       |      |             |             |
|       |      |             |             |
|       |      |             |             |