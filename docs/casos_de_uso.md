# Documento de Casos de Uso

## Actores del Sistema
- **Docente:** (Añadir aquí una breve descripción de los permisos de este actor)

---

## Parte 1: Mónica

### Módulo 1: Inicio de sesión

#### Caso de Uso 01: Registrar cuenta

**ID:** CU-INICIO-SESION-01
**Actor Principal:** Docente
**Descripción:** Permite que el docente cree una cuenta personal para acceder al sistema.

**Precondiciones:**

* El docente no debe tener una cuenta registrada con el mismo usuario o correo electrónico.
* El docente debe completar todos los campos requeridos.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

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

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 3a:** Si el docente no ingresa el usuario, el sistema solicita completar el campo.
* **Paso 3b:** Si el usuario ingresado ya está registrado, el sistema informa al docente y solicita ingresar otro usuario.
* **Paso 4a:** Si el docente no ingresa el correo electrónico, el sistema solicita completar el campo.
* **Paso 4b:** Si el correo electrónico tiene un formato incorrecto, el sistema solicita ingresar un correo válido.
* **Paso 4c:** Si el correo electrónico ya está registrado, el sistema informa al docente y solicita utilizar otro correo.
* **Paso 5a:** Si la contraseña no cumple con los requisitos de seguridad establecidos, el sistema solicita crear una contraseña válida.
* **Paso 6a:** Si el docente no confirma el registro, el sistema mantiene el formulario sin crear la cuenta.
* **Paso 7a:** Si algún dato ingresado no es válido, el sistema informa al docente y solicita corregirlo.
* **Paso 9a:** Si ocurre un error durante la creación de la cuenta, el sistema informa al docente que la cuenta no pudo ser creada.

**Postcondiciones:**

* La cuenta del docente queda registrada en el sistema.
* La información queda asociada al perfil del docente.
* El docente puede utilizar sus credenciales para iniciar sesión.

---

#### Caso de Uso 02: Iniciar sesión

**ID:** CU-INICIO-SESION-02
**Actor Principal:** Docente
**Descripción:** Permite que el docente acceda a su cuenta y a la información asociada a sus grupos.

**Precondiciones:**

* El docente debe tener una cuenta registrada.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente selecciona la opción **"Iniciar sesión"**.
2. El sistema muestra el formulario de inicio de sesión.
3. El docente ingresa su usuario o correo electrónico.
4. El docente ingresa su contraseña.
5. El docente confirma el inicio de sesión.
6. El sistema verifica las credenciales proporcionadas.
7. El sistema identifica la cuenta correspondiente.
8. El sistema permite el acceso al perfil del docente.
9. El sistema muestra el panel principal.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 3a:** Si el usuario o correo electrónico no existe, el sistema informa que las credenciales son incorrectas.
* **Paso 3b:** Si el campo está vacío, el sistema solicita ingresar el usuario o correo electrónico.
* **Paso 4a:** Si la contraseña es incorrecta, el sistema informa que las credenciales son incorrectas.
* **Paso 4b:** Si el campo de contraseña está vacío, el sistema solicita ingresar la contraseña.
* **Paso 6a:** Si ocurre un error durante la autenticación, el sistema informa que no fue posible iniciar sesión.
* **Paso 7a:** Si no es posible identificar la cuenta correspondiente, el sistema informa que las credenciales son incorrectas.
* **Paso 8a:** Si ocurre un error al establecer la sesión, el sistema informa que no fue posible acceder a la cuenta.

**Postcondiciones:**

* El docente queda autenticado en el sistema.
* El docente puede acceder únicamente a la información asociada a su propia cuenta.
* El docente puede acceder al panel principal.

---

#### Caso de Uso 03: Recuperar contraseña

**ID:** CU-INICIO-SESION-03
**Actor Principal:** Docente
**Descripción:** Permite que el docente recupere el acceso a su cuenta cuando no recuerde su contraseña.

**Precondiciones:**

* El docente debe tener una cuenta registrada.
* La cuenta debe contar con un correo electrónico asociado.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

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

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 3a:** Si el docente no ingresa un correo electrónico, el sistema solicita completar el campo.
* **Paso 3b:** Si el correo electrónico tiene un formato incorrecto, el sistema solicita ingresar un correo válido.
* **Paso 4a:** Si el correo electrónico no está registrado, el sistema informa que no existe una cuenta asociada.
* **Paso 5a:** Si ocurre un error al enviar las instrucciones de recuperación, el sistema informa que no fue posible enviar el correo.
* **Paso 6a:** Si el enlace de recuperación no es válido o ha expirado, el sistema informa al docente y solicita iniciar nuevamente el proceso.
* **Paso 8a:** Si las contraseñas ingresadas no coinciden, el sistema solicita confirmarla nuevamente.
* **Paso 9a:** Si la nueva contraseña no cumple con los requisitos de seguridad, el sistema solicita ingresar una contraseña diferente.
* **Paso 10a:** Si ocurre un error al actualizar la contraseña, el sistema informa que no fue posible restablecerla.

