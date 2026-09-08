# Documento de Casos de Uso

## Actores del Sistema
- **Docente:** (Añadir aquí una breve descripción de los permisos de este actor)

---

## Parte 1: Mónica

### Módulo 1: Inicio de sesión

### CU-01: Registrar cuenta

**Actor:** Docente

**Objetivo:**
Permitir que el docente cree una cuenta personal para acceder al sistema.

**Precondiciones:**

* El docente no debe tener una cuenta registrada con el mismo usuario o correo electrónico.
* El docente debe de llenar todos los campos.

**Flujo principal:**

1. El docente selecciona la opción **"Registrarse"**.
2. El sistema muestra el formulario de registro.
3. El docente ingresa su usuario.
4. El docente ingresa su correo electrónico.
5. El docente crea una contraseña.
6. El docente confirma el registro.
7. El sistema valida la información ingresada.
8. El sistema verifica que el usuario y correo electrónico no estén registrados previamente.
9. El sistema crea la cuenta del docente.
10. El sistema informa que el registro se realizó correctamente.

**Flujos alternativos:**

* Si el usuario ya está registrado, el sistema informa al docente y solicita ingresar otro usuario.
* Si el correo electrónico ya está registrado, el sistema informa al docente y solicita utilizar otro correo.
* Si algún campo obligatorio está vacío, el sistema solicita completar la información.
* Si la contraseña no cumple con los requisitos de seguridad establecidos, el sistema solicita crear una contraseña válida.
* Si ocurre un error durante el registro, el sistema informa que la cuenta no pudo ser creada.

**Postcondición:**

* La cuenta del docente queda registrada en el sistema.
* La información queda asociada al perfil del docente.
* El docente puede utilizar sus credenciales para iniciar sesión.

### CU-02: Iniciar sesión

**Actor:** Docente

**Objetivo:**
Permitir que el docente acceda a su cuenta y a la información asociada a sus grupos.

**Precondiciones:**

* El docente debe tener una cuenta registrada.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente selecciona la opción **"Iniciar sesión"**.
2. El sistema muestra el formulario de inicio de sesión.
3. El docente ingresa su usuario o correo electrónico.
4. El docente ingresa su contraseña.
5. El docente confirma el inicio de sesión.
6. El sistema verifica las credenciales proporcionadas.
7. El sistema identifica la cuenta correspondiente.
8. El sistema permite el acceso al perfil del docente.
9. El sistema muestra el panel principal.

**Flujos alternativos:**

* Si el usuario o correo electrónico no existe, el sistema informa que las credenciales son incorrectas.
* Si la contraseña es incorrecta, el sistema informa que las credenciales son incorrectas.
* Si algún campo está vacío, el sistema solicita completar la información.
* Si ocurre un error durante la autenticación, el sistema informa que no fue posible iniciar sesión.

**Postcondición:**

* El docente queda autenticado en el sistema.
* El docente puede acceder únicamente a la información asociada a su propia cuenta.
* El docente puede entrar a su cuenta.

### CU-03: Recuperar contraseña

**Actor:** Docente

**Objetivo:**
Permitir que el docente recupere el acceso a su cuenta cuando no recuerde su contraseña.

**Precondiciones:**

* El docente debe tener una cuenta registrada.
* La cuenta debe contar con un correo electrónico asociado.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente selecciona la opción **"¿Olvidaste tu contraseña?"**.
2. El sistema solicita el correo electrónico asociado a la cuenta.
3. El docente ingresa su correo electrónico.
4. El sistema verifica que el correo esté registrado.
5. El sistema envía las instrucciones de recuperación al correo electrónico asociado.
6. El docente accede al enlace de recuperación proporcionado.
7. El sistema solicita establecer una nueva contraseña.
8. El docente ingresa y confirma la nueva contraseña.
9. El sistema valida los requisitos de seguridad de la nueva contraseña.
10. El sistema actualiza la contraseña.
11. El sistema informa que la contraseña fue modificada correctamente.

