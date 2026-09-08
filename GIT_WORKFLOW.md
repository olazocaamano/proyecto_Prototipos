# Guia Completa de Flujo de Trabajo en Git y GitHub

Este documento contiene las reglas, los comandos exactos y las buenas practicas para trabajar en equipo sin sobreescribir codigo ni generar conflictos en el proyecto.

---

## 1. Reglas Basicas de Trabajo

1. **La rama `main` esta protegida:** Nadie realiza commits ni envia cambios (push) directamente a `main`. La rama principal solo debe contener codigo funcional, probado y listo.
2. **Una rama por cada tarea:** Cada nueva funcionalidad, correccion de errores o actualizacion de documentacion debe desarrollarse en su propia rama independiente.
3. **Revision obligatoria mediante Pull Request (PR):** Antes de integrar cualquier cambio a `main`, se debe abrir un PR en GitHub para que el otro integrante del equipo revise el codigo.

---

## 2. Convencion para Nombres de Ramas

Para mantener el proyecto organizado, nombra tus ramas segun su proposito usando estos prefijos:

- `feature/nombre-de-tarea`: Para el desarrollo de nuevas funciones.
  Ejemplo: `feature/pantalla-login`, `feature/conexion-bd`
- `fix/nombre-del-error`: Para corregir errores o fallos en el codigo.
  Ejemplo: `fix/error-autenticacion`, `fix/estilos-boton`
- `docs/que-se-documenta`: Para cambios en archivos de documentacion.
  Ejemplo: `docs/actualizar-readme`, `docs/guia-git`

---

## 3. Ciclo de Trabajo Paso a Paso

Sigue estos 5 pasos cada vez que vayas a realizar una tarea en el proyecto:

### Paso 1: Sincronizar main y crear tu rama
Antes de escribir cualquier linea de codigo, asegúrate de tener la ultima version que subio tu compañero y crea tu rama a partir de `main`.

Abre la terminal en VS Code y ejecuta:

```bash
# Cambiar a la rama principal
git checkout main

# Descargar los ultimos cambios desde GitHub
git pull origin main

# Crear y cambiarte a tu nueva rama de trabajo
git checkout -b feature/nombre-de-tu-tarea
```

### Paso 2: Trabajar y guardar cambios en local
Desarrolla tu codigo en VS Code. Conforme completes avances logicos, guarda tus cambios localmente mediante commits.

```bash
# Verificar que archivos has modificado
git status

# Preparar todos los archivos modificados para el commit
git add .

# Guardar el estado actual con un mensaje descriptivo
git commit -m "Explicacion clara y breve de lo que hiciste"
```

### Paso 3: Subir tu rama a GitHub
Cuando hayas terminado tu tarea o quieras respaldar tus avances en la nube, sube tu rama a GitHub.

```bash
# La primera vez que subas esta rama específica:
git push -u origin feature/nombre-de-tu-tarea

# En las siguientes ocasiones dentro de la misma rama, solo usas:
git push
```

### Paso 4: Crear y aprobar el Pull Request (PR)
1. Inicia sesion en GitHub y entra al repositorio del proyecto.
2. Veras un aviso resaltado que indica que subiste una nueva rama. Haz clic en el boton **Compare & pull request**.
3. Escribe un titulo claro y una breve descripcion de los cambios realizados.
4. Asigna a tu compañero como revisor (Reviewer).
5. Tu compañero entra al PR, revisa el codigo, realiza observaciones si es necesario y, si todo esta correcto, hace clic en **Merge pull request** y confirma la fusion.

### Paso 5: Sincronizar y limpiar tu entorno local
Una vez que el PR ha sido integrado en GitHub, regresa a tu terminal local para actualizar tu rama `main` y eliminar la rama de la tarea terminada.

```bash
# Cambiar a la rama main
git checkout main

# Descargar la version de main que ya incluye tus cambios
git pull origin main

# Eliminar la rama local que ya fue integrada
git branch -d feature/nombre-de-tu-tarea
```

---

## 4. Resolucion de Conflictos de Fusion

Un conflicto ocurre cuando dos personas modifican exactamente la misma linea de un mismo archivo en ramas distintas. Git no sabra cual version conservar y te pedira que decidas.

### Como resolverlo en VS Code:

1. Si al hacer `git pull` o intentar fusionar aparece un mensaje de conflicto, abre el archivo afectado en VS Code.
2. Veras el codigo dividido con marcas visuales:
   - `<<<<<<< HEAD`: Tu codigo actual.
   - `=======`: Linea divisoria.
   - `>>>>>>> nombre-de-rama`: El codigo entrante que viene de GitHub.
3. Arriba de la marca, VS Code muestra botones contextuales para solucionar el conflicto con un solo clic:
   - **Accept Current Change:** Conserva tu codigo actual.
   - **Accept Incoming Change:** Conserva el codigo nuevo de tu compañero.
   - **Accept Both Changes:** Conserva ambos codigos.
4. Una vez elegida la opcion correcta y guardado el archivo, ejecuta en la terminal:

```bash
git add .
git commit -m "fix: resolucion de conflictos de fusion"
git push
```

---

## 5. Comandos Utiles de Consulta

- `git status`: Muestra los archivos modificados, agregados o pendientes de commit.
- `git branch`: Lista todas las ramas locales existentes y resalta en la que te encuentras.
- `git log --oneline`: Muestra un historial simplificado de los ultimos commits realizados.
- `git checkout nombre-de-rama`: Te cambia de una rama a otra.

---

## 6. Archivo .gitignore (Archivos Excluidos)

El archivo `.gitignore` le indica a Git cuales archivos o carpetas debe ignorar completamente para no subirlos al repositorio.

Asegúrate de tener un archivo nombrado exactamente `.gitignore` en la raiz del proyecto con el siguiente contenido minimo:

```text
# Dependencias y librerias
node_modules/
venv/
env/

# Archivos de configuracion sensible y llaves privadas
.env
*.pem

# Configuraciones de editores e IDEs
.vscode/
.idea/

# Archivos temporales del sistema operativo
.DS_Store
Thumbs.db
```