**Postcondiciones:**

* La contraseña de la cuenta queda actualizada.
* El docente puede utilizar la nueva contraseña para iniciar sesión.

---

#### Caso de Uso 04: Cerrar sesión

**ID:** CU-INICIO-SESION-04
**Actor Principal:** Docente
**Descripción:** Permite que el docente finalice su sesión y proteja el acceso a su cuenta.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente selecciona la opción **"Cerrar sesión"**.
2. El sistema muestra o ejecuta la opción para finalizar la sesión.
3. El docente confirma el cierre de sesión, si es necesario.
4. El sistema finaliza la sesión activa.
5. El sistema redirige al docente a la pantalla de inicio de sesión.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 3a:** Si el docente cancela la acción cuando se solicita confirmación, el sistema mantiene la sesión activa.
* **Paso 4a:** Si ocurre un error al finalizar la sesión, el sistema informa al docente que no fue posible cerrar la sesión correctamente.
* **Paso 5a:** Si ocurre un error al redirigir a la pantalla de inicio de sesión, el sistema informa al docente y mantiene bloqueadas las funciones privadas.

**Postcondiciones:**

* La sesión del docente queda finalizada.
* El acceso a las funciones privadas del sistema queda bloqueado hasta que el docente vuelva a iniciar sesión.

### Módulo 2: Panel principal

---

#### Caso de Uso 05: Consultar grupos

**ID:** CU-PANEL-01
**Actor Principal:** Docente
**Descripción:** Permite al docente consultar los grupos registrados en su cuenta desde el panel principal y acceder a la información de un grupo seleccionado.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El sistema debe estar disponible.
* Debe existir al menos un grupo registrado en la cuenta.

**Flujo Principal (Escenario de Éxito):**

1. El docente inicia sesión en el sistema.
2. El sistema muestra el panel principal.
3. El docente consulta los grupos asociados a su cuenta.
4. El sistema muestra los grupos registrados.
5. El docente selecciona un grupo.
6. El sistema muestra el acceso a la información y funciones del grupo seleccionado.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 3a (Sin grupos registrados):** Si el docente no tiene grupos registrados, el sistema muestra un mensaje indicando que no existen grupos y ofrece la opción de crear uno.
* **Paso 4a (Error al cargar grupos):** Si el sistema no puede cargar los grupos, muestra un mensaje indicando que no fue posible mostrar la información.
* **Paso 5a (Grupo no disponible):** Si el grupo seleccionado ya no está disponible, el sistema informa al docente y mantiene la lista de grupos.

**Postcondiciones:**

* El docente puede visualizar los grupos asociados a su cuenta.
* El docente puede acceder al grupo seleccionado.

---

#### Caso de Uso 06: Consultar accesos rápidos

**ID:** CU-PANEL-02
**Actor Principal:** Docente
**Descripción:** Permite al docente acceder rápidamente a las principales funciones del sistema desde el panel principal.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente accede al panel principal.
2. El sistema muestra las opciones de acceso rápido disponibles.
3. El docente selecciona una de las funciones.
4. El sistema dirige al docente al módulo correspondiente.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 3a (Función no disponible):** Si la función seleccionada no está disponible temporalmente, el sistema informa al docente y mantiene el panel principal.
* **Paso 4a (Error al abrir módulo):** Si el sistema no puede abrir el módulo seleccionado, muestra un mensaje indicando que no fue posible acceder a la función.

**Postcondiciones:**

* El docente es dirigido al módulo correspondiente cuando el acceso es exitoso.
* El panel principal se mantiene disponible si ocurre algún error.

---

#### Caso de Uso 07: Consultar recordatorios

**ID:** CU-PANEL-03
**Actor Principal:** Docente
**Descripción:** Permite al docente consultar desde el panel principal los recordatorios y pendientes registrados en el sistema.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente accede al panel principal.
2. El sistema consulta los recordatorios y pendientes asociados al docente.
3. El sistema muestra los recordatorios y pendientes disponibles.
4. El docente consulta la información mostrada.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 2a (Sin recordatorios):** Si no existen recordatorios o pendientes registrados, el sistema muestra un mensaje indicando que no hay pendientes.
* **Paso 3a (Error al cargar recordatorios):** Si el sistema no puede cargar los recordatorios, muestra un mensaje indicando que no fue posible mostrar la información.

**Postcondiciones:**

* El docente puede consultar sus recordatorios y pendientes registrados.
* Si no existen pendientes, el sistema informa que no hay recordatorios disponibles.

---

#### Caso de Uso 08: Consultar resumen y estadísticas