**Flujos alternativos:**

* Si el correo electrónico no está registrado, el sistema informa que no existe una cuenta asociada.
* Si el correo electrónico tiene un formato incorrecto, el sistema solicita ingresar un correo válido.
* Si la nueva contraseña no cumple con los requisitos de seguridad, el sistema solicita ingresar una contraseña diferente.
* Si las contraseñas ingresadas no coinciden, el sistema solicita confirmarla nuevamente.
* Si ocurre un error durante el proceso, el sistema informa que no fue posible restablecer la contraseña.

**Postcondición:**

* La contraseña de la cuenta queda actualizada.
* El docente puede utilizar la nueva contraseña para iniciar sesión.

### CU-04: Cerrar sesión

**Actor:** Docente

**Objetivo:**
Permitir que el docente finalice su sesión y proteja el acceso a su cuenta.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente selecciona la opción **"Cerrar sesión"**.
2. El sistema muestra o ejecuta la opción para finalizar la sesión.
3. El docente confirma el cierre de sesión, si es necesario.
4. El sistema finaliza la sesión activa.
5. El sistema redirige al docente a la pantalla de inicio de sesión.

**Flujos alternativos:**

* Si ocurre un error al finalizar la sesión, el sistema informa al docente que no fue posible cerrar la sesión correctamente.
* Si el docente cancela la acción cuando se solicita confirmación, el sistema mantiene la sesión activa.

**Postcondición:**

* La sesión del docente queda finalizada.
* El acceso a las funciones privadas del sistema queda bloqueado hasta que el docente vuelva a iniciar sesión.

### Módulo 2: Panel principal

### CU-05: Consultar grupos

**Actor:** Docente

**Objetivo:**
Permitir que el docente consulte los grupos que tiene registrados en su cuenta desde el panel principal.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El sistema debe estar disponible.
* El docente debe tener al menos un grupo registrado para mostrar información.

**Flujo principal:**

1. El docente inicia sesión en el sistema.
2. El sistema muestra el panel principal.
3. El sistema consulta los grupos asociados a la cuenta del docente.
4. El sistema muestra los grupos disponibles en el panel principal.
5. El docente selecciona un grupo.
6. El sistema muestra el acceso al grupo seleccionado.

**Flujos alternativos:**

* Si el docente no tiene grupos registrados, el sistema muestra un mensaje indicando que no existen grupos y proporciona la opción de crear uno.
* Si ocurre un error al cargar los grupos, el sistema informa al docente que no fue posible mostrar la información.

**Postcondición:**

* El docente puede visualizar sus grupos desde el panel principal.
* El docente puede acceder al grupo seleccionado.

### CU-06: Consultar accesos rápidos

**Actor:** Docente

**Objetivo:**
Permitir que el docente acceda rápidamente a las funciones principales del sistema desde el panel principal.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente accede al panel principal.
2. El sistema muestra las opciones de acceso rápido disponibles.
3. El docente selecciona la función que desea utilizar.
4. El sistema dirige al docente al módulo correspondiente.

**Flujos alternativos:**

* Si la función seleccionada no está disponible temporalmente, el sistema informa al docente y mantiene el panel principal.
* Si ocurre un error al acceder al módulo seleccionado, el sistema informa que no fue posible abrirlo.

**Postcondición:**

* El docente es dirigido al módulo correspondiente a la opción seleccionada.

### CU-07: Consultar recordatorios

**Actor:** Docente

**Objetivo:**
Permitir que el docente consulte los recordatorios y pendientes registrados en el sistema desde el panel principal.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente accede al panel principal.
2. El sistema consulta los recordatorios asociados al docente.
3. El sistema muestra los recordatorios y pendientes disponibles.
4. El docente consulta la información mostrada.

**Flujos alternativos:**

* Si no existen recordatorios o pendientes, el sistema muestra un mensaje indicando que no hay elementos pendientes.
* Si ocurre un error al cargar los recordatorios, el sistema informa al docente que no fue posible mostrar la información.

