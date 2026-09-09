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