**ID:** CU-PANEL-04
**Actor Principal:** Docente
**Descripción:** Permite al docente consultar un resumen general del estado académico de sus grupos mediante estadísticas, información de alumnos en posible riesgo y actividades pendientes.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El sistema debe estar disponible.
* Debe existir información registrada de al menos un grupo.

**Flujo Principal (Escenario de Éxito):**

1. El docente accede al panel principal.
2. El sistema recopila la información disponible de los grupos asociados.
3. El sistema procesa la información recopilada.
4. El sistema muestra un resumen general con las estadísticas disponibles.
5. El sistema muestra los alumnos que posiblemente se encuentren en riesgo.
6. El sistema muestra las tareas o actividades pendientes cuando existan.
7. El docente consulta el resumen y las estadísticas mostradas.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 2a (Información insuficiente):** Si no existe suficiente información registrada para generar las estadísticas, el sistema indica que las estadísticas aún no están disponibles.
* **Paso 5a (Sin alumnos en riesgo):** Si no se detectan alumnos que posiblemente se encuentren en riesgo, el sistema indica que no se han detectado alumnos en esta situación.
* **Paso 6a (Sin tareas pendientes):** Si no existen tareas o actividades pendientes, el sistema indica que no hay pendientes disponibles.
* **Paso 3a (Error al procesar información):** Si ocurre un error durante el procesamiento de la información, el sistema muestra un mensaje indicando que no fue posible generar el resumen.

**Postcondiciones:**

* El docente puede consultar un resumen general del estado académico de sus grupos.
* El docente puede identificar el rendimiento general, posibles alumnos en riesgo y actividades pendientes cuando exista información disponible.

### Módulo 3: Grupos

#### Caso de Uso 01: Crear grupo

**ID:** CU-GRUPOS-01
**Actor Principal:** Docente
**Descripción:** Permite al docente crear un nuevo grupo para organizar y administrar la información de sus alumnos.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente selecciona la opción **"Crear grupo"**.
2. El sistema muestra el formulario para crear un grupo.
3. El docente ingresa la información general del grupo.
4. El docente ingresa la escuela.
5. El docente ingresa la materia.
6. El docente ingresa el grupo.
7. El docente ingresa el grado o semestre.
8. El docente selecciona el turno.
9. El docente ingresa la carrera o especialidad.
10. El docente ingresa el ciclo escolar.
11. El docente confirma la creación del grupo.
12. El sistema revisa la información ingresada.
13. El sistema crea el grupo y lo asocia a la cuenta del docente.
14. El sistema muestra el grupo creado.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 3a (Información incompleta):** Si el docente no completa algún dato necesario, el sistema solicita ingresar la información faltante.
* **Paso 3b (Información inválida):** Si alguno de los datos ingresados no cumple con el formato establecido, el sistema solicita corregirlo.
* **Paso 11a (Cancelación):** Si el docente cancela la creación, el sistema descarta la información ingresada y regresa al apartado de grupos.
* **Paso 12a (Información inválida):** Si el sistema detecta información incorrecta durante la validación, bloquea la creación y solicita corregir los datos.
* **Paso 12b (Grupo duplicado):** Si ya existe un grupo con la misma información asociado al docente, el sistema informa que el grupo podría estar duplicado y evita su creación.
* **Paso 13a (Error de registro):** Si ocurre un error al guardar el grupo, el sistema informa al docente que no fue posible crear el grupo.

**Postcondiciones:**

* El grupo queda registrado y asociado a la cuenta del docente.
* El grupo queda disponible para agregar y administrar alumnos.

---

#### Caso de Uso 02: Consultar grupo

**ID:** CU-GRUPOS-02
**Actor Principal:** Docente
**Descripción:** Permite al docente consultar la información de un grupo y acceder a los datos relacionados con este.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El grupo debe estar registrado en su cuenta.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente ingresa al apartado de **"Grupos"**.
2. El sistema muestra los grupos registrados.
3. El docente selecciona el grupo que desea consultar.
4. El sistema muestra la información general del grupo.
5. El sistema permite acceder a la información relacionada con los alumnos y otros datos registrados en el grupo.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 2a (Sin grupos registrados):** Si el docente no tiene grupos registrados, el sistema muestra un mensaje indicando que no existen grupos disponibles.
* **Paso 3a (Grupo no disponible):** Si el grupo seleccionado ya no está disponible, el sistema informa al docente y muestra nuevamente los grupos registrados.
* **Paso 4a (Error al cargar información):** Si ocurre un error al cargar la información general del grupo, el sistema informa al docente que no fue posible mostrarla.
* **Paso 5a (Información relacionada no disponible):** Si no existen datos relacionados con el grupo, el sistema muestra la información disponible e indica que no hay registros adicionales.

**Postcondiciones:**

* El docente puede consultar la información del grupo seleccionado.
* El docente puede acceder a las funciones relacionadas con el grupo.

---

#### Caso de Uso 03: Editar grupo