**Postcondición:**

* El docente puede consultar sus recordatorios y pendientes desde el panel principal.

### CU-08: Consultar resumen y estadísticas

**Actor:** Docente

**Objetivo:**
Permitir que el docente consulte un resumen general del estado académico de sus grupos mediante estadísticas relevantes.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El sistema debe estar disponible.
* El docente debe tener información registrada en al menos uno de sus grupos.

**Flujo principal:**

1. El docente accede al panel principal.
2. El sistema recopila la información disponible de los grupos del docente.
3. El sistema procesa la información registrada.
4. El sistema muestra un resumen general con estadísticas relevantes.
5. El sistema muestra información sobre alumnos que pueden encontrarse en riesgo académico.
6. El sistema muestra información relacionada con tareas o actividades pendientes, cuando exista.
7. El docente consulta las estadísticas mostradas.

**Flujos alternativos:**

* Si no existe suficiente información registrada, el sistema muestra un mensaje indicando que las estadísticas aún no están disponibles.
* Si no existen alumnos identificados en riesgo académico, el sistema indica que no se han detectado alumnos en riesgo.
* Si no existen tareas o actividades pendientes, el sistema indica que no hay pendientes registrados.
* Si ocurre un error al procesar la información, el sistema informa al docente que no fue posible generar el resumen.

**Postcondición:**

* El docente puede consultar un resumen general del estado de sus grupos.
* El docente puede identificar información relevante sobre el rendimiento académico y los pendientes.

### Módulo 3: Grupos

### CU-09: Crear grupo

**Actor:** Docente

**Objetivo:**
Permitir que el docente cree un nuevo grupo para organizar y administrar la información de sus alumnos.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente selecciona la opción **"Crear grupo"**.
2. El sistema muestra el formulario para crear un grupo.
3. El docente ingresa la información del grupo.
4. El docente puede ingresar la escuela.
5. El docente puede ingresar la materia.
6. El docente ingresa el grupo.
7. El docente puede ingresar el grado o semestre.
8. El docente puede seleccionar el turno.
9. El docente puede ingresar la carrera o especialidad.
10. El docente puede ingresar el ciclo escolar.
11. El docente confirma la creación del grupo.
12. El sistema revisa la información ingresada.
13. El sistema crea el grupo y lo asocia a la cuenta del docente.
14. El sistema muestra el grupo creado.

**Flujos alternativos:**

* Si algún dato necesario está vacío, el sistema solicita completar la información.
* Si la información ingresada no es válida, el sistema solicita corregirla.
* Si ya existe un grupo con la misma información, el sistema informa al docente para evitar crear un grupo repetido.
* Si ocurre un error al crear el grupo, el sistema informa al docente que no fue posible crear el grupo.

**Postcondición:**

* El grupo queda registrado y asociado a la cuenta del docente.
* El grupo queda disponible para agregar y administrar alumnos.

### CU-10: Consultar grupo

**Actor:** Docente

**Objetivo:**
Permitir que el docente consulte la información de un grupo y acceda a los datos relacionados con este.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El grupo debe estar registrado en su cuenta.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente ingresa al apartado de **"Grupos"**.
2. El sistema muestra los grupos registrados.
3. El docente selecciona el grupo que desea consultar.
4. El sistema muestra la información general del grupo.
5. El sistema permite acceder a la información relacionada con los alumnos y otros datos registrados en el grupo.

**Flujos alternativos:**

* Si el docente no tiene grupos registrados, el sistema muestra un mensaje indicando que no existen grupos.
* Si el grupo seleccionado no está disponible, el sistema informa al docente y muestra nuevamente los grupos registrados.
* Si ocurre un error al cargar la información, el sistema informa que no fue posible mostrar el grupo.

**Postcondición:**

* El docente puede consultar la información del grupo seleccionado.
* El docente puede acceder a las funciones relacionadas con el grupo.

### CU-11: Editar grupo

**Actor:** Docente

