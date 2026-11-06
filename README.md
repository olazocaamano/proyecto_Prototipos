<div align="center">

# Sistema Inteligente

**Plataforma integral de gestión académica *con inteligencia artificial* para docentes**

Prototipo desarrollado para el Concurso de Prototipos de la DGETI, etapa local
CBTIS No.47 - José Joaquín Antonio Florencio de Herrera y Ricardos

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=dart&logoColor=white)
![PHP](https://img.shields.io/badge/PHP-777BB4?style=flat-square&logo=php&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white)
![Aiven](https://img.shields.io/badge/Aiven-FF3554?style=flat-square&logo=aiven&logoColor=white)
![Estado](https://img.shields.io/badge/estado-prototipo-yellow?style=flat-square)

</div>

---

## Tabla de contenido

- [Sistema Inteligente](#sistema-inteligente)
  - [Tabla de contenido](#tabla-de-contenido)
  - [Datos del prototipo](#datos-del-prototipo)
  - [Descripción general](#descripción-general)
  - [Problemática](#problemática)
  - [Solución propuesta](#solución-propuesta)
  - [Objetivos](#objetivos)
  - [Módulos del sistema](#módulos-del-sistema)
  - [Vista previa](#vista-previa)
  - [Arquitectura y tecnologías](#arquitectura-y-tecnologías)
  - [Requisitos previos](#requisitos-previos)
  - [Instalación](#instalación)
  - [Ejecución](#ejecución)
  - [Estructura del proyecto](#estructura-del-proyecto)
  - [Trabajo a futuro](#trabajo-a-futuro)
  - [Equipo de desarrollo](#equipo-de-desarrollo)
  - [Licencia](#licencia)

---

## Datos del prototipo

| Campo | Información |
|:---|:---|
| Nombre del prototipo | Sistema Inteligente |
| Evento | Concurso de Prototipos DGETI - Etapa local |
| Plantel | CBTIS No. 47 |
| Categoría | Software |
| Especialidad / Carrera | Programación |
| Asesor | *Por definir* |
| Ciclo escolar | 2026-2027 |

## Descripción general

**Sistema Inteligente** es una aplicación que centraliza en un solo lugar las tareas de seguimiento académico de un docente: grupos, listas de alumnos, asistencia, participaciones, calificaciones, horarios y archivos. A partir de esa información, el sistema genera estadísticas, detecta de forma automática a los alumnos en riesgo académico y, mediante inteligencia artificial, ofrece resúmenes y recomendaciones para apoyar la toma de decisiones del profesor.

Cada docente cuenta con una cuenta personal y solo tiene acceso a sus propios grupos y datos.

## Problemática

Los docentes llevan el control de sus grupos con herramientas dispersas: listas en papel, hojas de cálculo, cuadernos y archivos sueltos. Esto provoca que:

- El registro de asistencia, participaciones y calificaciones consuma tiempo que podría dedicarse a la enseñanza.
- La información esté fragmentada y sea difícil de consultar o de relacionar entre sí.
- Los promedios se calculen de forma manual, con riesgo de errores.
- Los alumnos con bajo rendimiento, faltas frecuentes o poca participación se detecten tarde, cuando ya es difícil intervenir.
- Los documentos de cada materia (exámenes, planeaciones, proyectos) no estén organizados y sean complicados de localizar.

> Recomendación: Por lo regular, los docentes imparten clases a múltiples grupos, llegando a atender a cientos de alumnos.

## Solución propuesta

El prototipo integra en una sola plataforma todos los registros que el docente necesita y los conecta entre sí: la asistencia y las participaciones se vinculan automáticamente con las calificaciones, y el sistema calcula promedios según los criterios y porcentajes que el propio profesor define.

Con la información capturada, el sistema:

- Genera estadísticas individuales y grupales en cada módulo.
- Identifica automáticamente a los alumnos en riesgo, indicando el motivo (faltas, calificaciones o participación).
- Incorpora un asistente de inteligencia artificial que responde preguntas sobre el grupo, genera resúmenes y propone recomendaciones.
- Mantiene los archivos de cada grupo clasificados y con etiquetas para localizarlos fácilmente.

## Objetivos

**Objetivo general**

Desarrollar una herramienta digital que centralice y automatice el seguimiento académico de los grupos de un docente, apoyándose en inteligencia artificial para detectar oportunamente a los alumnos que requieren apoyo.

**Objetivos específicos**

- Permitir al docente registrar asistencia, participaciones y calificaciones de forma rápida y organizada.
- Calcular automáticamente promedios y estadísticas individuales y grupales.
- Detectar de forma automática a los alumnos en riesgo académico y mostrar el motivo.
- Ofrecer resúmenes y recomendaciones generadas con inteligencia artificial.
- Resguardar la información de cada docente de manera segura en una base de datos en la nube.

## Módulos del sistema

| Módulo | Descripción |
|:---|:---|
| Inicio de sesión | Cada docente tiene una cuenta personal (usuario, correo y contraseña) con recuperación de contraseña y medidas básicas de seguridad. Solo puede acceder a sus propios grupos. |
| Panel principal | Muestra los grupos creados, accesos rápidos, recordatorios y un resumen con estadísticas clave, como alumnos en riesgo o tareas pendientes. |
| Grupos | Permite crear y eliminar grupos con datos opcionales: escuela, materia, grupo, grado o semestre, turno, carrera o especialidad y ciclo escolar. Cada grupo es independiente y almacena alumnos, asistencias, calificaciones, participaciones y archivos. |
| Lista de alumnos | Alta manual de alumnos con número de lista generado automáticamente. Permite ordenar por apellidos o por nombre y crear equipos. |
| Alumnos | Ficha individual con datos básicos, historial de asistencias, participaciones, calificaciones y observaciones. Incluye búsqueda, edición y consulta de progreso. |
| Horarios | Cuadrícula semanal de lunes a viernes donde se asignan horas y aulas por bloque. |
| Asistencia | Pase de lista diario que muestra primero la fecha actual, con historial completo y estadísticas individuales y grupales. Se enlaza automáticamente con calificaciones. |
| Participaciones | Registro diario con valores numéricos por alumno y estadísticas individuales y grupales. Se enlaza automáticamente con calificaciones. |
| Calificaciones | El docente define sus criterios de evaluación y el porcentaje de cada uno. Asistencias y participaciones están disponibles como atajos. Calcula promedios y muestra el rendimiento individual y grupal. |
| Alumnos en riesgo | Detección automática basada en faltas, calificaciones y participación. Muestra el motivo y, al seleccionar al alumno, sus datos completos. |
| Archivos | Carga de documentos clasificados por tipo (examen, planeación, proyecto, etc.), con descripción y etiquetas para facilitar la búsqueda. |
| Inteligencia artificial | Analiza la información registrada para detectar bajo rendimiento, poca participación e inasistencias frecuentes. Busca archivos, responde preguntas como "¿Qué alumnos necesitan apoyo?" o "¿Cuál fue el tema con peor desempeño?", propone recomendaciones y resuelve dudas académicas. |
| Resumen inteligente | Cada módulo cuenta con su resumen y estadísticas del alumno y del grupo. Además, el sistema genera un resumen general con rendimiento, alumnos en riesgo y recomendaciones automáticas. |

## Vista previa

| Panel principal | Asistencia | Alumnos en riesgo |
|:---:|:---:|:---:|
| ![Panel](docs/img/panel.png) | ![Asistencia](docs/img/asistencia.png) | ![Riesgo](docs/img/riesgo.png) |

## Arquitectura y tecnologías

El sistema sigue una arquitectura cliente-servidor: la aplicación Flutter se comunica con scripts PHP, que consultan y modifican la base de datos alojada en Aiven.

```
Aplicación Flutter  -->  Backend PHP  -->  MySQL (Aiven)
     (cliente)            (API)            (base de datos)
```

| Capa | Tecnología | Función |
|:---|:---|:---|
| Frontend | Flutter / Dart | Interfaz de usuario |
| Backend | PHP | Lógica de negocio y acceso a datos |
| Base de datos | MySQL en Aiven | Almacenamiento en la nube |
| Administración | MySQL Workbench | Diseño, consulta y gestión de la base de datos |
| Inteligencia artificial | [Servicio o API utilizada] | Análisis, resúmenes y recomendaciones |

## Requisitos previos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) versión [3.12.2] o superior
- [PHP](https://www.php.net/downloads) versión [8.2.x] o superior
- Windows PowerShell
- [MySQL Workbench](https://www.mysql.com/products/workbench/)
- Servicio MySQL activo en [Aiven](https://aiven.io)

## Instalación

**1. Clonar el repositorio**

```bash
git clone https://github.com/olazocaamano/proyecto_Prototipos.git
cd proyecto_Prototipos
```

**2. Instalar las dependencias de Flutter**

```bash
flutter pub get
```

**3. Configurar las variables de entorno**

Copie el archivo de ejemplo y complete los datos de conexión proporcionados por Aiven:

```bash
copy .env.example .env
```

```env
DB_HOST=tu-servicio.aivencloud.com
DB_PORT=12345
DB_NAME=nombre_base_datos
DB_USER=usuario
DB_PASSWORD=contraseña
```

> **Importante:** el archivo `.env` contiene credenciales y no debe subirse al repositorio. Verifique que esté incluido en el archivo `.gitignore`.

**4. Preparar la base de datos**

1. Abra MySQL Workbench y cree una conexión con los datos de su servicio en Aiven.
2. Importe el script `database/schema.sql` para crear las tablas necesarias.

<details>
<summary>Conexión de MySQL Workbench con Aiven</summary>

<br>

1. En el panel del servicio en Aiven, copie el host, puerto, usuario y contraseña.
2. Descargue el certificado CA desde el mismo panel.
3. En Workbench, cree una nueva conexión y, en la pestaña SSL, seleccione el archivo del certificado.
4. Utilice la opción *Test Connection* para verificar la conexión.

</details>

## Ejecución

Desde la raíz del proyecto, abra PowerShell y ejecute:

```powershell
.\run_app.ps1
```

Este script [explicar qué hace: inicia el servidor PHP y lanza la aplicación Flutter].

<details>
<summary>Solución a error de permisos en PowerShell</summary>

<br>

Si Windows bloquea la ejecución del script, habilite los scripts locales para su usuario con:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

</details>

## Estructura del proyecto

```
tu-repositorio/
|-- lib/             Código fuente de Flutter
|-- backend/         Scripts PHP (API y conexión a la base de datos)
|-- docs/            Documentación (DiagramaER, Diccionario de datos etc...)
|-- run_app.ps1      Script de ejecución del proyecto
`-- README.md
```

## Trabajo a futuro

Estado de los módulos (marque con `x` los terminados):

- [x] Inicio de sesión
- [x] Registro
- [ ] Recuperación de contraseña
- [ ] Panel principal
- [ ] Grupos, lista de alumnos y fichas de alumnos
- [ ] Horarios
- [ ] Asistencia y participaciones
- [ ] Calificaciones
- [ ] Alumnos en riesgo
- [ ] Archivos
- [ ] Inteligencia artificial y resúmenes inteligentes

## Equipo de desarrollo

| Nombre | Rol | Contacto |
|:---|:---|:---|
| Mónica Ramirez Perez | Desarrollador | [correo] |
| Emmanuel Olazo Caamaño | Desarrollador | [correo] |

**Asesor:** *Pendiente*

## Licencia

Proyecto desarrollado con fines académicos para el Concurso de Prototipos de la DGETI. Consulte el archivo `LICENSE` para más información.

---

<div align="center">

CBTIS No.47 - Centro de Bachillerato Tecnologico Industrial y de Servicios No.47 | Dirección General de Educación Tecnológica Industrial

</div>