**ID:** CU-GRUPOS-03
**Actor Principal:** Docente
**Descripción:** Permite al docente modificar la información de un grupo cuando sea necesario.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El grupo debe estar registrado en su cuenta.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente ingresa al apartado de **"Grupos"**.
2. El docente selecciona el grupo que desea modificar.
3. El docente selecciona la opción **"Editar grupo"**.
4. El sistema muestra la información actual del grupo.
5. El docente modifica los datos que desea actualizar.
6. El docente confirma los cambios.
7. El sistema revisa la información modificada.
8. El sistema actualiza la información del grupo.
9. El sistema muestra un mensaje indicando que los cambios se guardaron correctamente.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 2a (Grupo no disponible):** Si el grupo seleccionado ya no existe o no está disponible, el sistema informa al docente y muestra nuevamente los grupos registrados.
* **Paso 4a (Error al cargar información):** Si el sistema no puede cargar la información actual del grupo, informa al docente que no fue posible iniciar la edición.
* **Paso 5a (Dato inválido):** Si algún dato modificado no es válido, el sistema solicita corregirlo.
* **Paso 5b (Dato obligatorio vacío):** Si algún dato necesario queda vacío, el sistema solicita completarlo.
* **Paso 6a (Cancelación):** Si el docente cancela la edición, el sistema descarta los cambios y conserva la información anterior.
* **Paso 7a (Información inválida):** Si el sistema detecta información incorrecta durante la validación, bloquea el guardado y solicita corregirla.
* **Paso 8a (Error al actualizar):** Si ocurre un error al guardar los cambios, el sistema informa al docente que no fue posible actualizar el grupo.

**Postcondiciones:**

* La información del grupo queda actualizada.
* Los datos anteriores son reemplazados por la información modificada.

---

#### Caso de Uso 04: Eliminar grupo

**ID:** CU-GRUPOS-04
**Actor Principal:** Docente
**Descripción:** Permite al docente eliminar un grupo que ya no necesite utilizar.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El grupo debe estar registrado en su cuenta.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente ingresa al apartado de **"Grupos"**.
2. El docente selecciona el grupo que desea eliminar.
3. El docente selecciona la opción **"Eliminar grupo"**.
4. El sistema muestra una confirmación para evitar una eliminación accidental.
5. El docente confirma que desea eliminar el grupo.
6. El sistema elimina el grupo.
7. El sistema informa al docente que el grupo fue eliminado correctamente.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 2a (Grupo no disponible):** Si el grupo seleccionado ya no existe, el sistema informa al docente y actualiza la lista de grupos.
* **Paso 4a (Cancelación):** Si el docente cancela la eliminación, el sistema conserva el grupo y regresa a la información del grupo.
* **Paso 5a (Cancelación):** Si el docente no confirma la eliminación, el sistema cancela la operación y conserva el grupo.
* **Paso 6a (Error durante la eliminación):** Si ocurre un error al eliminar el grupo, el sistema informa al docente que no fue posible realizar la operación.
* **Paso 6b (Grupo eliminado previamente):** Si el grupo ya no existe al momento de realizar la eliminación, el sistema informa al docente y actualiza la lista de grupos.

**Postcondiciones:**

* El grupo deja de aparecer en la lista de grupos del docente.
* El docente ya no puede acceder a la información del grupo eliminado.

---

### Módulo 4: Lista de alumnos

#### Caso de Uso 05: Agregar alumno

**ID:** CU-ALUMNOS-01
**Actor Principal:** Docente
**Descripción:** Permite al docente agregar un alumno a la lista de un grupo.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El grupo debe estar registrado en su cuenta.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente ingresa al grupo donde desea agregar al alumno.
2. El docente selecciona la opción **"Agregar alumno"**.
3. El sistema muestra el formulario para ingresar los datos del alumno.
4. El docente ingresa la información solicitada.
5. El docente confirma el registro del alumno.
6. El sistema revisa la información ingresada.
7. El sistema agrega al alumno a la lista del grupo.
8. El sistema asigna automáticamente un número de lista al alumno.
9. El sistema muestra al alumno dentro de la lista.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 1a (Grupo no disponible):** Si el grupo seleccionado ya no existe o no está disponible, el sistema informa al docente y no permite agregar al alumno.
* **Paso 3a (Error al mostrar formulario):** Si ocurre un error al cargar el formulario, el sistema informa al docente que no fue posible mostrarlo.
* **Paso 4a (Dato obligatorio vacío):** Si algún dato necesario está vacío, el sistema solicita completarlo.
* **Paso 4b (Información inválida):** Si la información ingresada no es válida, el sistema solicita corregirla.
* **Paso 5a (Cancelación):** Si el docente cancela el registro, el sistema descarta la información ingresada y regresa a la lista.
* **Paso 6a (Alumno duplicado):** Si el alumno ya se encuentra registrado en el grupo, el sistema informa al docente y evita crear un registro duplicado.
* **Paso 7a (Error al registrar):** Si ocurre un error al registrar al alumno, el sistema informa al docente que no fue posible agregarlo.
* **Paso 8a (Error al asignar número):** Si el sistema no puede asignar automáticamente un número de lista, informa al docente y evita finalizar el registro.