**Objetivo:**
Permitir que el docente modifique la información de un grupo cuando sea necesario.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El grupo debe estar registrado en su cuenta.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente ingresa al apartado de **"Grupos"**.
2. El docente selecciona el grupo que desea modificar.
3. El docente selecciona la opción **"Editar grupo"**.
4. El sistema muestra la información actual del grupo.
5. El docente modifica los datos que desea actualizar.
6. El docente confirma los cambios.
7. El sistema revisa la información modificada.
8. El sistema actualiza la información del grupo.
9. El sistema muestra un mensaje indicando que los cambios se guardaron correctamente.

**Flujos alternativos:**

* Si algún dato ingresado no es válido, el sistema solicita corregirlo.
* Si algún dato necesario está vacío, el sistema solicita completarlo.
* Si ocurre un error al guardar los cambios, el sistema informa al docente que no fue posible actualizar el grupo.

**Postcondición:**

* La información del grupo queda actualizada.
* Los datos anteriores son reemplazados por la información modificada.

### CU-12: Eliminar grupo

**Actor:** Docente

**Objetivo:**
Permitir que el docente elimine un grupo que ya no necesite utilizar.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El grupo debe estar registrado en su cuenta.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente ingresa al apartado de **"Grupos"**.
2. El docente selecciona el grupo que desea eliminar.
3. El docente selecciona la opción **"Eliminar grupo"**.
4. El sistema muestra una confirmación para evitar una eliminación accidental.
5. El docente confirma que desea eliminar el grupo.
6. El sistema elimina el grupo.
7. El sistema informa al docente que el grupo fue eliminado correctamente.

**Flujos alternativos:**

* Si el docente cancela la eliminación, el sistema conserva el grupo y regresa a la información del grupo.
* Si ocurre un error durante la eliminación, el sistema informa al docente que no fue posible eliminar el grupo.
* Si el grupo ya no existe, el sistema informa al docente y actualiza la lista de grupos.

**Postcondición:**

* El grupo deja de aparecer en la lista de grupos del docente.
* El docente ya no puede acceder a la información del grupo eliminado.

### Módulo 4: Lista de alumnos

### CU-13: Agregar alumno

**Actor:** Docente

**Objetivo:**
Permitir que el docente agregue un alumno a la lista de un grupo.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El grupo debe estar registrado en su cuenta.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente ingresa al grupo donde desea agregar al alumno.
2. El docente selecciona la opción **"Agregar alumno"**.
3. El sistema muestra el formulario para ingresar los datos del alumno.
4. El docente ingresa la información solicitada.
5. El docente confirma el registro del alumno.
6. El sistema revisa la información ingresada.
7. El sistema agrega al alumno a la lista del grupo.
8. El sistema asigna automáticamente un número de lista al alumno.
9. El sistema muestra al alumno dentro de la lista.

**Flujos alternativos:**

* Si algún dato necesario está vacío, el sistema solicita completar la información.
* Si la información ingresada no es válida, el sistema solicita corregirla.
* Si el alumno ya se encuentra registrado en el grupo, el sistema informa al docente para evitar un registro duplicado.
* Si ocurre un error al registrar al alumno, el sistema informa al docente que no fue posible agregarlo.

**Postcondición:**

* El alumno queda registrado en la lista del grupo.
* El alumno cuenta con un número de lista asignado automáticamente.

### CU-14: Consultar lista de alumnos

**Actor:** Docente

**Objetivo:**
Permitir que el docente consulte la lista de alumnos registrados en un grupo.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El grupo debe estar registrado en su cuenta.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente ingresa al grupo que desea consultar.
2. El docente accede al apartado de **"Lista de alumnos"**.
3. El sistema muestra los alumnos registrados en el grupo.
4. El sistema muestra el número de lista y los datos disponibles de cada alumno.
5. El docente consulta la información de la lista.

**Flujos alternativos:**