**Postcondiciones:**

* El alumno queda registrado en la lista del grupo.
* El alumno cuenta con un número de lista asignado automáticamente.

---

#### Caso de Uso 06: Consultar lista de alumnos

**ID:** CU-ALUMNOS-02
**Actor Principal:** Docente
**Descripción:** Permite al docente consultar la lista de alumnos registrados en un grupo.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El grupo debe estar registrado en su cuenta.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente ingresa al grupo que desea consultar.
2. El docente accede al apartado de **"Lista de alumnos"**.
3. El sistema muestra los alumnos registrados en el grupo.
4. El sistema muestra el número de lista y los datos disponibles de cada alumno.
5. El docente consulta la información de la lista.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 1a (Grupo no disponible):** Si el grupo seleccionado ya no existe o no está disponible, el sistema informa al docente y muestra nuevamente los grupos registrados.
* **Paso 3a (Lista vacía):** Si el grupo no tiene alumnos registrados, el sistema muestra un mensaje indicando que la lista está vacía.
* **Paso 3b (Error al cargar lista):** Si ocurre un error al cargar los alumnos, el sistema informa al docente que no fue posible mostrar la información.
* **Paso 4a (Datos incompletos):** Si algún alumno no tiene información disponible, el sistema muestra los datos existentes.

**Postcondiciones:**

* El docente puede consultar la lista de alumnos del grupo seleccionado.

---

#### Caso de Uso 07: Ordenar lista de alumnos

**ID:** CU-ALUMNOS-03
**Actor Principal:** Docente
**Descripción:** Permite al docente ordenar la lista de alumnos de acuerdo con sus necesidades.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El grupo debe tener alumnos registrados.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente ingresa a la **"Lista de alumnos"**.
2. El sistema muestra la lista de alumnos.
3. El docente selecciona la opción para ordenar la lista.
4. El sistema muestra las formas disponibles para ordenar los alumnos.
5. El docente selecciona **"Por apellidos"** o **"Por nombre"**.
6. El sistema ordena la lista de acuerdo con la opción seleccionada.
7. El sistema muestra nuevamente la lista con el orden elegido.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 1a (Lista no disponible):** Si el grupo no tiene alumnos registrados, el sistema informa que no hay alumnos para ordenar.
* **Paso 2a (Error al cargar lista):** Si ocurre un error al cargar la lista, el sistema informa al docente que no fue posible mostrarla.
* **Paso 4a (Opciones no disponibles):** Si el sistema no puede cargar los criterios de ordenamiento, informa al docente que no fue posible realizar la operación.
* **Paso 5a (Criterio no seleccionado):** Si el docente no selecciona ningún criterio, el sistema solicita seleccionar una opción.
* **Paso 6a (Error al ordenar):** Si ocurre un error durante el ordenamiento, el sistema mantiene la lista sin cambios e informa al docente.

**Postcondiciones:**

* La lista de alumnos se muestra ordenada de acuerdo con la opción seleccionada.
* El docente puede cambiar nuevamente el criterio de ordenamiento cuando lo necesite.

---

#### Caso de Uso 08: Crear equipos

**ID:** CU-ALUMNOS-04
**Actor Principal:** Docente
**Descripción:** Permite al docente seleccionar alumnos de un grupo y organizarlos en equipos.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El grupo debe tener alumnos registrados.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente ingresa a la **"Lista de alumnos"**.
2. El docente accede a la opción **"Crear equipos"**.
3. El sistema muestra la lista de alumnos disponibles.
4. El docente selecciona los alumnos que desea incluir en un equipo.
5. El docente indica la creación del equipo.
6. El sistema crea el equipo con los alumnos seleccionados.
7. El sistema muestra el equipo creado.
8. El docente puede continuar seleccionando alumnos para crear otros equipos.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 1a (Sin alumnos registrados):** Si no hay alumnos registrados en el grupo, el sistema informa que no existen alumnos disponibles para crear equipos.
* **Paso 3a (Error al cargar alumnos):** Si ocurre un error al cargar la lista, el sistema informa al docente que no fue posible mostrar los alumnos.
* **Paso 4a (Ningún alumno seleccionado):** Si el docente no selecciona ningún alumno, el sistema solicita seleccionar al menos uno.
* **Paso 4b (Alumno ya asignado):** Si un alumno ya pertenece a un equipo y se intenta agregar nuevamente, el sistema informa al docente y evita la duplicación.
* **Paso 5a (Cancelación):** Si el docente cancela la creación del equipo, el sistema descarta la selección y regresa a la lista de alumnos.
* **Paso 6a (Error al crear equipo):** Si ocurre un error al crear el equipo, el sistema informa al docente que no fue posible realizar la operación.
* **Paso 8a (Cancelación de nuevos equipos):** Si el docente decide no crear otro equipo, el sistema conserva los equipos creados y finaliza la operación.