* Si el grupo no tiene alumnos registrados, el sistema muestra un mensaje indicando que la lista está vacía.
* Si ocurre un error al cargar la lista, el sistema informa al docente que no fue posible mostrar la información.

**Postcondición:**

* El docente puede consultar la lista de alumnos del grupo seleccionado.

### CU-15: Ordenar lista de alumnos

**Actor:** Docente

**Objetivo:**
Permitir que el docente ordene la lista de alumnos de acuerdo con sus necesidades.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El grupo debe tener alumnos registrados.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente ingresa a la **"Lista de alumnos"**.
2. El sistema muestra la lista de alumnos.
3. El docente selecciona la opción para ordenar la lista.
4. El sistema muestra las formas disponibles para ordenar los alumnos.
5. El docente selecciona **"Por apellidos"** o **"Por nombre"**.
6. El sistema ordena la lista de acuerdo con la opción seleccionada.
7. El sistema muestra nuevamente la lista con el orden elegido.

**Flujos alternativos:**

* Si no hay alumnos registrados, el sistema informa que no hay alumnos para ordenar.
* Si ocurre un error al ordenar la lista, el sistema mantiene la lista y muestra un mensaje indicando que no fue posible realizar el ordenamiento.

**Postcondición:**

* La lista de alumnos se muestra ordenada de acuerdo con la opción seleccionada.
* El docente puede cambiar nuevamente el criterio de ordenamiento cuando lo necesite.

### CU-16: Crear equipos

**Actor:** Docente

**Objetivo:**
Permitir que el docente seleccione alumnos de un grupo y los organice en equipos.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El grupo debe tener alumnos registrados.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente ingresa a la **"Lista de alumnos"**.
2. El docente accede a la opción **"Crear equipos"**.
3. El sistema muestra la lista de alumnos disponibles.
4. El docente selecciona los alumnos que desea incluir en un equipo.
5. El docente indica la creación del equipo.
6. El sistema crea el equipo con los alumnos seleccionados.
7. El sistema muestra el equipo creado.
8. El docente puede continuar seleccionando alumnos para crear otros equipos.

**Flujos alternativos:**

* Si el docente no selecciona ningún alumno, el sistema solicita seleccionar al menos un alumno.
* Si un alumno ya pertenece a un equipo y se intenta agregar nuevamente, el sistema informa al docente.
* Si ocurre un error al crear el equipo, el sistema informa al docente que no fue posible realizar la operación.

**Postcondición:**

* Los equipos quedan organizados con los alumnos seleccionados.
* El docente puede consultar los equipos creados dentro del grupo.

### Módulo 5: Alumnos

### CU-17: Agregar información del alumno

**Actor:** Docente

**Objetivo:**
Permitir que el docente agregue información, observaciones o notas relacionadas con un alumno.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El alumno debe estar registrado en el grupo.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente ingresa al apartado de **"Alumnos"**.
2. El docente selecciona al alumno al que desea agregar información.
3. El sistema muestra la ficha del alumno.
4. El docente selecciona la opción para agregar información u observaciones.
5. El docente escribe la información que desea registrar.
6. El docente confirma el registro.
7. El sistema guarda la información en la ficha del alumno.
8. El sistema muestra un mensaje indicando que la información fue guardada correctamente.

**Flujos alternativos:**

* Si el docente no ingresa información, el sistema solicita escribir la información que desea guardar.
* Si el docente cancela la operación, el sistema no guarda los cambios.
* Si ocurre un error al guardar la información, el sistema informa al docente que no fue posible realizar el registro.

**Postcondición:**

* La información u observación queda registrada en la ficha del alumno.
* El docente puede consultarla posteriormente.

### CU-18: Buscar y consultar información del alumno

**Actor:** Docente