**Postcondiciones:**

* Los equipos quedan organizados con los alumnos seleccionados.
* El docente puede consultar los equipos creados dentro del grupo.

---

### Módulo 5: Alumnos

#### Caso de Uso 09: Agregar información del alumno

**ID:** CU-ALUMNO-01
**Actor Principal:** Docente
**Descripción:** Permite al docente agregar información, observaciones o notas relacionadas con un alumno.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El alumno debe estar registrado en el grupo.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente ingresa al apartado de **"Alumnos"**.
2. El docente selecciona al alumno al que desea agregar información.
3. El sistema muestra la ficha del alumno.
4. El docente selecciona la opción para agregar información u observaciones.
5. El docente escribe la información que desea registrar.
6. El docente confirma el registro.
7. El sistema guarda la información en la ficha del alumno.
8. El sistema muestra un mensaje indicando que la información fue guardada correctamente.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 2a (Alumno no disponible):** Si el alumno seleccionado ya no está registrado, el sistema informa al docente y regresa a la lista de alumnos.
* **Paso 3a (Error al cargar ficha):** Si ocurre un error al cargar la ficha del alumno, el sistema informa al docente que no fue posible mostrarla.
* **Paso 5a (Información vacía):** Si el docente no ingresa información, el sistema solicita escribir la información que desea guardar.
* **Paso 5b (Información no válida):** Si la información ingresada no cumple con las condiciones establecidas, el sistema solicita corregirla.
* **Paso 6a (Cancelación):** Si el docente cancela el registro, el sistema no guarda los cambios y regresa a la ficha del alumno.
* **Paso 7a (Error al guardar):** Si ocurre un error al guardar la información, el sistema informa al docente que no fue posible realizar el registro.

**Postcondiciones:**

* La información u observación queda registrada en la ficha del alumno.
* El docente puede consultarla posteriormente.

---

#### Caso de Uso 10: Buscar y consultar información del alumno

**ID:** CU-ALUMNO-02
**Actor Principal:** Docente
**Descripción:** Permite al docente buscar a un alumno y consultar la información registrada en su ficha.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El grupo debe tener alumnos registrados.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

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

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 2a (Búsqueda no disponible):** Si ocurre un error al cargar la opción de búsqueda, el sistema informa al docente que no fue posible realizarla.
* **Paso 3a (Búsqueda sin información):** Si el docente realiza la búsqueda sin ingresar información, el sistema muestra la lista de alumnos disponibles.
* **Paso 4a (Alumno no encontrado):** Si no se encuentra ningún alumno con la información ingresada, el sistema muestra un mensaje indicando que no se encontraron resultados.
* **Paso 5a (Sin coincidencias):** Si la búsqueda no produce coincidencias, el sistema informa que no existen alumnos que coincidan con los datos ingresados.
* **Paso 6a (Alumno no disponible):** Si el alumno seleccionado ya no está disponible, el sistema informa al docente y regresa a los resultados.
* **Paso 7a (Error al cargar ficha):** Si ocurre un error al cargar la ficha del alumno, el sistema informa al docente que no fue posible mostrarla.
* **Paso 9a (Sin registros académicos):** Si el alumno no tiene asistencias, participaciones o calificaciones registradas, el sistema muestra la información disponible e indica los apartados sin registros.
* **Paso 10a (Sin observaciones):** Si el alumno no tiene observaciones registradas, el sistema indica que no existen notas disponibles.
* **Paso 11a (Error al cargar información):** Si ocurre un error durante la consulta de la información, el sistema informa al docente que no fue posible mostrarla.

**Postcondiciones:**

* El docente puede encontrar al alumno que estaba buscando.
* El docente puede consultar la información registrada en su ficha.

---

#### Caso de Uso 11: Editar información del alumno

**ID:** CU-ALUMNO-03
**Actor Principal:** Docente
**Descripción:** Permite al docente modificar la información registrada en la ficha de un alumno.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El alumno debe estar registrado en el grupo.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente selecciona al alumno que desea modificar.
2. El sistema muestra la ficha del alumno.
3. El docente selecciona la opción **"Editar"**.
4. El sistema muestra la información actual del alumno.
5. El docente modifica la información que desea cambiar.
6. El docente confirma los cambios.
7. El sistema revisa la información ingresada.
8. El sistema guarda los cambios realizados.
9. El sistema muestra un mensaje indicando que la información fue actualizada correctamente.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 1a (Alumno no disponible):** Si el alumno seleccionado ya no está registrado, el sistema informa al docente y regresa a la lista.
* **Paso 2a (Error al cargar ficha):** Si ocurre un error al cargar la ficha, el sistema informa al docente que no fue posible iniciar la edición.
* **Paso 4a (Error al cargar información):** Si el sistema no puede mostrar la información actual del alumno, informa al docente que no fue posible continuar.
* **Paso 5a (Dato inválido):** Si algún dato ingresado no es válido, el sistema solicita corregirlo.
* **Paso 5b (Dato necesario vacío):** Si algún dato necesario está vacío, el sistema solicita completarlo.
* **Paso 6a (Cancelación):** Si el docente cancela la edición, el sistema conserva la información anterior y descarta los cambios.
* **Paso 7a (Información inválida):** Si el sistema detecta información incorrecta durante la validación, bloquea el guardado y solicita corregirla.
* **Paso 8a (Error al guardar):** Si ocurre un error al guardar los cambios, el sistema informa al docente que no fue posible actualizar la información.

**Postcondiciones:**

* La información del alumno queda actualizada.
* Los demás registros del alumno se mantienen sin cambios.

---

#### Caso de Uso 12: Consultar progreso del alumno

**ID:** CU-ALUMNO-04
**Actor Principal:** Docente
**Descripción:** Permite al docente consultar el progreso de un alumno a partir de la información registrada.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El alumno debe estar registrado en el grupo.
* El sistema debe tener información registrada del alumno.

**Flujo Principal (Escenario de Éxito):**

1. El docente selecciona al alumno que desea consultar.
2. El sistema muestra la ficha del alumno.
3. El docente accede al apartado de **"Progreso"**.
4. El sistema consulta la información registrada del alumno.
5. El sistema muestra sus asistencias, participaciones y calificaciones.
6. El docente revisa la información mostrada para conocer el progreso del alumno.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 1a (Alumno no disponible):** Si el alumno seleccionado ya no está registrado, el sistema informa al docente y regresa a la lista de alumnos.
* **Paso 2a (Error al cargar ficha):** Si ocurre un error al cargar la ficha del alumno, el sistema informa al docente que no fue posible mostrarla.
* **Paso 3a (Apartado no disponible):** Si el apartado de progreso no puede cargarse, el sistema informa al docente que no fue posible consultar el progreso.
* **Paso 4a (Información insuficiente):** Si el alumno no tiene suficiente información registrada, el sistema muestra los datos disponibles.
* **Paso 4b (Sin registros):** Si no existen registros del alumno, el sistema indica que todavía no hay información registrada.
* **Paso 5a (Apartado sin registros):** Si no existen registros en alguno de los apartados, el sistema indica que todavía no hay información registrada en ese apartado.
* **Paso 5b (Error al cargar registros):** Si ocurre un error al consultar alguno de los registros, el sistema informa al docente que no fue posible mostrar la información correspondiente.
* **Paso 6a (Error al mostrar progreso):** Si ocurre un error al presentar el progreso, el sistema informa al docente que no fue posible completar la consulta.

**Postcondiciones:**

* El docente puede consultar la información relacionada con el progreso del alumno.
* El docente puede conocer su desempeño a partir de los registros disponibles.

---

### Módulo 6: Horarios

#### Caso de Uso 13: Consultar horario

**ID:** CU-HORARIOS-01
**Actor Principal:** Docente
**Descripción:** Permite al docente consultar su horario semanal y las clases asignadas.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente ingresa al apartado de **"Horarios"**.
2. El sistema muestra los días de toda la semana.
3. El sistema muestra las horas y los salones asignados en cada bloque.
4. El docente consulta su horario.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 2a (Sin horarios registrados):** Si no existen horarios registrados, el sistema muestra un mensaje indicando que todavía no hay horarios asignados.
* **Paso 3a (Día sin clases):** Si algún día no tiene clases registradas, el sistema muestra el día sin asignaciones.
* **Paso 3b (Información incompleta):** Si alguna clase no tiene todos sus datos registrados, el sistema muestra la información disponible.
* **Paso 3c (Error al cargar horario):** Si ocurre un error al cargar la información, el sistema informa al docente que no fue posible mostrar el horario.
* **Paso 4a (Error durante la consulta):** Si ocurre un error mientras el docente consulta el horario, el sistema informa que no fue posible completar la consulta.

**Postcondiciones:**

* El docente puede consultar su horario semanal.
* El docente puede identificar las horas y salones asignados.

---

#### Caso de Uso 14: Asignar horario

**ID:** CU-HORARIOS-02
**Actor Principal:** Docente
**Descripción:** Permite al docente asignar una hora y un salón para una clase dentro de su horario.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* El sistema debe estar disponible.
* Debe existir un grupo registrado.

**Flujo Principal (Escenario de Éxito):**