**Objetivo:**
Permitir que el docente busque a un alumno y consulte la información registrada en su ficha.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El grupo debe tener alumnos registrados.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente ingresa al apartado de **"Alumnos"**.
2. El docente utiliza la opción de búsqueda.
3. El docente ingresa el nombre del alumno que desea encontrar.
4. El sistema busca al alumno dentro del grupo.
5. El sistema muestra los resultados que coinciden con la búsqueda.
6. El docente selecciona al alumno que desea consultar.
7. El sistema muestra la ficha del alumno.
8. El sistema muestra su información básica.
9. El sistema muestra el historial de asistencias, participaciones y calificaciones registradas.
10. El sistema muestra las observaciones o notas relacionadas con el alumno.
11. El docente consulta la información disponible.

**Flujos alternativos:**

* Si no se encuentra ningún alumno con la información ingresada, el sistema muestra un mensaje indicando que no se encontraron resultados.
* Si la búsqueda se realiza sin ingresar información, el sistema muestra la lista de alumnos disponibles.
* Si el alumno no tiene registros en alguno de los apartados, el sistema muestra la información disponible e indica que no existen registros en ese apartado.
* Si ocurre un error durante la búsqueda o al cargar la información, el sistema informa al docente que no fue posible mostrarla.

**Postcondición:**

* El docente puede encontrar al alumno que estaba buscando.
* El docente puede consultar la información registrada en su ficha.

### CU-19: Editar información del alumno

**Actor:** Docente

**Objetivo:**
Permitir que el docente modifique la información registrada en la ficha de un alumno.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El alumno debe estar registrado en el grupo.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente selecciona al alumno que desea modificar.
2. El sistema muestra la ficha del alumno.
3. El docente selecciona la opción **"Editar"**.
4. El sistema muestra la información actual del alumno.
5. El docente modifica la información que desea cambiar.
6. El docente confirma los cambios.
7. El sistema revisa la información ingresada.
8. El sistema guarda los cambios realizados.
9. El sistema muestra un mensaje indicando que la información fue actualizada correctamente.

**Flujos alternativos:**

* Si algún dato ingresado no es válido, el sistema solicita corregirlo.
* Si algún dato necesario está vacío, el sistema solicita completarlo.
* Si el docente cancela la edición, el sistema conserva la información anterior.
* Si ocurre un error al guardar los cambios, el sistema informa al docente que no fue posible actualizar la información.

**Postcondición:**

* La información del alumno queda actualizada.
* Los demás registros del alumno se mantienen sin cambios.

### CU-20: Consultar progreso del alumno

**Actor:** Docente

**Objetivo:**
Permitir que el docente consulte el progreso de un alumno a partir de la información registrada.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El alumno debe estar registrado en el grupo.
* El sistema debe tener información registrada del alumno.

**Flujo principal:**

1. El docente selecciona al alumno que desea consultar.
2. El sistema muestra la ficha del alumno.
3. El docente accede al apartado de **"Progreso"**.
4. El sistema consulta la información registrada del alumno.
5. El sistema muestra sus asistencias, participaciones y calificaciones.
6. El docente revisa la información mostrada para conocer el progreso del alumno.

**Flujos alternativos:**

* Si el alumno no tiene suficiente información registrada, el sistema muestra los datos disponibles.
* Si no existen registros en alguno de los apartados, el sistema indica que todavía no hay información registrada.
* Si ocurre un error al consultar la información, el sistema informa al docente que no fue posible mostrar el progreso.

**Postcondición:**

* El docente puede consultar la información relacionada con el progreso del alumno.
* El docente puede conocer su desempeño a partir de los registros disponibles.

### Módulo 6: Horarios

### CU-21: Consultar horario

**Actor:** Docente

**Objetivo:**
Permitir que el docente consulte su horario semanal y las clases asignadas.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente ingresa al apartado de **"Horarios"**.
2. El sistema muestra los días de toda la semana.
3. El sistema muestra las horas y los salones asignados en cada bloque.
4. El docente consulta su horario.

**Flujos alternativos:**

* Si no existen horarios registrados, el sistema muestra un mensaje indicando que todavía no hay horarios asignados.
* Si algún día no tiene clases registradas, el sistema muestra el día sin asignaciones.
* Si ocurre un error al cargar el horario, el sistema informa al docente que no fue posible mostrar la información.

**Postcondición:**

* El docente puede consultar su horario semanal.
* El docente puede identificar las horas y salones asignados.

### CU-22: Asignar horario

**Actor:** Docente

**Objetivo:**
Permitir que el docente asigne una hora y un salón para una clase dentro de su horario.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El sistema debe estar disponible.
* Debe existir un grupo registrado.

**Flujo principal:**

1. El docente ingresa al apartado de **"Horarios"**.
2. El docente selecciona el día en el que desea asignar una clase.
3. El docente selecciona el horario correspondiente.
4. El docente ingresa o selecciona el salón.
5. El docente confirma la asignación.
6. El sistema revisa la información ingresada.
7. El sistema registra la clase en el horario seleccionado.
8. El sistema muestra la clase dentro del horario semanal.

**Flujos alternativos:**

* Si no se selecciona un día u horario, el sistema solicita completar la información.
* Si el horario seleccionado ya tiene una clase asignada, el sistema informa al docente para evitar una asignación incorrecta.
* Si ocurre un error al guardar la asignación, el sistema informa al docente que no fue posible registrar el horario.

**Postcondición:**

* La clase queda registrada en el día y horario seleccionado.
* El salón queda asociado a la clase.

### CU-23: Editar horario

**Actor:** Docente

**Objetivo:**
Permitir que el docente modifique una asignación de horario cuando sea necesario.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* Debe existir una clase registrada en el horario.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente ingresa al apartado de **"Horarios"**.
2. El docente selecciona la clase que desea modificar.
3. El docente selecciona la opción **"Editar"**.
4. El sistema muestra la información actual de la clase.
5. El docente modifica el día, horario o salón.
6. El docente confirma los cambios.
7. El sistema revisa la información modificada.
8. El sistema actualiza la asignación.
9. El sistema muestra el horario actualizado.

**Flujos alternativos:**

* Si la nueva información no es válida, el sistema solicita corregirla.
* Si el docente cancela la edición, el sistema conserva la información anterior.
* Si ocurre un error al guardar los cambios, el sistema informa al docente que no fue posible actualizar el horario.

**Postcondición:**

* La asignación del horario queda actualizada.
* El docente puede consultar el horario con la nueva información.

### CU-24: Eliminar horario

**Actor:** Docente

**Objetivo:**
Permitir que el docente elimine una asignación de horario que ya no necesite.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* Debe existir una asignación registrada en el horario.
* El sistema debe estar disponible.

**Flujo principal:**

1. El docente ingresa al apartado de **"Horarios"**.
2. El docente selecciona la clase que desea eliminar.
3. El docente selecciona la opción **"Eliminar"**.
4. El sistema muestra una confirmación para evitar una eliminación accidental.
5. El docente confirma la eliminación.
6. El sistema elimina la asignación del horario.
7. El sistema actualiza el horario semanal.

**Flujos alternativos:**

* Si el docente cancela la eliminación, el sistema conserva la asignación.
* Si la asignación ya no existe, el sistema informa al docente y actualiza el horario.
* Si ocurre un error al eliminar la asignación, el sistema informa al docente que no fue posible realizar la operación.

**Postcondición:**

* La asignación eliminada deja de aparecer en el horario.
* Las demás asignaciones del horario se mantienen sin cambios.

---

## Parte 2: Emmanuel

### Módulo 7: Asistencia
*(Redactar casos de uso aquí)*

### Módulo 8: Participaciones
*(Redactar casos de uso aquí)*

### Módulo 9: Calificaciones
*(Redactar casos de uso aquí)*

### Módulo 10: Alumnos en riesgo
*(Redactar casos de uso aquí)*

### Módulo 11: Archivos
*(Redactar casos de uso aquí)*

### Módulo 12: Inteligencia artificial
*(Redactar casos de uso aquí)*

### Módulo 13: Resumen inteligente individual por módulo o completo
*(Redactar casos de uso aquí)*