1. El docente ingresa al apartado de **"Horarios"**.
2. El docente selecciona el día en el que desea asignar una clase.
3. El docente selecciona el horario correspondiente.
4. El docente ingresa o selecciona el salón.
5. El docente confirma la asignación.
6. El sistema revisa la información ingresada.
7. El sistema registra la clase en el horario seleccionado.
8. El sistema muestra la clase dentro del horario semanal.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 2a (Día no seleccionado):** Si el docente no selecciona un día, el sistema solicita completar la información.
* **Paso 3a (Horario no seleccionado):** Si el docente no selecciona un horario, el sistema solicita seleccionar uno.
* **Paso 3b (Horario ocupado):** Si el horario seleccionado ya tiene una clase asignada, el sistema informa al docente para evitar una asignación incorrecta.
* **Paso 4a (Salón no ingresado):** Si el docente no proporciona el salón requerido, el sistema solicita completar la información.
* **Paso 4b (Salón inválido):** Si el salón ingresado no es válido, el sistema solicita corregirlo.
* **Paso 5a (Cancelación):** Si el docente cancela la asignación, el sistema descarta la información ingresada y regresa al horario.
* **Paso 6a (Información inválida):** Si el sistema detecta información incorrecta durante la validación, solicita corregirla.
* **Paso 7a (Error al guardar):** Si ocurre un error al registrar la clase, el sistema informa al docente que no fue posible guardar la asignación.

**Postcondiciones:**

* La clase queda registrada en el día y horario seleccionado.
* El salón queda asociado a la clase.

---

#### Caso de Uso 15: Editar horario

**ID:** CU-HORARIOS-03
**Actor Principal:** Docente
**Descripción:** Permite al docente modificar una asignación de horario cuando sea necesario.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* Debe existir una clase registrada en el horario.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente ingresa al apartado de **"Horarios"**.
2. El docente selecciona la clase que desea modificar.
3. El docente selecciona la opción **"Editar"**.
4. El sistema muestra la información actual de la clase.
5. El docente modifica el día, horario o salón.
6. El docente confirma los cambios.
7. El sistema revisa la información modificada.
8. El sistema actualiza la asignación.
9. El sistema muestra el horario actualizado.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 2a (Clase no disponible):** Si la clase seleccionada ya no existe, el sistema informa al docente y actualiza el horario.
* **Paso 4a (Error al cargar información):** Si el sistema no puede mostrar la información actual de la clase, informa al docente que no fue posible iniciar la edición.
* **Paso 5a (Información inválida):** Si la nueva información no es válida, el sistema solicita corregirla.
* **Paso 5b (Horario ocupado):** Si el nuevo horario seleccionado ya tiene otra clase asignada, el sistema informa al docente y solicita seleccionar otro horario.
* **Paso 6a (Cancelación):** Si el docente cancela la edición, el sistema conserva la información anterior y descarta los cambios.
* **Paso 7a (Información inválida):** Si el sistema detecta información incorrecta durante la validación, bloquea la actualización y solicita corregirla.
* **Paso 8a (Error al guardar):** Si ocurre un error al actualizar la asignación, el sistema informa al docente que no fue posible actualizar el horario.

**Postcondiciones:**

* La asignación del horario queda actualizada.
* El docente puede consultar el horario con la nueva información.

---

#### Caso de Uso 16: Eliminar horario

**ID:** CU-HORARIOS-04
**Actor Principal:** Docente
**Descripción:** Permite al docente eliminar una asignación de horario que ya no necesite.

**Precondiciones:**

* El docente debe haber iniciado sesión.
* Debe existir una asignación registrada en el horario.
* El sistema debe estar disponible.

**Flujo Principal (Escenario de Éxito):**

1. El docente ingresa al apartado de **"Horarios"**.
2. El docente selecciona la clase que desea eliminar.
3. El docente selecciona la opción **"Eliminar"**.
4. El sistema muestra una confirmación para evitar una eliminación accidental.
5. El docente confirma la eliminación.
6. El sistema elimina la asignación del horario.
7. El sistema actualiza el horario semanal.

**Flujos Alternativos (Excepciones y Errores):**

* **Paso 2a (Asignación no disponible):** Si la asignación seleccionada ya no existe, el sistema informa al docente y actualiza el horario.
* **Paso 4a (Cancelación):** Si el docente cancela la eliminación, el sistema conserva la asignación y regresa al horario.
* **Paso 5a (Cancelación):** Si el docente no confirma la eliminación, el sistema cancela la operación y conserva la asignación.
* **Paso 6a (Error durante la eliminación):** Si ocurre un error al eliminar la asignación, el sistema informa al docente que no fue posible realizar la operación.
* **Paso 7a (Error al actualizar horario):** Si ocurre un error al actualizar el horario semanal, el sistema informa al docente que no fue posible mostrar el horario actualizado.

**Postcondiciones:**

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
