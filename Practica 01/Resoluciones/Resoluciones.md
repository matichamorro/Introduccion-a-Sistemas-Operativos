### 11. # Práctica 01

### Índice
1. [Características de GNU/Linux](#1-Características-de-GNU/Linux)
2. [Distribuciones de GNU/Linux](#2-Distribuciones-de-GNU/Linux)
3. [Estructura de GNU/Linux](#3-estructura-de-gnulinux)
4. [Kernel](#4-kernel)
5. [Intérprete de comandos (Shell)](#5-intérprete-de-comandos-shell)
6. [El sistema de Archivos (File System) en Linux](#6-el-sistema-de-archivos-file-system-en-linux)
7. [Particiones](#7-particiones)
8. [Arranque (bootstrap) de un Sistema Operativo](#8-arranque-bootstrap-de-un-sistema-operativo)
9. [Archivos y editores](#9-archivos-y-editores)
    - [cd, mkdir, rmdir, ln, tail, locate, ls, pwd, cp, mv, find](#5-Investigue-la-funcionalidad-y-parámetros-de-los-siguientes-comandos-relacionados-con-el-uso-de-archivos)
10. [Indicando comandos](#10-Indique-qué-comando-es-necesario-utilizar-para-realizar-cada-una-de-las-siguientes-acciones-Investigue-su-funcionamiento-y-parámetros-más-importantes)
11. [Definiendo comandos](#11-Investigue-el-objetivo-parámetros-y-ubicación-directorio-de-los-siguientes-comandos)
12. [Proceso de arranque, SystemV](#12-proceso-de-arranque-systemv-)
13. [SystemD](#13-systemd)
14. [Usuarios](#14-usuarios)
15. [File System y Permisos](#15-filesystem-y-permisos)
16. [Procesos](#16-procesos)
17. [Otros comandos de Linux](#17-otros-comandos-de-linux-indique-funcionalidad-y-parámetros)
    - [tar, grep, gzip, zgrep, wc](#5-investigue-la-funcionalidad-de-los-siguientes-comandos)
18. [Explicando script 1](#18-indique-qué-acción-realiza-cada-uno-de-los-comandos-indicados-a-continuación-considerando-su-orden-suponga-que-se-ejecutan-desde-un-usuario-que-no-es-root-ni-pertenece-al-grupo-de-root-asuma-que-se-encuentra-posicionado-en-el-directorio-de-trabajo-del-usuario-con-el-que-se-logueó-en-caso-de-no-poder-ejecutarse-el-comando-indique-la-razón)
19. [Indicando comandos 1](#19-indique-qué-comando-sería-necesario-ejecutar-para-realizar-cada-una-de-las-siguientes-acciones)
20. [Indicando comandos 2](#20-indique-qué-comando-sería-necesario-ejecutar-para-realizar-cada-una-de-las-siguientes-acciones)
21. []()
22. []()
23. []()
24. []() 


¿Es posible tener en una PC GNU/Linux y otro Sistema Operativo instalado?
Indique qué comando es necesario utilizar para realizar cada una de las siguientes acciones



### 1. Características de GNU/Linux: 
#### 1. Mencione y explique las características más relevantes de GNU/Linux.  
GNU/Linux es un sistema operativo de **tipo Unix**, es decir que sigue ese estándar, además de libre: Está **diseñado por miles de programadores**. Es **gratuito** y de **libre distribución**, Posee muchas distribuciones (variaciones del GNU/linux original creadas por los usuarios para satisfacer distintas necesidades). Es de **código abierto**, lo que permite lo anterior. Es  multiusuario, multitarea y multiprocesador. Es case sensitive y todo en el sistema es un archivo.

#### 2. Mencione otros sistemas operativos y compárelos con GNU/Linux en cuanto a los puntos mencionados en el inciso a.  
En el caso de macOS, las similitudes con linux radican en estar **certificado como Unix**, cumpliendo con las **estándares de SUS y POSIX**.
En cambio, macOS no es un software gratuito ni libre, sino de código cerrado y desarrollado exclusivamente por Apple. Además, no posee muchas distribuciones, por el contrario, solo posee una y funciona exclusivamente en computadoras Mac.
Windows, por otro lado, no es un SO de tipo Unix sino que utiliza el kernel NT, que se origina a partir de VMS; a pesar de ser ambas arquitecturas para sistemas operativos multitarea y multiusuaria, son arquitecturas fundamentalmente distintas. También, cabe aclarar, que fue desarrollado por Microsoft Windows y es de codigo cerrado.
Para sumar a las diferencias, Unix usa un jerarquía de procesos en forma de árbol, cada proceso tiene un padre y puede tener hijos; también se basa en herramientas atómicas que cumplen muy bien una tarea específica. 
Por otro lado, NT usa un diseño de microkernel multihilo, en él los procesos son independientes y se administran los recursos asignando tiempo a los hilos de manera directa.

#### 3. ¿Qué es GNU?  
El sistema GNU fue creado por Richard Stallman con el **fin de crear un Unix libre**. Este define **cuatro libertades** que el sistema tuvo desde el principio como objetivo: la de usar el programa con cualquier propósito, la de estudiar su funcionamiento, la de distribuir sus copias y la de mejorar los programas. Sus siglas significan "GNU no es Unix", esto es debido a que tiene un diseño compatible con el sistema Unix, pero no contiene código de este.

#### 4. Indique una breve historia sobre la evolución del proyecto GNU. 
En 1983 Richard Stallman creó el sistema GNU, pero para asegurar que el mismo fuera libre, debió de crear un marco legal conocido como GPL (General Public License de GNU). En 1985, Stallman creó la FSF (Free Softwore Fondation) con el fin de financiar el proyecto GNU. Para 1990, GNU contaba con un editor de texto (Emacs), un compilador y una gran cantidad de bibliotecas, pero aún le faltaba un Kernel, ya que el prototipo Trix fue abandonado en 1988 por correr unicamente en hardware muy costoso. Desde 1991, Linus Torvalds venía trabajando en un Kernel llamado Linux, el cual distribuiría bajo una licencia GPL. Es por esto que, en el año 1992, Torvalds y Stallman deciden fusionar ambos prayectos, dando lugar a lo que hoy se conoce como GNU/Linux.

#### 5. Explique qué es la multitarea, e indique si GNU/Linux hace uso de ella. 
La multitarea es la **capacidad de un SO para ejecutar varios programas a procesos de forma**, en principio, **simultánea**. En el caso de Linux, este sistema es multitarea. La multitarea permite que **múltiples tareas compartan la CPU sin interferir entre sí**, de manera que cada programa crea que tiene acceso exclusivo gracias a espacios de memoria aislados y, en caso de tener un solo núcleo en la CPU, al sistema alternando entre los procesos con mucha rapidez mediante divisiones del tiempo (time-slicing). **Linux implementa esta caracteristica** mediante la multitarea preventiva, asignando y controlando de forma segura el tiempo que cada proceso pasa en la CPU; a partir del Scheduler que reparte los turnos de ejecución entre los procesos activos; el cambio de contexto, interrupiendo vía hardware al procesador a intervalos regulares para:  pausar el proceso actual, guardar su estado actual y activar el siguiente, permitiendo que un programa monopolice el sistema; o un soporte multiprocesador.

#### 6. ¿Qué es POSIX?  
Posix es un **estándar creado por el IEEE que define como debe comunicarse un programa con el sistema operativo**, de ahí sus siglas (Portable operating system interface, y la x a partir de su funcionamiento en sistemas de tipo Unix). El objetivo que tiene es el de lograr que **el software sea fácil de mover y usar** entre diferentes computadoras, permitiendo compatibilidad, orden y unión.


### 2. Distribuciones de GNU/Linux:  
#### 1. ¿Qué es una distribución de GNU/Linux? Nombre al menos 4 distribuciones de GNU/Linux y cite diferencias básicas entre ellas.
Una distribución o *distro* de GNU/Linux es un sistema operativo completo y empaquetado que combina el núcleo (Kernel) Linux con las herramientas y bibliotecas del proyecto GNU, un sistema de gestión de paquetes y una selección de software adicional. Dado que el código de Linux y GNU es libre, cualquier individuo u organización puede ensamblar estas piezas para crear una versión del sistema operativo lista para ser instalada.   
   
Cuatro distribuciones y sus diferencias básicas:  
- Ubuntu: Basada en Debian, está diseñada con un enfoque absoluto en la facilidad de uso, la compatibilidad de hardware (incluyendo controladores privativos) y un ciclo de lanzamiento predecible. Es ideal para usuarios que recién migran desde Windows.
- Fedora: Patrocinada por Red Hat, se enfoca en ofrecer la tecnología más innovadora y reciente. Funciona como banco de pruebas para las tecnologías empresariales de Red Hat y mantiene una política estricta de incluir únicamente software libre por defecto.
- Arch Linux: Orientada a usuarios avanzados. Sigue el modelo *Do It Yourself*, donde el usuario instala desde una terminal negra únicamente lo que necesita, pieza por pieza. Utiliza un modelo de actualización continua.
- Linux Mint: Basada en Ubuntu, pero diseñada para ofrecer un entorno visual más tradicional, similar al paradigma clásico de escritorio y barra de tareas de Windows, gracias a su entorno Cinnamon, siendo aún más amigable y ligera.  

#### 2. ¿En qué se diferencia una distribución de otra? 
Aunque todas comparten el mismo Kernel Linux en su base, las distribuciones divergen significativamente en las siguientes decisiones de diseño:  
- Gestor de paquetes: La herramienta utilizada para instalar, actualizar y borrar software (APT y paquetes `.deb` en Debian/Ubuntu; DNF y paquetes `.rpm` en Fedora/RedHat; Pacman en Arch).
- Ciclo de actualizaciones (*Release Model*):
    - Lanzamiento fijo (*Point Release*): Se lanza una versión estable cada cierto tiempo (ej. Ubuntu cada 6 meses, Debian cada 2 años). El software no cambia sus versiones mayores para garantizar la máxima estabilidad.
    - Lanzamiento continuo (*Rolling Release*): No hay versiones del sistema operativo. El software se actualiza a su última versión el mismo día que los desarrolladores lo publican (ej. Arch Linux).
- Público objetivo: Existen distros para servidores corporativos, computadoras de escritorio, ciberseguridad (Kali Linux) o rescate de datos.
- Entorno de escritorio predeterminado: La interfaz gráfica que el usuario ve al iniciar sesión (GNOME, KDE Plasma, XFCE, Cinnamon).
- Filosofía sobre el software privativo: Algunas distros (como Trisquel) rechazan cualquier código que no sea 100% libre, mientras que otras (como Ubuntu) facilitan la instalación de drivers cerrados (como los de NVIDIA) por pragmatismo.

#### 3. ¿Qué es Debian? Acceda al sitio https://www.debian.org/ e indique cuáles son los objetivos del proyecto y una breve cronología del mismo. 
Debian es un sistema operativo libre y, al mismo tiempo, una inmensa comunidad global de voluntarios y desarrolladores. Es una de las distribuciones más antiguas e influyentes (es la base sobre la que se construyen cientos de otras distribuciones, como Ubuntu, Kali o Raspberry Pi OS).  
**Objetivos principales**:  
- Mantenerse 100% libre: El sistema base de Debian siempre estará compuesto exclusivamente por software libre, respetando las Directrices de Software Libre de Debian (DFSG).
- Estabilidad y robustez por encima de todo: En su rama "Estable", el proyecto prioriza un sistema a prueba de fallos, ideal para servidores críticos, en lugar de apresurarse a incluir el software más moderno.
- No ocultar los problemas: Mantener una base de datos de errores (Bug Tracking System) pública y transparente para toda la comunidad.
- Universalidad: Ser "El sistema operativo universal", soportando la mayor cantidad de arquitecturas de procesadores posibles y sirviendo para cualquier caso de uso.  
  
**Breve cronología**:
- 1993: Ian Murdock funda el proyecto y lanza el Manifiesto Debian (el nombre proviene de la combinación del nombre de su entonces novia, Debra, y el suyo, Ian).
- 1996: Se lanza Debian 1.1 "Buzz". Se establece la tradición de nombrar todas las versiones estables con personajes de la película Toy Story.
- 1997: Se publica oficialmente el Contrato Social de Debian, estableciendo la filosofía política y técnica del proyecto.
- 1998/1999: Se introduce la herramienta APT (Advanced Package Tool), revolucionando la gestión de dependencias en GNU/Linux.
- 2007: Debian comienza a incluir oficialmente instaladores gráficos y se consolida como la base para el explosivo éxito de Ubuntu.
- En la actualidad: El proyecto continúa lanzando versiones estables aproximadamente cada 2 años (como Bullseye o Bookworm), manteniéndose como el pilar fundamental del ecosistema de servidores web a nivel mundial.

### 3. Estructura de GNU/Linux:  
#### 1. Nombre cuáles son los componentes fundamentales de GNU/Linux. 
Los componentes fundamentales de GNU/Linux consisten en el Kernel de Linux, que actúa como la última capa entre el hardware fisico de la computadora y el software, administrando el CPU, la memoria y los dispositivos, además de presentar una solución en caso de que falle todo lo demás ante algún problema imprevisto; el intérprete de comandos, el shell, el cual recibe lo que se escribe en la terminal y lo convierte en instrucciones para el SO, puede ser CLI (Command Line Intertace), como en el caso de Debian, CUI (Character User Interface, un sinónimo de CLI que estrictamente solo tiene caracteres ASCII) ó GUI (Graphical User Interface); y también el sistema de archivos, los cuales organizan la forma en que se almacenan los archivos en los dispositivos de almacenamiento.

#### 2. Mencione y explique la estructura básica del Sistema Operativo GNU/Linux. 
- Núcleo (Kernel): El corazón del sistema; gestiona los recursos de la memoria, los procesos y la comunicación directa con el hardware.
- Shell (Intérprete de comandos): La interfaz que traduce las órdenes del usuario (por texto o consola) en instrucciones entendibles para el núcleo.
- Utilidades y Aplicaciones: Los programas, bibliotecas del proyecto GNU y herramientas de software que permiten realizar tareas específicas


### 4. Kernel:  
#### 1. ¿Cuáles son sus funciones principales?  
El Kernel ejecuta programas y gestiona dispositivos de hardware con el fin de comunicar el hardware con el software, es también el encargado de la administración de memoria, CPU y E/S. 

#### 2. ¿Es posible tener más de un Kernel de GNU/Linux instalado en la misma máquina?(ayuda /boot)  
Es posible tener múltiples kernels de Linux instalados en la misma computadora, ya que cada uno se guarda en las particiones de disco destinadas a los `/boot`; estas contienen cada uno su instalación del kernel, como un archivo individual, y su propio archivo `initrd`. Al ejecutarse el gestor de arranque (GRUB), detecta todos los kernels y permite elegir el descado con un menú.

#### 3. ¿En qué directorio se encuentra ubicado?  
El archivo de la instalación del Kernel se encuentra en el directorio `/boot`.


### 5. Intérprete de comandos (Shell):
#### 1. ¿Qué es y cuáles son sus funciones?  
El Shell, también conocido como CLI (Command Line Interface), línea de comandos, terminal o consola; actúa como **modo de comunicación entre el usuario y el sistema operativo**, esperando el ingreso de comandos por parte del usuario, mientras que la respuesta del SO es mostrada al usuario en la misma ventana. Cada usuario puede tener una interfaz o shell, y **pueden personalizarse** ya que **son programables**. El funcionamiento del shell consiste en que, en su forma más básica, se muestra un *prompt*, un conjunto de caracteres que se muestran en una línea de comandos para indicarnos que está a la espera de ordenes, en el Bourne Shell y sus derivados, el prompt suele ser el carácter $ para los usuarios y # para el administrador. Luego el usuario teclea una orden en el teclado y finaliza la orden, y la computadora ejecuta la orden, proporcionando una salida de texto.

#### 2. Investigue y mencione al menos 3 intérpretes de comandos que existen para GNU/Linux y compárelos entre ellos.  
Existen **tres** grandes familias de Shells dentro de GNU/Linux y Unix, estas son: Korn-Shell (**ksh**), Bourne-Shell (**sh**) y C-Shell (**csh**). Estas se diferencian entre sí básicamente en la sintaxis de sus comandos y en la interacción con el usuario.  
- `/bin/sh` En el caso de Bourne Shell, está disponible en todas las versiones de UNIX y es lo suficientemente básico como para que funcione en todas las plataformas.
- `/bin/csh` En el caso de C-Shell, este debe su nombre al lenguaje de programación C, ya que al hacer scripts su sintaxis es similar. Es el estándar en los BSD, un sistema operativo libre derivado de Unix, y derivados.
- `/bin/ksh` Korn Shell; estándar de SYSV. Maneja un historial de comandos. Basado en sh,
con agregados para hacerlo más amigable.
- `/bin/bash` También está Bourne Again Shell, el cual es uno de los más avanzadoas y populares en GNU/Linux. Tiene licencia GNU. Ofrece las mismas capacidades de csh pero incluyendo otras funciones avanzadas.

#### 3. ¿Dónde se ubican (path) los comandos propios y externos al Shell?  
Cuando el shell recibe una orden lo primero que hace es ver si está **dentro de sus órdenes internas** (como lo son por ejemplo cd, export, return, exit...), luego mira en los **alias de comandos**, y después busca el comando en cada ubicación indicada en la variable **PATH** (puede consultarse con `echo $PATH`). 
Los comandos propios son reconocidos y ejecutados por el shell directamente y sin ayuda de ningún otro ejecutable. Los comandos externos pueden estar en `/bin`, `/usr/bin`, `/usr/local/bin` o cualquier otra ubicación si se la agrega a la variable *PATH*. Si los nombres de un comando externo y uno interno se superponen, se ejecutará el interno, solo exceptuando el caso en el que forcemos la ejecución del externo indicándose el path completo.

#### 4. ¿Por qué considera que el Shell no es parte del Kernel de GNU/Linux?  
El shell no forma parte del kernel básico del SO; sino que el mismo "dialoga" con el kernel. El shell es una aplicación de la capa de usuario que traduce las órdenes escritas o visuales del usuario para que el sistema las entienda. Funciona por encima del kernel, usando llamadas al sistema para comunicarse con él.

#### 5. ¿Es posible definir uno distinto para cada usuario?  
Sí, cada usuario puede tener una interfaz o shell. La shell es iniciada por un proceso denominado "login", y dado que cada usuario tiene asignado una shell por defecto, la misma se inicia cada vez que un usuario comienza a trabajar en su estación de trabajo (es decir se "loguea" en una terminal). Dentro del contenido del archivo `/etc/passwd`, se puede ver cual es la shell que cada usuario tiene asignada por defecto.  


### 6. El sistema de Archivos (File System) en Linux:
#### 1. ¿Qué es?  
Es la forma en que dentro de un sistema de cómputo se organizan, se administran los archivos. Esa administración comprende:  
- Métodos de acceso: cómo se acceden los datos contenidos en el archivo.  
- Manejo de archivos: cómo actúan los mecanismos para almacenar, referenciar, compartir y proteger los archivos.  
- Manejo de la memoria secundaria: Cómo se administra el espacio para los archivos en memoria secundaria.  
- Mecanismos de integridad: con qué métodos se garantiza la incorruptibilidad del archivo.  
Generalmente un sistema de archivos Tiene directorios que asocian nombres de archivos con archivos, conectando el nombre de archivo a un índice en una tabla de asignación de archivos de algún tipo, como los i-nodos de los sistemas Unix. La estructura de directorios puede ser plana o jerárquica (ramificada o "en árbol").  
En sistemas de archivos jerárquicos por lo general se declara la ubicación precisa de un archivo con una cadena de texto llamada "ruta" o *path*. Una ruta viene dada por una sucesión de nombres de directorios y subdirectorios, ordenados de izquierda a derecha y separados por algún carácter especial que suele ser una barra `/` o barra invertida `\` y puede terminar en el nombre de un archivo presente en la última rama de directorios especificada.  
Los sistemas de archivos tradicionales **proveen métodos para crear, mover y eliminar archivos y directorios**, pero carecen de métodos para crear, por ejemplo, enlaces adicionales a un directorio o archivo, ó para renombrar enlaces padres.

#### 2. ¿Cuál es la estructura básica de los File System en GNU/Linux? Mencione los directorios más importantes e indique qué tipo de información se encuentra en ellos. ¿A qué hace referencia la sigla FHS?  
En el **momento de instalación** GNU/Linux crea una estructura de directorios básica llamada **Filesystem Hierarchy Standard (FHS)**. FHS se diseño especialmente para GNU/Linux en 1994, pero para 1995 se amplió para cualquier Unix que se adhiriera voluntariamente.  
- `/`: **Todos los archivos y directorios** aparecen bajo el directorio raíz, aunque se encuentre en distintos dispositivos físicos.    
- `/bin`: bin es la abreviación de binaries, o ejecutables. Es **donde residen la mayoría de los programas esenciales del sistema**, como `cp`, `ls` y `mv`. Por ejemplo, cuando se usa la orden `cp`, se está ejecutando el programa `/bin/cp`. Si ejecutamos el comando `ls -F` se verá que la mayoría de los ficheros de `/bin` tienen un asterisco añadido al final de sus nombres; esto indica que son archivos ejecutables.   
- `/dev`: Estos archivos son conocidos como **controladores de dispositivo** (device drivers) son usados para **acceder a los dispositivos del sistema y recursos**, como discos duros, memoria, etc.  
- `/etc`: contiene una **serie de archivos de configuración del sistema**. Estos incluyen `/etc/passwd` (la base de datos de usuarios), `/etc/rc` (scripts de inicialización del sistema), etc.   
- `/sbin`: se usa para almacenar **programas esenciales del sistema**, que usará el administrador del sistema.  
- `/home`: contiene los **directorios "home" de los usuarios**. Por ejemplo, `/home/ISO_CSO` es el directorio del usuario ISO_CSO.  
- `/lib`: contiene las **imágenes de las librerías compartidas**. Estos archivos contienen código que compartirán muchos programas. En lugar de que cada programa contenga una copia propia de las rutinas compartidas, estas **son guardadas en un lugar común**, en `/lib`. Esto hace que los programas ejecutables sean menores y reduce el espacio usado en disco.  
- `/proc`: es un "sistema de ficheros virtual". Los ficheros que contiene realmente **residen en la memoria, no en un disco**. Hacen referencia a varios procesos que corren en el sistema, y le **permiten obtener información acerca de que programas y procesos están corriendo** en un momento dado.  
- `/root`: **Directorio home de root**.  
- `/tmp`: Muchos programas tienen la necesidad de generar cierta **información temporal** y guardarla en un fichero temporal. El lugar habitual para esos ficheros es este directorio.  
- `/usr`: es un directorio muy importante. **Contienen una serie de subdirectorios**. La mayoría de las cosas que se encuentran en /usr son opcionales para el sistema, pero también las que hacen que el sistema sea útil. Subdirectorios:  
    - `/usr/X11R6`: contiene el sistema XWindow si se ha instalado.  
    - `/usr/bin`: contiene los archivos ejecutables (programas y comandos) de uso general para todos los usuarios del sistema.
    - `/usr/etc`: contiene diferentes archivos de configuración y programas del sistema. Los archivos que se encuentran aquí no son esenciales para el sistema, a diferencia de los que se encuentran en `/etc`, que si lo son.
    - `/usr/include`: contiene los archivos de cabecera para el compilador de C. Estos archivos (la mayoría de los cuales terminan en .h, de "header") declaran estructuras de datos, subrutinas y constantes usados en la escritura de programas en C. Los archivos que se encuentran en /usr/include/sys son generalmente usados en la programación de en Unix a nivel de sistema.
    - `/usr/lib`: contiene las librerías equivalentes "stub" y "static" a los ficheros encontrados en `/lib`. Al compilar un programa, este es "enlazado" con las librerías que se encuentran en aquí, las cuales dirigen al programa a buscar en `/lib` cuando necesita el código de la librería. Además, varios programas guardan archivos de configuración en `/usr/lib`.
    - `/usr/local`: es muy parecido a /usr contiene programas y archivos no esenciales para el sistema.
    - `/usr/man`: Este directorio contiene las páginas de manual. Hay dos subdirectorios para cada página "sección", el segundo trata de las system calls que utiliza.
    - `/usr/src`: contiene el código fuente (programas por compilar) de varios programas de su sistema. El más importante es `/usr/src/linux`, el cual contiene el código fuente del Núcleo de Linux.
- `/var`: contiene directorios que a menudo cambian su tamaño o tienden a crecer. Muchos de estos directorios solían residir en `/usr`, pero desde que estamos tratando de dejarlo relativamente inalterable, los directorios que cambian a menudo han sido llevados a `/var`.
Algunos de estos directorios son:
    - `/var/log`: contiene varios archivos de interés para el administrador del sistema, específicamente históricos del sistema, los cuales recopilan errores o problemas con el sistema. Otros archivos guardan las sesiones de presentación en el sistema, así como los intentos fallidos.
    - `/var/spool`: contiene archivos van a ser pasados a otro programa. Por ejemplo, si su máquina está conectada a una red, el correo entrante será almacenado en `/var/spool/mail` hasta que sea leído o se lo elimine.

#### 3. Mencione sistemas de archivos soportados por GNU/Linux.  
- ext3: es un sistema de archivos con registro por diario (_journaling_), lo cual es la principal diferencia con su antecesor ext2, es por eso que permite ser montado y usado como este mismo. Este sistema utiliza un árbol binario balanceado (árbol AVL) e incorpora el asignador de bloques de disco Orlov. El _journaling_ se basa en llevar un registro en el que se almacena la información necesaria para restablecer los datos afectados por una operación compleja en caso de que esta falle.
- ext4: también es un sistema de archivos basado en el _journaling_. Las principales mejoras con respecto a ext3 son: el soporte de volúmenes de hasta 1024 PiB, un soporte añadido de extent (un conjunto de bloques físicos contiguos, que mejoran el rendimiento al trabajar con ficheros de gran tamaño y reducen la fragmentación), menor uso del CPU y mejoras en la velocidad de lectura y escritura.
- ReiserFS: es un sistema de archivos de propósito general. A partir de la versión 2.4.1 del núcleo de Linux, ReiserFS se convirtió en el primer sistema de ficheros con journal en ser incluido en el núcleo estándar. Permite aumentar el tamaño del sistema de ficheros mientras está montado y desmontado (en línea y offline), aunque para disminuirlo, únicamente se permite estando offline (desmontado).
- XFS: es un sistema de archivos de 64 bits con journaling de alto rendimiento. XFS se incorporó a Linux a partir de la versión 2.4.25. Es el más antiguo de los sistema de archivos con _journaling_ disponible para la plataforma UNIX.


### 7. Particiones:
#### 1. Definición. Tipos de particiones. Ventajas y Desventajas.
Una partición de disco es una **división lógica de una unidad de almacenamiento físico** que el sistema operativo gestiona como si fuera una unidad física independiente. **Cada partición cuenta con su propio filesystem y estructura de directorios**, lo que permite organizar y aislar la información dentro del mismo hardware. **Cada sistema operativo es instalado en una partición separada**, además de que es una buena práctica separar los datos del usuario de las aplicaciones y/o sistema operativo instalado.  
Bajo el esquema MBR (Master Boot Record) las particiones pueden dividirse en 3 categorías: primarias, extendida y lógica. Debido al tamaño acotado en el MBR para la tabla de particiones: Se restringe a 4 la cantidad de particiones primarias, pero también podríamos extender una de esas 4, subdividiéndola en particiones lógicas. Las particiones primarias son las divisiones principales del disco y las únicas que pueden ser marcadas como "activa" para que el BIOS/UEFI arranque un sistema operativo desde ellas.  
*Ventajas*:
- Aislamiento frente a fallos de software.  
- Arranque múltiple (Dual Boot).  
- Organización y seguridad, facilitando la creación de copias de seguridad sectorizadas y el cifrado de volúmenes específicos.  
- Optimización del sistema de archivos, permitiendo asignarle a las particiones diferentes tamaños según el uso.  
*Desventajas*:  
- Falsa sensación de seguridad ante problemas de hardware.
- Rigidez y desperdicio de espacio si se calcula mal el tamaño requerido por la partición.
- Requiere una planificación previa y puede añadir complejidad a la gestión del almacenamiento.

#### 2. ¿Cómo se identifican las particiones en GNU/Linux? (Considere discos IDE, SCSI y SATA).
En GNU/Linux, los discos y sus particiones no se identifican con letras de unidad (como `C:` o `D:` en Windows), sino que se representan como archivos de dispositivos ubicados en el directorio especial `/dev`.  
La nomenclatura se compone de un **prefijo** que indica el tipo de tecnología o controlador del disco, una **letra** que indica el orden físico del disco y un **número** que identifica la partición específica.  
Los discos con interfaz IDE utilizan el prefijo `hd` (Hard Disk). La letra asignada depende de su posición física en los canales de la placa base:  
- `/dev/hda`: Disco maestro en el canal IDE primario.
- `/dev/hdb`: Disco esclavo en el canal IDE primario.
- `/dev/hdc`: Disco maestro en el canal IDE secundario.
- `/dev/hdd`: Disco esclavo en el canal IDE secundario.  
Los discos SCSI utilizan el prefijo `sd` (SCSI Disk). En los sistemas GNU/Linux modernos, el núcleo utiliza el subsistema SCSI (a través del controlador `libata`) para gestionar también las conexiones SATA e incluso los dispositivos de almacenamiento masivo USB. Por lo tanto, hoy en día casi todos los discos rígidos y SSDs (que no sean NVMe) utilizan este prefijo, asignando la letra por orden de detección en el arranque:
- `/dev/sda`: Primer disco detectado.
- `/dev/sdb`: Segundo disco detectado.
- `/dev/sdc`: Tercer disco detectado, y así sucesivamente.
Al nombre del disco se le añade un número al final para identificar cada partición individual. Bajo el esquema tradicional MBR, la numeración sigue una regla estricta:
- Números del 1 al 4: Están reservados exclusivamente para las particiones primarias y la partición extendida.
    - Ejemplo: /dev/sda1 (*primera* partición *primaria* del *primer disco SATA*).
    - Ejemplo: /dev/hdb2 (*segunda* partición *primaria* del *disco IDE esclavo primario*).
- Números del 5 en adelante: Se utilizan exclusivamente para las particiones lógicas dentro de la partición extendida. Esto es una regla fija: la primera partición lógica siempre será la número 5, sin importar cuántas particiones primarias (del 1 al 4) se hayan creado realmente.
    - Ejemplo: /dev/sda5 (primera partición lógica del primer disco SATA).
    - Ejemplo: /dev/sda6 (segunda partición lógica del mismo disco).


#### 3. ¿Cuántas particiones son necesarias como mínimo para instalar GNU/Linux? Nómbrelas indicando tipo de partición, identificación, tipo de File System y punto de montaje.
Como mínimo es necesario una partición (para el `/`), aunque es recomendable crear al menos 2 (`/` y `swap`).
- La partición para `/` debe de ser primaria, con su identificación `dev/sda1` (asumiendo que se instala en el primer disco SATA/SCSI como la primera partición), con el filesystem `ext4` y el punto de montaje `/`.
- La partición para `swap` puede ser primaria o lógica (mayormente lógica), con su identificación `/dev/sda2`, si se crea como la segunda primaria; o `/dev/sda5`, si se crea como la primera partición lógica dentro de una extendida; con el filesystem `swap`, ya que al no utilizar un formato propio y exclusivo para la paginación de memoria, no tiene un sistema de archivos estándar y no tiene un punto de montaje en el árbol de directorios (suele representarse en los archivos de configuración como `none` o `swap`, ya que el núcleo la gestiona a bajo nivel).  
Si el hardware utiliza el estándar moderno UEFI en lugar del antiguo BIOS, la arquitectura exige obligatoriamente una tercera partición mínima para que el sistema pueda arrancar:
- La partición para EFI (ESP - EFI System Partition) debe de ser primaria, generalmente con su identificación `/dev/sda1` (desplazando a la raíz y a la swap a números posteriores), con el filesystem `FAT32` (o `vfat`) y el punto de montaje `/boot/efi`.

#### 4. Dar ejemplos de diversos casos de particionamiento dependiendo del tipo de tarea que se deba realizar en su sistema operativo.

_Ejemplo 1: Estación de Desarrollo y Uso Mixto (Dual Boot)_  
Este esquema es típico en computadoras personales donde se necesita un entorno para juegos o software de diseño comercial, y otro entorno aislado (como Debian u otra distribución GNU/Linux) para programar y administrar sistemas.
- Windows (NTFS): Utilizada para ejecutar software que requiere aceleración gráfica nativa en este ecosistema (juegos, AutoCAD, Adobe Photoshop).
- `/boot/efi` (FAT32): Compartida por ambos sistemas para el arranque UEFI.
- `/` (ext4): Contiene el sistema operativo Linux y herramientas de desarrollo.
- `/home` (ext4): Al separar el directorio de usuarios, se protegen los proyectos de código y las configuraciones personales. Si el sistema operativo se rompe, se puede reinstalar la partición raíz sin perder los datos del usuario.
- Partición de datos compartida (NTFS o exFAT): Permite que tanto Windows como Linux puedan leer y escribir archivos en un espacio común.

_Ejemplo 2: Servidor Web y de Base de Datos_  
En un servidor que aloja aplicaciones web (por ejemplo, basadas en Django) y gestiona bases de datos relacionales, la prioridad es la estabilidad. Si un archivo de registro crece descontroladamente, puede llenar el disco y hacer que el servidor colapse.
- `/` (ext4): Raíz. Se le asigna un tamaño moderado, ya que el software del sistema operativo no crece significativamente con el tiempo.
- `/var` (ext4 o XFS): Muy grande. Aquí residen las bases de datos, los archivos de la aplicación web y los logs del sistema. Aislar /var en su propia partición garantiza que, si se llena por un ataque o un error de la aplicación, el resto del sistema (como la raíz) siga funcionando y permita al administrador ingresar a solucionar el problema.
- `/boot` (ext4): Pequeña (ej. 500 MB). Se aísla para asegurar que el sistema siempre tenga espacio para actualizar el núcleo (kernel) de Linux.
- `swap`: Dimensionada estratégicamente para evitar que el servidor cierre procesos de bases de datos por falta de RAM.

_Ejemplo 3: Estación de Trabajo para Diseño (CAD) y Multimedia_  
El renderizado y el diseño asistido por computadora manejan archivos extremadamente pesados. En este caso, el particionamiento suele dividirse a través de múltiples discos físicos para maximizar el ancho de banda y la capacidad.
- Disco 1 (SSD Rápido, ej. NVMe):
    - `/` o `C:`: Dedicada exclusivamente al sistema operativo y a la instalación de los programas de diseño (AutoCAD, suites de Adobe). Asegura tiempos de carga mínimos.
    - `swap` / Archivo de paginación: Ubicada en el SSD para que la memoria virtual responda lo más rápido posible durante renderizados intensivos.
- Disco 2 (HDD Externo o Secundario de gran capacidad, ej. 1TB):
    - `/datos` o `D:` (NTFS/exFAT): Un volumen masivo destinado únicamente al almacenamiento de assets, librerías de materiales, referencias externas (XREFs) y copias de seguridad. Separa la carga de lectura/escritura de los datos masivos del disco principal del sistema.

#### 5. ¿Es posible visualizar particiones del tipo FAT y NTFS (que son de Windows) en GNU/Linux?
GNU/Linux ofrece un soporte maduro para montar, leer y escribir en los filesystems FAT (FAT16, FAT32 y exFAT) y NTFS. Al igual que las particiones nativas de Linux (como `ext4`), las particiones FAT y NTFS se identifican como dispositivos de bloques en el directorio `/dev` (por ejemplo, `/dev/sdb1`).  
Para acceder a sus archivos, simplemente se deben montar en algún directorio vacío dentro de la jerarquía del sistema (por lo general dentro de `/mnt/` o `/media/`). Esto se puede hacer de forma manual mediante el comando mount en la terminal, o de forma permanente añadiendo una directiva en el archivo de configuración `/etc/fstab` para que la partición de Windows esté disponible automáticamente cada vez que se enciende la computadora.

#### 6. ¿Qué tipo de software para particionar existe? Menciónelos y compare.
Para crearlas, se utiliza software denominado particionador. Existen 2 tipos:
- *Destructivos*: permiten crear y eliminar particiones (fdisk).
- *No destructivo*: permiten crear, eliminar y modificar particiones (fips, gparted). Generalmente las distribuciones permiten hacerlo desde la interfaz de instalación.
Las herramientas CLI más a bajo nivel, como el fdisk o gdisk clásico, operan bajo el paradigma *destructivo* si se usan de forma aislada. Estos programas solo leen y editan la tabla de particiones (los metadatos que dicen dónde empieza y dónde termina un volumen), pero son "ciegos" al sistema de archivos (ext4, NTFS, etc.) que vive adentro. Si intentas achicar una partición solo con fdisk, el programa cortará el límite físico sin importarle si en esos sectores había archivos guardados, destruyendo la integridad de los datos.  
Las herramientas GUI Libres (como GParted, KDE Partition Manager) son un ejemplo de particionadores no destructivos. Cuando le indicas a GParted que achique una partición, el programa en realidad encadena varios comandos por debajo. Al hacer todo este proceso orquestado, protege la información del usuario.

### 8. Arranque (bootstrap) de un Sistema Operativo:
#### 1. ¿Qué es el BIOS? ¿Qué tarea realiza?
El BIOS (Basic Input/Output System) es un firmware de bajo nivel alojado en un chip de memoria no volátil (como una memoria EEPROM, tipo especial de ROM) en la placa base. Es el primer programa que se ejecuta de forma automática al encender la computadora.   
Sus tareas principales son:
- *POST* (Power-On Self Test): Inicializa, configura y verifica el correcto funcionamiento de los componentes de hardware críticos (CPU, memoria RAM, tarjeta de video, controladores de almacenamiento).
- *Secuencia de arranque*: Consulta una lista de prioridad configurada por el usuario para buscar un dispositivo de almacenamiento que contenga un sistema operativo (disco duro, unidad USB, red).
- *Delegación de control*: Una vez encontrado el disco de arranque, el BIOS lee su primer sector físico absoluto, lo copia en la memoria RAM y le cede el control del procesador a ese código para que continúe con la carga del sistema operativo.

#### 2. ¿Qué es UEFI? ¿Cuál es su función?
El UEFI (Unified Extensible Firmware Interface) es el estándar de firmware moderno diseñado para reemplazar al histórico BIOS, superando sus antiguas limitaciones técnicas (como los entornos de 16 bits) y ofreciendo un entorno de pre-arranque mucho más avanzado.  
Sus funciones y ventajas principales incluyen:
- *Gestión nativa de sistemas de archivos*: A diferencia del BIOS, que lee sectores físicos a ciegas, UEFI es capaz de interpretar sistemas de archivos (como FAT32). El UEFI busca directamente un archivo ejecutable (con extensión .efi) dentro de una partición especial dedicada al arranque, llamada ESP (EFI System Partition).
- *Secure Boot* (Arranque Seguro): Verifica mediante firmas criptográficas que el cargador de arranque y el núcleo del sistema operativo sean legítimos, bloqueando la ejecución de malware o rootkits que intenten cargarse antes que el sistema operativo.
- *Capacidad expandida*: Soporta de forma nativa discos de arranque de más de 2 TB trabajando en conjunto con la tabla de particiones GPT, además de ofrecer interfaces gráficas, soporte para mouse y conectividad de red antes de cargar el sistema operativo.

#### 3. ¿Qué es el MBR? ¿Qué es el MBC?
El *MBR* (Master Boot Record) es el primer sector físico (cilindro 0, cabeza 0, sector 1) de un disco duro estructurado bajo el esquema de particionado tradicional. Tiene un tamaño de exactamente 512 bytes. Su función es contener la información indispensable sobre la organización lógica del disco y las primeras instrucciones para el arranque.  
Dentro de esos 512 bytes, el MBR reserva 64 bytes para almacenar la Tabla de Particiones (limitada a 4 entradas primarias), 2 bytes para la firma y el resto se reserva para el código de ejecución inicial, llamado MBC.  
El *MBC* (Master Boot Code) es un pequeño programa ejecutable que ocupa los primeros 446 bytes del MBR. La tarea específica de este microprograma es:   
1. Leer la Tabla de Particiones que lo acompaña en el MBR.
2. Identificar cuál de las particiones está marcada con la bandera de "Activa" (*bootable*).
3. Ir al primer sector de esa partición específica (conocido como Volume Boot Record o *VBR*).
4. Cargar el código de ese VBR en la memoria RAM y cederle el control. Ese código es el que finalmente ejecutará el gestor de arranque real del sistema operativo.

#### 4. ¿A qué hacen referencia las siglas GPT? ¿Qué sustituye? Indique cuál es su formato.
Las siglas GPT hacen referencia a GUID Partition Table (Tabla de Particiones GUID). Es el estándar moderno introducido por la iniciativa UEFI para sustituir al anticuado esquema de particionado MBR (Master Boot Record), superando sus limitaciones críticas (como el límite de 4 particiones primarias y la incapacidad de gestionar discos mayores a 2 Terabytes). GPT abandona el uso de cilindros/cabezas/sectores (CHS) y utiliza un sistema de direccionamiento de bloques lógicos (LBA, Logical Block Addressing).   
Su estructura típica se compone de:
- LBA 0 (*MBR Protector*): Un falso MBR que marca todo el disco como ocupado por una única partición desconocida. Su función es engañar al software antiguo de particionamiento para que no sobrescriba accidentalmente el disco GPT al no entender su formato.
- LBA 1 (*Encabezado principal GPT*): Contiene las firmas que identifican el disco, la ubicación de la tabla de particiones, y sumas de comprobación (CRC32) para detectar si los datos del particionado se corrompieron.
- LBA 2 a 33 (*Entradas de partición*): Una matriz que define dónde empieza y termina cada partición en el disco, utilizando Identificadores Globales Únicos (GUID) de 128 bits para identificar el tipo de cada partición. De forma predeterminada, admite hasta 128 particiones primarias.
- LBA secundarios (*Backup*): A diferencia de MBR, GPT guarda una copia de seguridad exacta del encabezado y la matriz de particiones al final del disco (en los últimos bloques LBA), permitiendo la recuperación automática en caso de corrupción en los sectores iniciales (redundancia).

#### 5. ¿Cuál es la funcionalidad de un “Gestor de Arranque”? ¿Qué tipos existen? ¿Dónde se instalan? Cite gestores de arranque conocidos.
La funcionalidad de un gestor de arranque es cargar la imagen del kernel (sistema operativo) de alguna partición desde el disco duro hacia la memoria RAM, pasarle los parámetros iniciales necesarios, y cederle el control del procesador. Se ejecuta luego del código del BIOS.
Los hay de dos tipos: 
- *Gestores basados en BIOS* (Multietapa): Como el MBR tiene un tamaño pequeño, un gestor complejo no cabe ahí. Por lo tanto, se dividen en dos etapas:
    1. Primera Etapa: Se instala en el sector físico *MBR* (0,0,1) o en el *VBR* (Volume Boot Record) de una partición. Su única tarea es localizar y cargar la siguiente etapa.
    2. Segunda Etapa: Se instala en una partición estándar del disco, como por ejemplo, en el directorio `/boot`. Contiene el código complejo capaz de leer sistemas de archivos (`ext4`, `NTFS`) y mostrar menús.
- *Gestores basados en UEFI*: El firmware UEFI comprende sistemas de archivos nativamente. El gestor de arranque ya no requiere esconderse en sectores crudos del disco porque es un simple archivo ejecutable (con extensión `.efi`). Se instala dentro de una partición específica llamada *ESP* (EFI System Partition), la cual está formateada en `FAT32`.  

Gestores de arranque conocidos:
- *GRUB* (GRand Unified Bootloader): El gestor de arranque por excelencia en el ecosistema GNU/Linux moderno.
- Windows Boot Manager (`BOOTMGR`): El gestor nativo de los sistemas operativos de Microsoft.
- systemd-boot: Una alternativa moderna, ligera y exclusiva para sistemas UEFI, cada vez más popular en distribuciones Linux.
- *LILO* (Linux Loader): El precursor histórico de GRUB, actualmente en desuso.

#### 6. ¿Cuáles son los pasos que se suceden desde que se prende una computadora hasta que el Sistema Operativo es cargado (proceso de bootstrap)?
La transición desde una máquina apagada hasta un sistema operativo completamente funcional sigue una secuencia estandarizada:
1. Se empieza a ejecutar el código del BIOS.
2. El BIOS ejecuta el POST (_Power-On Self Test_).
3. El BIOS lee el sector de arranque (MBR).
4. Se carga el gestor de arranque (MBC).
5. El bootloader carga el kernel y el `initrd` (initial ram disk).
6. Se monta el `initrd` como sistema de archivos raíz (`/`) y se inicializan componentes esenciales (por ejemplo, el scheduler).
7. El Kernel ejecuta el proceso `init` y se desmonta el `initrd`.
8. Se lee el `/etc/inittab`.
9. Se ejecutan los scripts apuntados por el runlevel 1.
10. El final del runlevel 1 le indica que vaya al runlevel por defecto.
11. Se ejecutan los scripts apuntados por el runlevel por defecto.
12. El sistema está listo para ser usado.

#### 7. Analice el proceso de arranque en GNU/Linux y describa sus principales pasos.
1. **Fase de Hardware (Pasos 1-2)**: El ciclo comienza a nivel de placa base. El _BIOS_ inicia su ejecución y realiza el _POST_ para garantizar que los componentes físicos vitales (RAM, CPU, discos) respondan correctamente antes de ceder el control.
2. **Fase del Gestor de Arranque (Pasos 3-4)**: El _BIOS_ lee el primer sector físico del disco de arranque (_MBR_) y carga en la memoria el código del _MBC_ (Gestor de arranque o Bootloader, como GRUB).
3. **Fase del Kernel (Pasos 5-6)**: El Bootloader localiza y carga en la memoria RAM el núcleo (Kernel) del sistema operativo junto con el `initrd` (un sistema de archivos temporal). El Kernel utiliza este entorno en RAM para cargar controladores esenciales de almacenamiento que le permitirán leer el disco duro real.
4. **Fase de Espacio de Usuario (Pasos 7-12)**: Una vez montada la verdadera partición raíz, el `initrd` se descarta y el Kernel cede el control al primer proceso del sistema: `init`. Este proceso lee el archivo de configuración `/etc/inittab`, ejecutando en cascada los scripts de inicio de servicios (runlevels), pasando de un estado básico (runlevel 1) hasta alcanzar el nivel por defecto (ej. modo multiusuario con red), dejando el sistema operativo completamente operativo.

#### 8. ¿Cuáles son los pasos que se suceden en el proceso de parada (shutdown) de GNU/Linux?
El apagado es un procedimiento controlado diseñado para evitar la pérdida de datos y la corrupción del sistema de archivos. Sigue una secuencia inversa al arranque:
1. **Invocación y notificación**: El administrador ejecuta un comando de apagado (`shutdown`, `poweroff`, `halt`). El sistema bloquea nuevos inicios de sesión y notifica a los usuarios conectados que el sistema se va a apagar.
2. **Cambio de Runlevel**: El proceso principal (`init` o systemd) transiciona al nivel de ejecución de apagado (runlevel 0).    
3. **Terminación de procesos**: El sistema envía la señal `SIGTERM` a todos los procesos en ejecución para pedirles que guarden sus datos y se cierren ordenadamente. Tras unos segundos, envía la señal SIGKILL para destruir forzosamente cualquier proceso que se haya negado a cerrar.
4. **Sincronización a disco (Sync)**: Se vacían las memorias caché (buffers). Todos los datos temporales que estaban en la memoria RAM esperando ser escritos se guardan físicamente en el disco duro.
5. **Desmontaje de Sistemas de Archivos**: Se cierran las conexiones de red y se desmontan todas las particiones. La partición raíz (`/`) se re-monta en modo "solo lectura" para garantizar que no se escriba nada en el último milisegundo que pueda corromper el sistema.
6. **Corte de energía**: El Kernel envía la instrucción ACPI a la placa base para cortar el suministro eléctrico del hardware.

#### 9. ¿Es posible tener en una PC GNU/Linux y otro Sistema Operativo instalado? Justifique.
Sí, es posible mediante el Dual Boot. Esto se logra gracias a dos conceptos fundamentales:
- Particionamiento del disco: Dividiendo el disco, se puede asignar una partición (con filesystem NTFS) para alojar Windows y otra partición (con filesystem ext4) para alojar GNU/Linux. Cada sistema operativo cree que tiene su propio disco y no interfiere con los archivos del otro.
- Gestor de Arranque: Al instalar GNU/Linux junto a otro sistema, se instala un gestor de arranque avanzado (como GRUB) en el MBR o en la partición ESP (si es UEFI). Cuando la PC enciende y el BIOS/UEFI le cede el control a GRUB, este pausa el arranque y despliega un menú en pantalla, dándole la opción al usuario de elegir qué núcleo cargar en la memoria RAM (el de Windows o el de Linux), permitiendo usar ambos sistemas en el mismo hardware sin conflictos.

### 9. Archivos y editores:  
#### 1. ¿Cómo se identifican los archivos en GNU/Linux?  
En GNU/Linux, los archivos se identifican y gestionan de forma muy diferente a los sistemas Windows.  
Se identifican mediante dos pilares fundamentales:

1. Inodos (*Index Nodes*): A nivel del sistema de archivos, el nombre es secundario. **Cada archivo posee un inodo único**. Este inodo es una estructura de datos que **almacena toda la metadata del archivo** (propietario, permisos de lectura/escritura/ejecución, tamaño, fechas de modificación) y **también los punteros a los bloques físicos del disco** donde residen los datos.
2. Contenido interno (*Magic Numbers*): Al **no depender de las extensiones** (como .txt, .pdf o .exe) para saber qué tipo de archivo es, el sistema operativo **lee los primeros bytes del encabezado del archivo** (conocidos como "números mágicos") para determinar su formato real. Las extensiones en Linux son meramente convenciones para la comodidad visual del usuario.  

Además, hay que recordar que los nombres de archivo son estrictamente sensibles a mayúsculas y minúsculas (*case sensitive*).

#### 2. Investigue el funcionamiento de los editores vim, nano y mcedit, y los comandos cat, more y less.  
Editores:
- `vim` (Vi IMproved): Es un editor avanzado que **funciona mediante "modos"**. Al abrirlo, inicia en Modo Comando (las teclas sirven para navegar, borrar o copiar texto). Para poder escribir, se debe presionar la tecla `i` para entrar al Modo Inserción. Es extremadamente rápido y está preinstalado en la mayoría de los servidores Unix/Linux.
- `nano`: Es un editor más intuitivo. **No tiene modos ocultos**; al abrirlo, el teclado escribe inmediatamente en el documento. Las combinaciones de teclas se muestran siempre en la parte inferior de la pantalla, como `Ctrl + O` para guardar y `Ctrl + X` para salir.
- `mcedit`: Es el editor integrado de la herramienta Midnight Commander. Posee una interfaz visual que es similar a los editores clásicos de MS-DOS. Utiliza atajos basados en las teclas de función, como `F2` para guardar y `F10` para salir.  

Comandos:
- `cat`: Concatena archivos y los **imprime por completo** en la pantalla. Si el archivo tiene cientos de líneas, el texto pasará a toda velocidad y solo podrás leer el final. *Es útil solo para archivos muy cortos*.
- `more`: Es un paginador básico. Muestra el contenido del archivo **deteniéndose al llenar la primera pantalla**. Permite avanzar página por página (con la barra espaciadora) o línea por línea (con Enter), *pero no permite retroceder*.
- `less`: Es un paginador avanzado ("less is more"). A diferencia de cat, **no carga todo el archivo en la memoria RAM**, lo que lo hace *ideal para revisar registros enormes* (logs). Permite navegar libremente hacia arriba y hacia abajo con las flechas del teclado, y realizar búsquedas de texto interactivo.

#### 3. Cree un archivo llamado “prueba.exe” en su directorio personal usando el vim. El mismo debe contener su número de alumno y su nombre.  
1. Instalar vim *(requiere privilegios de administrador)*:
```bash
sudo apt update && sudo apt install vim
```
2. Crear y abrir el archivo en el directorio personal:
```bash
vim ~/prueba.exe
```
3. Presionar `i` para entrar al Modo Inserción.
4. Escribe tus datos reales:
```plaintext
Alumno: 027606/0
Nombre: Matias Chamorro
```
5. Presionar `Esc` para salir del Modo Inserción.
6. Escribir `:wq` y presiona `Enter` para escribir (*write*) los cambios en el disco y salir (*quit*).

#### 4. Investigue el funcionamiento del comando file. Pruébelo con diferentes archivos. ¿Qué diferencia nota?  
El comando `file` sirve para descubrir la naturaleza de un archivo. Lee los "números mágicos" (descritos antes) en lugar de "ver cómo se llama".   
*Ejemplo 1: El archivo recién creado*
```bash
file ~/prueba.exe
```
Esto muestra `prueba.exe: ASCII text` a pesar de tener la extensión de aplicación de Windows `.exe`, ya que el comando inspecciona el archivo y se da cuenta de que adentro solo existe texto plano, por lo que lo clasifica como tal.  
  
*Ejemplo 2: Un ejecutable real, el comando de listar directorios*
```bash
file /bin/ls
```
Esto muestra `/bin/ls: ELF 64-bit LSB pie executable, x86-64...` ya que, a pesar de no tener ninguna extensión (`.exe`, `.bin` o alguna otra) el comando lee su cabecera y descubre que es un binario *ELF* (Executable and Linkable Format), el cual es el formato estándar para ejecutables en GNU/Linux.

#### 5. Investigue la funcionalidad y parámetros de los siguientes comandos relacionados con el uso de archivos: 
1. `cd` (_Change Directory_): Cambia el directorio de trabajo actual en la terminal.
    - `cd` *sin parámetros* (o `cd ~`) te lleva directamente al directorio personal (`/home/usuario`).
    - `cd ..`: Sube un nivel en el árbol de directorios (*al directorio padre*).
    - `cd -`: Regresa *al último directorio* en el que estuviste ubicado antes del cambio actual.
2. `mkdir` (_Make Directory_): Crea uno o varios directorios nuevos.
    - `mkdir -p` (*parents*): Crea directorios anidados de una sola vez y no devuelve error si el directorio ya existe. Ejemplo: `mkdir -p /home/usuario/carpeta1/carpeta2.`
    - `mkdir -v` (*verbose*): Imprime un mensaje confirmando la creación de cada directorio.
3. `rmdir` (_Remove Directory_): Elimina directorios solo si están completamente vacíos. (Para borrar directorios con contenido se utiliza `rm -r`).
    - `rmdir -p`: Elimina una jerarquía de directorios vacíos. Por ejemplo, `rmdir -p carpeta1/carpeta2/carpeta3` elimina `carpeta3`, luego `carpeta2`, y finalmente `carpeta1`.
4. `ln` (_Link_): Crea enlaces entre archivos (similar a los accesos directos). Por defecto, crea un enlace duro (**hard link**), que apunta al *mismo inodo físico* del archivo original.
    - `ln -s` (*symbolic*): Crea un enlace simbólico (**soft link**). Apunta *a la ruta del archivo*, no a sus datos físicos. Es el más utilizado, ya que permite enlazar directorios y cruzar distintos sistemas de archivos.
    - `ln -f` (*force*): Si ya existe un archivo de destino con el mismo nombre, *lo sobrescribe* sin preguntar.
5. `tail`: Muestra por pantalla la parte final de un archivo de texto (por defecto, las últimas 10 líneas).
    - `tail -n [número]`: Especifica la cantidad exacta de líneas a mostrar. Ejemplo: `tail -n 20 archivo.txt`.
    - `tail -f` (*follow*): Mantiene el archivo abierto y muestra en tiempo real las nuevas líneas que se van agregando. Es una herramienta fundamental para, por ejemplo, monitorear archivos de registro (logs).
6. `locate`: Busca archivos y directorios de forma casi instantánea. No lee el disco duro en tiempo real, sino que *consulta una base de datos interna indexada* previamente (que se actualiza con el comando `updatedb`).
    - `locate -i` (*ignore case*): Realiza la búsqueda ignorando diferencias entre mayúsculas y minúsculas.
    - `locate -c` (*count*): En lugar de listar las rutas, solo devuelve el número total de coincidencias encontradas.
7. `ls` (_List_): Lista el contenido (archivos y carpetas) del directorio actual o del que se le indique.
    - `ls -l` (*long format*): Muestra información detallada: permisos, número de enlaces, propietario, grupo, tamaño en bytes y fecha de modificación.
    - `ls -a` (*all*): Muestra todos los archivos, incluyendo los archivos y directorios ocultos (aquellos cuyo nombre empieza con un punto .).
    - `ls -h` (*human-readable*): Junto con `-l`, muestra el tamaño de los archivos en formatos legibles (K, M, G) en lugar de bytes. Ejemplo: `ls -l -h`.
    - `ls -R` (*recursive*): Lista el contenido del directorio y también el de todos sus subdirectorios.
8. `pwd` (_Print Working Directory_): Imprime en pantalla la ruta absoluta del directorio en el que te encuentras posicionado actualmente. Por ejemplo: desde carpeta2 se vería asi `/home/iso/carpeta1/carpeta2`.
    - `pwd -P` (*physical*): Si estviera ubicado dentro de un directorio que en realidad es un enlace simbólico, este parámetro revela la ruta física real donde residen los datos.
9. `cp` (_Copy_): Copia archivos y directorios de un origen a un destino.
    - `cp -r` o `cp -R` (*recursive*): Obligatorio para copiar directorios enteros, incluyendo todos los archivos y subdirectorios que contengan.
    - `cp -i` (*interactive*): Pregunta antes de sobrescribir un archivo si en el destino ya existe uno con el mismo nombre.
    - `cp -u` (*update*): Copia solo si el archivo de origen es más nuevo que el de destino, o si el archivo no existe en el destino.
10. `mv` (_Move_): Mueve archivos o directorios de una ruta a otra. Este comando también es el que se utiliza para renombrar archivos (es decir, *"mover" el archivo al mismo directorio pero con otro nombre*).
    - `mv -i` (*interactive*): Pide confirmación antes de sobrescribir un archivo existente.
    - `mv -n` (*no-clobber*): Evita que se sobrescriba cualquier archivo existente en el directorio de destino.
    - `mv -v` (*verbose*): Muestra por pantalla qué archivos están siendo movidos o renombrados.
11. `find`: Busca archivos en tiempo real recorriendo el árbol de directorios de manera exhaustiva. A diferencia de `locate`, es más lento pero inmensamente más preciso, permitiendo filtrar por casi cualquier atributo del archivo.
    - `find -name "patrón"`: Busca archivos por nombre exacto o utilizando comodines. Ejemplo: `find / -name "*.conf"`. Usando `-iname` también podemos ignorar mayúsculas.
    - `find -type [f/d]`: Limita la búsqueda a solo archivos regulares si usamos `f` o solo directorios si usamos `d`.
    - `find -size [+/-]tamaño`: Busca archivos por tamaño. Ejemplo: `find -size +50M` busca archivos de más de 50 Megabytes.
    - `find -exec [comando] {} \;`: Permite ejecutar un comando sobre cada archivo encontrado automáticamente    
    Ejemplo: buscar todos los archivos con extensión `.tmp` en el directorio personal y borrarlos (`rm`):
```bash
        find ~/ -name "*.tmp" -exec rm -v {} \;
```  
- `find ~/ -name "*.tmp"`: Busca en tu directorio personal todo lo que termine en `.tmp`.  
- `-exec rm -v`: Indica que se ejecutará el comando de borrado (con `-v` para que imprima en pantalla lo que borra).  
- `{}`: Es un comodín. `find` reemplaza estas llaves por la ruta de cada archivo que va encontrando.  
- `\;`: Es obligatorio para indicarle a `find` dónde termina el comando que debe ejecutar. (La barra invertida `\` sirve para que la terminal no interprete el punto y coma como un salto de línea propio).  


### 10. Indique qué comando es necesario utilizar para realizar cada una de las siguientes acciones. Investigue su funcionamiento y parámetros más importantes:  
#### 1. Cree la carpeta ISOCSO  
```bash
mkdir ISOCSO
```

#### 2. Acceda a la carpeta  
```bash
cd ISOCSO
```

#### 3. Cree dos archivos con los nombres isocso.txt e isocso.csv  
Usando el comando `cat` con redirección (`>`):
```bash
cat > isocso.txt
cat > isocso.csv
```
Tocamos `Ctrl + D` para retomar el control de la terminal.

#### 4. Liste el contenido del directorio actual  
```bash
ls 
```

#### 5. Visualizar la ruta donde estoy situado  
```bash
pwd
```

#### 6. Busque todos los archivos en los que su nombre contiene la cadena “iso*”  
```bash
find -name "iso*"
```

#### 7. Informar la cantidad de espacio libre en disco  
Para conocer la cantidad de espacio libre y ocupado en las unidades de almacenamiento en GNU/Linux, el comando estándar es `df` (*disk free*). Agregando el parámetro `-h` (*human-readable*) para la conversión a valores en Mb, Gb o Tb.  
Algunas de las columnas mostradas por `df` son:
- Tamaño (*Size*): La capacidad total de esa partición.
- Usado (*Used*): La cantidad de espacio que ya está ocupado por archivos.
- Disponible (*Avail*): El espacio libre real que te queda para guardar datos.
- Uso% (*Use%*): El porcentaje del disco que ya está lleno.
- Montado en (*Mounted on*): El  directorio donde está conectada esa partición (por ejemplo, `/` para la raíz, o `/home` para los usuarios).
```bash
df -h
```

#### 8. Verifique los usuarios conectados al sistema  
Tenemos tres variantes:  
- Usando `users` solo veríamos los nombres de los usuarios conectados al sistema.
- Usando `who` también veríamos la terminal que está usando la fecha y hora de inicio de sesión y la dirección IP (si tiene).
- Usando `w` veríamos todo lo anterior, sumando cuánto tiempo lleva el usuario sin presionar ninguna tecla (IDLE), los recursos de procesador que están consumiendo sus procesos (JCPU y PCPU) y qué comando o aplicación exacta está ejecutando ese usuario en este preciso instante (WHAT).
```bash
users
```

#### 9. Editar a el archivo isocso.txt e ingresar Nombre y Apellido 
```bash
vim isocso.txt
```
Tocando `i` para entrar a modo Inserción:
```plaintext
Nombre y Apellido: Matias Chamorro
```
Tocando `Esc` para salir de modo Inserción y luego escribiendo `:wq`, guardamos los cambios y cerramos.

#### 10. Mostrar en pantalla las últimas líneas de un archivo.
```bash
tail isocso.txt
```

### 11. Investigue el objetivo, parámetros y ubicación (directorio) de los siguientes comandos:  
1. `man` (_Manual_): Despliega el manual de usuario completo de cualquier comando del sistema, detallando su uso, sintaxis y funcionamiento interno.
    - `man [sección 1-9] [comando]`: Abre una sección específica del manual. Ejemplo `man 5 passwd` para el formato del archivo de `passwd`.
    - `man -k [palabra_clave]`: Busca la palabra clave en las descripciones cortas de todos los manuales. Essimilar a `apropos`.  
    **Ubicación**: `/usr/bin/man`
2. `shutdown`: Apaga o reinicia el sistema de forma segura, cerrando procesos ordenadamente y notificando a los usuarios conectados.
    - `shutdown -h` (*halt / poweroff*): Detiene el sistema y corta la energía.
    - `shutdown -r` (*reboot*): Reinicia el sistema .
    - `shutdown -c`: Cancela un apagado que ya había sido programado.
    - `shutdown [tiempo]`: Define cuándo ejecutarlo. Ejemplo: `now` para inmediato, `+5` para dentro de 5 minutos, `23:00` para una hora específica.  
    **Ubicación**: `/usr/sbin/shutdown` (Es un enlace simbólico a `systemctl`).
3. `reboot`: Reinicia el sistema operativo.
    - `reboot -f` (*force*): Fuerza el reinicio inmediato sin invocar el apagado seguro de procesos (*peligroso para los datos*).
    - `reboot -p` (*poweroff*): Apaga la máquina en lugar de reiniciarla.  
    **Ubicación**: `/usr/sbin/reboot`
4. `halt`: (_runlevel 0_) Detiene todas las funciones del procesador.
    - `halt -f` (*force*): Detiene el sistema violentamente sin sincronizar discos.
    - `halt -p` (*poweroff*): Corta la energía tras detener el sistema.  
    **Ubicación**: `/usr/sbin/halt`
5. `uname`: Imprime información fundamental sobre el sistema operativo, la arquitectura del hardware y la versión del Kernel.
    - `uname -a` (*all*): Muestra toda la información disponible.
    - `uname -r` (*release*): Muestra únicamente la versión exacta del Kernel.
    - `uname -n` (*nodename*): Muestra el nombre de la máquina en la red.  
    **Ubicación**: `/usr/bin/uname`
6. `dmesg` (_Display Message_ o _Driver Message_): Muestra el *ring buffer* del Kernel. Es decir, imprime todos los mensajes generados por el núcleo durante el proceso de arranque (*POST* de hardware, carga de drivers, discos detectados). 
    - `dmesg -T` (*human-readable timestamps*): Convierte los tiempos de los mensajes a un formato de fecha y hora legible.
    - `dmesg -c` (*clear*): Muestra el contenido del buffer y luego lo borra.
    - `dmesg -w` (*follow*): Mantiene la salida abierta esperando nuevos mensajes de hardware en tiempo real.  
    **Ubicación**: `/usr/bin/dmesg`
7. `lspci` (_List PCI_): Muestra una lista detallada de todos los dispositivos conectados a los buses PCI y PCIe de la placa base (tarjetas de red, tarjetas de video, controladores de almacenamiento).
    - `lspci -v` (*verbose*): Muestra detalles adicionales sobre cada dispositivo.
    - `lspci -vv`: Muestra **toda** la información técnica disponible.
    - `lspci -k`: Muestra qué módulo (*driver*) del Kernel está administrando actualmente a cada dispositivo.  
    **Ubicación**: `/usr/bin/lspci`
8. `at`: Programa la ejecución de un comando o un script para que se ejecute una sola vez en un momento específico del futuro (a diferencia de `cron`, que es para tareas recurrentes).
    - `at -l`: Lista los trabajos que están encolados esperando ejecutarse (es un alias del comando `atq`).
    - `at -r [ID]`: Elimina un trabajo de la cola usando su número de ID (es un alias de `atrm`).
    - `at -f [archivo]`: Lee los comandos a ejecutar desde un archivo de texto en lugar de la entrada estándar.  
    **Ubicación**: `/usr/bin/at` (en máquinas virtuales limpias a veces no viene instalado, se instala con `sudo apt install at`)
9. `head`: Muestra en pantalla el comienzo de un archivo de texto (por defecto, las primeras 10 líneas).
    - `head -n [número]`: Define la cantidad exacta de líneas a mostrar desde el principio.
    - `head -c [número]`: Muestra una cantidad específica de bytes en lugar de líneas.  
    **Ubicación**: `/usr/bin/head`
10. `tail`: Muestra por pantalla la parte final de un archivo de texto (por defecto, las últimas 10 líneas).
    - `tail -n [número]`: Especifica la cantidad exacta de líneas a mostrar. Ejemplo: `tail -n 20 archivo.txt`.
    - `tail -f` (*follow*): Mantiene el archivo abierto y muestra en tiempo real las nuevas líneas que se van agregando. Es una herramienta fundamental para, por ejemplo, monitorear archivos de registro (logs).  
    **Ubicación**: `/usr/bin/tail`

### 12. Proceso de Arranque SystemV :  
#### 1. Enumere los pasos del proceso de inicio de un sistema GNU/Linux, desde que se prende la PC hasta que se logra obtener el login en el sistema.  
1. Se empieza a ejecutar el código del BIOS.
2. El BIOS ejecuta el POST.
3. El BIOS lee el sector de arranque (MBR).
4. Se carga el gestor de arranque (MBC).
5. El bootloader carga el kernel y el initrd (initial ram disk).
6. Se monta el initrd como sistema de archivos raíz y se inicializan componentes esenciales (por ejemplo, el scheduler).
7. El Kernel ejecuta el proceso init y se desmonta el initrd.
8. Se lee el /etc/inittab.
9. Se ejecutan los scripts apuntados por el runlevel 1.
10. El final del runlevel 1 le indica que vaya al runlevel por defecto.
11. Se ejecutan los scripts apuntados por el runlevel por defecto.
12. El sistema está listo para ser usado.

#### 2. Proceso INIT. ¿Quién lo ejecuta? ¿Cuál es su objetivo? 
El proceso `init` es ejecutado por el Kernel. En SysV init, se lo configura a través del archivo `/etc/inittab`.  
Su función es cargar todos los subprocesos necesarios para el correcto funcionamiento del sistema operativo.  
El proceso init (ejecutado desde `/sbin/init`) posee el PID 1, no tiene padre y es el padre de todos los procesos (**pstree**).  
Es el encargado de montar los filesystems y de hacer disponible los demás dispositivos.

#### 3. RunLevels. ¿Qué son? ¿Cuál es su objetivo?  
El proceso de arranque se divide en niveles o *runlevels*. Cada runlevel es **responsable de iniciar o parar una serie de servicios**, ya sea al entrar al Runlevel (*arranque*) o al salir de éste (*apagado*). Acorde al estándar, existen 7 (numerados del 0 al 6) y se encuentra definido cuáles deben ejecutarse en el archivo `/etc/inittab`. Por otro lado, es en `/etc/init.d` donde se guardan los scripts a ejecutar.


#### 4. ¿A qué hace referencia cada nivel de ejecución según el estándar? ¿Dónde se define qué Runlevel ejecutar al iniciar el sistema operativo? ¿Todas las distribuciones respetan estos estándares?  
Acorde al estándar, existen 7 Runlevels, numerados del 0 al 6:  
<ol start="0">
<li>halt (*parada o apagado*).</li>
<li>single-user mode (*modo monousuario*).</li>
<li>multi-user without network support (*multiusuario sin soporte de red*).</li>
<li>multi-user console mode (*modo multiusuario en consola*).</li>
<li>N/A (no se utiliza).</li>
<li>X11 (*modo multiusuario con entorno gráfico basado en X.org*).</li>
<li>reboot (*reinicio*)  </li>
</ol>
Los Runlevels son definidos en el archivo `/etc/inittab`. No en todas las distribuciones de GNU/Linux se usa el mismo Runlevel para arrancar el sistema operativo, por ejemplo: por defecto es Runlevel 3 en Redhat y Runlevel 2 en Debian.

#### 5. Archivo /etc/inittab. ¿Cuál es su finalidad? ¿Qué tipo de información se almacena en el? ¿Cuál es la estructura de la información que en él se almacena?  
Una vez que el Kernel ejecuta el proceso init y se desmonta el initrd, se ejecutan los Runlevels empezando por el 1. Estos que se encuentran definidos en el archivo `/etc/inittab` de la siguiente forma:  
`id:runlevels:acción:proceso`  
- *id*: identifica la entrada en inittab (1 a 4 caracteres).
- *runlevels*: el/los runlevels en los que se realiza la acción.
- *acción*: indica cómo se ejecutará proceso wait, initdefault, ctrlaltdel, off, respawn, once, sysinit, boot, bootwait, powerwait, etc.
- *proceso*: el comando exacto que será ejecutado.

#### 6. Suponga que se encuentra en el runlevel `X`. Indique qué comando(s) deberá ejecutar para cambiar al runlevel `Y`. ¿Este cambio es permanente? ¿Por qué?  
Si estamos en un `runlevel X` y busco pasar al `runlevel Y`, el comando estándar a ejecutar es el siguiente como administrador (root) es:
```bash
init Y
```

Por ejemplo, se puede cambiar al runlevel 3 (*modo texto multiusuario*) ejecutando `init 3`, o apagar el equipo manualmente, puedes ejecutar `init 0`.  
Esto no es permanente, ya que solo afecta a la sesión de trabajo actual que se encuentra cargada en la memoria RAM. Esto es porque el sistema operativo, en el proceso de bootstrap, lee el archivo de configuración alojado en `/etc/inittab` para averiguar cuál es el estado (Runlevel) predeterminado. Al ejecutar el comando `init Y`, se obliga al Kernel a cambiar de estado en ese momento, pero no se modifica `/etc/inittab`. Al reiniciar la computadora, el sistema volverá a leerlo y arrancará en el Runlevel predeterminado original.


#### 7. Scripts RC. ¿Cuál es su finalidad? ¿Dónde se almacenan? Cuando un sistema GNU/Linux arranca o se detiene se ejecutan scripts, indique cómo determina qué script ejecutar ante cada acción. ¿Existe un orden para llamarlos? Justifique.  
Los scripts RC son pequeños archivos de texto ejecutables (programados en bash) cuya única finalidad es iniciar, detener o reiniciar los servicios del sistema de forma automática y controlada durante el arranque, el apagado o al cambiar de un Runlevel a otro.
  
Los scripts, los cuales son **los que se ejecutan**, se almacenan todos en un único directorio general: `/etc/init.d`.  
En cambio, para organizar en qué runlevel se ejecuta cada uno, existen directorios separados para cada estado en `/etc/rcX.d` (donde `X` es un número de runlevel entre 0 y 6). En estos directorios se guardan **links simbólicos** a los archivos que hay en `/etc/init.d`.  
  
El proceso `init` sabe qué acción tomar analizando la letra inicial con la que fue nombrado el enlace simbólico:
- Si el enlace empieza con la letra `S` (*Start*): El sistema asume que el servicio debe levantarse. Llama al script pasándole el parámetro start.
- Si el enlace empieza con la letra `K` (*Kill*): El sistema asume que el servicio debe detenerse. Llama al script pasándole el parámetro stop.  
  
_Ejemplo: Si se entra al Runlevel 0 (apagado), el sistema revisará el directorio `/etc/rc0.d/` y encontrará enlaces que empiezan con `K`, para lo cual procederá a matar todos esos servicios._  
  
Existe un orden estricto para llamar los Runlevels, este es crítico debido a las dependencias entre los servicios. El orden se determina mediante un número de dos dígitos colocado inmediatamente después de la letra `S` o `K` en el nombre del enlace simbólico. El sistema luego los ejecutará en orden numérico ascendente. _Ejemplo: `S10network`, `S20apache2`, `S50mysql`._

### 13. SystemD:  
#### 1. ¿Qué es systemd?  
Systemd es un administrador de sistemas y servicios para sistemas operativos GNU/Linux que **actúa como el proceso init** de la máquina. Al ser el primer proceso que ejecuta el Kernel, **recibiendo el PID 1**, se encarga de centraliza la **administración de demonios** (servicios) **y librerías** del sistema.  
Fue diseñado para reemplazar al SysV init con el objetivo de superar sus limitaciones. Sus principales ventajas son la paralelización masiva; ya que inicia servicios al mismo tiempo en lugar de uno por uno, reduciendo drásticamente el tiempo de arranque; y la gestión avanzada de dependencias y el inicio de servicios bajo demanda (*socket-based activation*).

#### 2. ¿A qué hace referencia el concepto de Unit en SystemD? 
En Systemd, una *Unit* es el bloque de construcción fundamental; representa cualquier recurso, servicio o entidad que el sistema sabe cómo administrar y configurar.  
A diferencia de SysV init, que usaba scripts de bash, Systemd usa archivos de texto plano declarativos, similares a los archivos `.ini`, para definir estas unidades. Cada unidad tiene un nombre y una extensión que indica su tipo:
- `.service`: controla un servicio particular. Es el reemplazo directo de los scripts RC.
- `.socket`: encapsula IPC, un socket del sistema o file system FIFO.
- `.target`: agrupa *units* y establece puntos de sincronización durante el arranque. Es el reemplazo directo de los Runlevels.
- `.snapshot`: almacena el estado de un conjunto de unidades para que pueda ser restablecido más tarde.  
  
Las units pueden tener dos estados: `active` o `inactive`.

#### 3. ¿Para qué sirve el comando systemctl en SystemD?  
El comando `systemctl` es la herramienta principal de la interfaz CLI usada para **inspeccionar y controlar el estado del administrador del sistema** (*Systemd*) y de sus unidades. Centraliza todas las tareas de administración, incluyendo ejemplos como:
- Arrancar o detener servicios en tiempo real: `systemctl start [unidad]` o `systemctl stop [unidad]`.
- Verificar el estado y los logs recientes de un servicio: `systemctl status [unidad]`.
- Habilitar o deshabilitar un servicio para que arranque automáticamente junto con el sistema operativo: `systemctl enable [unidad]` o `systemctl disable [unidad]`.

#### 4. ¿A qué hace referencia el concepto de target en SystemD? 
Un target (*objetivo*) es un tipo especial de unidad en Systemd (con extensión `.target`) cuyo único propósito es agrupar otras unidades para crear puntos de sincronización y estados del sistema.  
En lugar de tener niveles numerados (1 al 6), Systemd utiliza nombres descriptivos basados en dependencias. Ejemplos:
- `multi-user.target`: Agrupa todos los servicios necesarios para tener un sistema de texto con red funcional (equivale al **Runlevel 3**).
- `graphical.target`: Depende del multi-user.target, pero le suma las unidades necesarias para levantar la interfaz gráfica (equivale al **Runlevel 5**).
- `poweroff.target`: Apagado. (equivale al **Runlevel 0**).  
  
Para cambiar de estado operativo: en lugar de usar `init 3`, en Systemd se ejecuta `systemctl isolate multi-user.target`.

#### 5. Ejecutar el comando pstree. ¿Qué es lo que se puede observar a partir de la ejecución de este comando? 
El comando `pstree` (Process Tree) se utiliza para mostrar los procesos actualmente en ejecución en el sistema en un formato de *árbol jerárquico*. Pudiendo observar visualmente la relación de parentesco entre todos los programas de la computadora.   
Observando la raíz del árbol podemos ver:
- *Systemd en la cúspide*: El nodo principal del cual nacen absolutamente todas las ramas es el proceso `systemd`.
- *Confirmación del PID 1*: Al ser `systemd` el primer proceso cargado por el Kernel, todos los demás servicios, aplicaciones de usuario y terminales en el sistema operativo son, directa o indirectamente, procesos "hijos" que fueron lanzados por él.   

### 14. Usuarios:  
#### 1. ¿Qué archivos son utilizados en un sistema GNU/Linux para guardar la información de los usuarios?
En un sistema GNU/Linux, la información de los usuarios no se guarda en un solo lugar, sino que se distribuye principalmente en dos archivos de texto plano (y un tercero para los grupos), separando la información pública de la información de seguridad:
- `/etc/passwd`: Es la base de datos principal de los usuarios. Contiene **una línea por cada usuario** registrado en el sistema. Es de lectura pública (cualquiera puede verlo). Cada línea guarda: 
    - El nombre de usuario.
    - Una `x` en donde, en versiones antiguas, estaba la contraseña
    - El UID. 
    - El GID principal
    - Un comentario (GECOS, que suele ser el nombre real).
    - La ruta de su directorio personal (`/home/usuario`).
    - La shell que se ejecutará al iniciar sesión (ejemplo: `/bin/bash`). 
- `/etc/shadow`: Es el archivo de contraseñas en la sombra. **Solo el usuario root tiene permisos para leerlo**. Aquí se almacena la contraseña real de cada usuario (encriptada mediante un algoritmo de hash unidireccional), junto con las políticas de caducidad de la clave.
- `/etc/group`: Almacena la información de los grupos del sistema, vinculando a los usuarios con sus respectivos identificadores de grupo.

#### 2. ¿A qué hacen referencia las siglas UID y GID? ¿Pueden coexistir UIDs iguales en un sistema GNU/Linux? Justifique. 
**UID** (*User Identifier*): Es un número entero que el sistema operativo asigna a cada usuario. A nivel interno, en el Kernel y en el filesystem, GNU/Linux no entiende "nombres de usuario"; todo el control de permisos, propiedad de archivos y ejecución de procesos se gestiona exclusivamente a través de este número UID.  
**GID** (*Group Identifier*): Es el equivalente numérico para identificar a los grupos. Define a qué colectivo pertenece un usuario para heredar los permisos grupales sobre un archivo o directorio.
**Es posible** coexistir UIDs iguales, aunque **es una mala práctica**, ya que como los archivos `/etc/passwd` y `/etc/shadow` son simples archivos de texto, el administrador puede editarlos y asignarle el mismo número UID a dos nombres de usuario distintos. Haciendo esto, dado que el Kernel de Linux toma sus decisiones de seguridad basándose únicamente en el número UID y no en el nombre, para el sistema operativo ambos usuarios son exactamente la misma entidad, tendrán los mismos permisos, leerán los mismos archivos y podrán matar los procesos del otro.

#### 3. ¿Qué es el usuario root? ¿Puede existir más de un usuario con este perfil en GNU/Linux? ¿Cuál es la UID de root? 
Es el **superusuario o administrador del sistema**. Es el único perfil que no está sujeto a las restricciones de permisos del sistema de archivos. Puede leer, modificar o eliminar cualquier archivo, cambiar las contraseñas de cualquier persona, matar cualquier proceso, abrir puertos de red privilegiados e instalar software a nivel global.  
Es posible que exista más de un usuario con el perfil `root` si un administrador edita el archivo `/etc/passwd` y crea un nuevo usuario, y le asigna manualmente *el mismo UID que tiene root*, ese nuevo usuario se convertirá en un superusuario con poder absoluto. El sistema operativo lo tratará con los mismos privilegios exactos, ya que es un alias de `root`.  
La UID de root es siempre `0`. En GNU/Linux, **cualquier cuenta de usuario que posea el UID `0`** es, por definición, el superusuario.

#### 4. Agregue un nuevo usuario llamado isocso a su instalación de GNU/Linux, especifique que su home sea creada en /home/isocso, y hágalo miembro del grupo informatica (si no existe, deberá crearlo). Luego, sin iniciar sesión como este usuario cree un archivo en su home personal que le pertenezca. Luego de todo esto, borre el usuario y verifique que no queden registros de él en los archivos de información de los usuarios y grupos.  
Todos los comandos de gestión de usuarios afectan directamente al sistema de archivos raíz y deben ejecutarse con **privilegios de superusuario** por lo que debemos tener permisos de sudoers para cada instrucción.  
Se crea el grupo de forma manual en el sistema ejecutando:
```bash
sudo groupadd informatica
```
*Para verificar el éxito de la creación del grupo ejecutamos* `grep informatica /etc/group`*, debería verse el nombre del grupo impreso en pantalla junto al GID.*  
  
Luego se crea el usuario indicando explícitamente que genere su directorio personal (-m), especificando la ruta de su home (-d) y asignándolo al grupo principal que acabas de crear (-g):
```bash
sudo useradd -m -d /home/isocso -g informatica isocso
```
*Para verificar el éxito de la creación del usuario ejecutamos* `id isocso`. *debería devolver su UID numérico y confirmar que pertenece al GID de informatica.*  
  
Se crea el archivo directamente en su directorio usando `touch` y luego se le transfiere la propiedad del mismo usando `chown` (*change owner*):
```bash
sudo touch /home/isocso/archivo_prueba.txt
sudo chown isocso:informatica /home/isocso/archivo_prueba.txt
```
*Para verificar que el usuario* `isocso` *es el dueño legítimo ejecutamos* `sudo ls -l /home/isocso/archivo_prueba.txt`. *debería aparecer* `isocso` *como propietario en la tercera columna.*   
  
Para borrar el usuario `isocso` y verificar que no queden registros de él en los archivos de información de los usuarios y grupos, usamos el parámetro `-r` (*recursive*) del comando `userdel`, eliminando por completo su directorio `/home/isocso` y todos los archivos en su interior:
```bash
sudo userdel -r isocso
```
*Para verificar que que la cuenta y sus datos fueron eliminados ejecutamos* `id isocso`*, esto debería imprimir "no existe el usuario", y luego ejecutamos `sudo ls -d /home/isocso`, que debería indicar que "No existe el archivo o el directorio".*   
  
También usamos el comando `grep` para buscar cualquier rastro de la cadena de texto "isocso" simultáneamente en las tres bases de datos de usuarios y grupos:
```bash
sudo grep isocso /etc/passwd /etc/shadow /etc/group
```
*la terminal no debería devolver ninguna línea de texto ni arrojar resultados, confirmando que los archivos están completamente limpios de ese usuario.*
#### 5. Investigue la funcionalidad y parámetros de los siguientes comandos:  
1. `useradd` y `adduser` (Creación de usuarios):
    - `useradd`: Es el comando binario *estándar de bajo nivel* en todos los sistemas UNIX/Linux. Si se ejecuta sin parámetros, crea la entrada en `/etc/passwd` pero **no crea el directorio `/home`** ni asigna una contraseña.
        - `useradd -m`: Fuerza la creación del directorio personal `/home/usuario`.
        - `useradd -d [ruta]`: Especifica una ruta no estándar para el directorio personal.
        - `useradd -s [ruta]`: Define el intérprete de comandos (*shell*) por defecto (ej. `/bin/bash`).
        - `useradd -g [grupo]`: Asigna el grupo principal.
    - `adduser`: Es un script interactivo de alto nivel, escrito en Perl, exclusivo de Debian/Ubuntu y derivados. Al ejecutarlo, **crea automáticamente el directorio personal**, copia los **archivos de configuración base**, y te pregunta interactivamente la **contraseña y los datos personales** (*GECOS*).
2. `usermod` (Modificación de usuarios): Altera las propiedades de una cuenta de usuario que ya existe en el sistema.
    - `usermod -aG [grupo]` (*append group*): Es la combinación más utilizada. El parámetro `-G` *define los grupos secundarios*, pero si no se acompaña de `-a` (*append*), el usuario será borrado de todos sus grupos anteriores. Usar `-aG` garantiza que solo se sume al nuevo grupo.
    - `usermod -l [nuevo_nombre]` (*login*): Cambia el nombre de inicio de sesión del usuario.
    - `usermod -L / -U` (*Lock / Unlock*): Bloquea (`-L`) o desbloquea (`-U`) la cuenta poniendo o quitando un símbolo especial en `/etc/shadow`, impidiendo el inicio de sesión con contraseña.
3. `userdel` (Eliminación de usuarios):
    - `userdel -r` (*recursive*): Elimina también el directorio personal del usuario `/home/usuario` y su buzón de correo local. Sin este parámetro, la cuenta se borra pero sus archivos quedan huérfanos en el disco.
    - `userdel -f` (*force*): Fuerza la eliminación de la cuenta incluso si el usuario tiene una sesión iniciada o procesos en ejecución en ese momento.
4. `su` (_Substitute User_): Permite cambiar temporalmente la identidad de la sesión actual por la de otro usuario. Por defecto, asume que se quiere cambiar a `root`.
    - `su -` (o `-l`, `--login`): Es el parámetro más crítico. Al ejecutar `su - usuario`, no solo cambias de identidad, sino que el sistema carga un entorno completamente nuevo, aplicando las variables de entorno (`$PATH`, `$HOME`) exclusivas de ese usuario, como si acabara de encender la máquina.
    - `su -c "[comando]"`: Permite ejecutar un único comando con los privilegios del otro usuario y, al terminar, devuelve instantáneamente el control al usuario original.
5. `groupadd` (Creación de grupos): Crea un nuevo grupo lógico en el sistema,agregando una entrada en `/etc/group`.
    - `groupadd -g [GID]`: Permite forzar la creación del grupo con un Número de Identificador de Grupo (GID) específico, en lugar de dejar que el sistema asigne el siguiente número disponible.
6. `who` (Usuarios conectados): Informa qué usuarios tienen sesiones activas en el sistema.
    - `who -b` (*boot*): Muestra la fecha y hora exactas del último arranque del sistema.
    - `who -q` (*count*): Imprime únicamente los nombres de los usuarios conectados y el número total de conexiones, omitiendo detalles de terminales y fechas.
7. `groupdel` (Eliminación de grupos): Elimina un grupo existente del sistema.
    - No tiene parámetros de uso cotidiano, pero tiene una restricción de seguridad estricta: el comando abortará y arrojará error si intentas borrar *un grupo que actualmente es el grupo principal de algún usuario existente*.
8. `passwd`: (Gestión de contraseñas): Permite cambiar la propia contraseña, o (con permisos de administrador) cambiar o gestionar las contraseñas de cualquier otro usuario.
    - `passwd -l` (*lock*): Bloquea la contraseña de la cuenta (similar a `usermod -L`).
    - `passwd -d` (*delete*): Elimina la contraseña de una cuenta, dejándola vacía. (El usuario podrá iniciar sesión sin teclear ninguna clave, lo cual es un riesgo grave de seguridad).
    - `passwd -e` (*expire*): Fuerza la caducidad inmediata de la contraseña. El usuario podrá iniciar sesión con su clave actual una vez más, pero el sistema lo obligará a crear una clave nueva obligatoriamente en ese mismo instante.

### 15. FileSystem y permisos:  
#### 1. ¿Cómo son definidos los permisos sobre archivos en un sistema GNU/Linux?  
Los permisos se basan en un modelo de matriz que cruza tres tipos de acciones con *tres tipos de identidades*. 

Las identidades a las que se les aplican reglas son:  
- **Usuario (u)**: El propietario del archivo.
- **Grupo (g)**: El grupo al que pertenece el archivo.
- **Otros (o)**: Cualquier otro usuario del sistema que no sea el dueño ni pertenezca al grupo.  

Las acciones permitidas son:
- **Lectura (`r` - *Read*)**: Permite ver el contenido dentro de los archivos, o listar el contenido en los directorios.
- **Escritura (`w` - *Write*)**: Permite modificar/borrar el archivo, o crear/borrar archivos dentro de un directorio.
- **Ejecución (`x` - *Execute*)**: Permite ejecutar el archivo como un programa. En un directorio, usar `cd` para atravesarlo.

#### 2. Investigue la funcionalidad y parámetros de los siguientes comandos relacionados con los permisos en GNU/Linux:  
1. `chmod` (_Change Mode_): Modifica los permisos de lectura, escritura y ejecución de un archivo o directorio.
    - `chmod -R` (*recursive*): aplica a todos los archivos dentro de una carpeta. 
    - `chmod +x` (*execute*): añade permiso de ejecución.
    - `chmod -w` (*write*): quita permiso de escritura.
2. `chown` (_Change Owner_): Cambia el propietario de un archivo. También puede cambiar el grupo al mismo tiempo utilizando la sintaxis `usuario:grupo`.
    - `chown -R` (*recursive*): cambia el dueño de un directorio y todo su contenido interno de forma recursiva. 
3. `chgrp` (_Change Group_): Cambia únicamente el grupo propietario de un archivo o directorio.
    - `chgrp -R` (*recursive*).

#### 3. Al utilizar el comando chmod generalmente se utiliza una notación octal asociada para definir permisos. ¿Qué significa esto? ¿A qué hace referencia cada valor?  
La notación octal es un sistema numérico para asignar permisos rápidamente sumando valores predefinidos, donde cada derecho tiene un peso binario:
- Lectura (`r`) = 4
- Escritura (`w`) = 2
- Ejecución (`x`) = 1
- Sin permisos (`-`) = 0  

Al utilizar `chmod`, se escriben tres números del 0 al 7. El primero corresponde al Dueño, el segundo al Grupo y el tercero a los Otros.

#### 4. ¿Existe la posibilidad de que algún usuario del sistema pueda acceder a determinado archivo para el cual no posee permisos? Indiquelo y realice las pruebas correspondientes. 
El usuario administrador `root` (UID 0) evade por completo el sistema de permisos de GNU/Linux. Puede leer, modificar o borrar cualquier archivo del disco, incluso si los permisos del archivo le deniegan explícitamente el acceso a todos.  
Para probarlo:
1. Creamos un archivo como usuario normal: `touch ~/secreto.txt`
2. Escribimos algo adentro: `echo "datos" > ~/secreto.txt`
3. Removemos todos los permisos al archivo: `chmod 000 ~/secreto.txt`
4. Intentamos leerlo como usuario normal: `cat ~/secreto.txt`. La terminal devolverá: *Permiso denegado*.
5. Ahora lo leemos usando privilegios de superusuario: `sudo cat ~/secreto.txt`. La terminal ignorará los permisos nulos y mostrará la palabra "datos".

#### 5. Explique los conceptos de “full path name” (path absoluto) y “relative path name” (path relativo). De ejemplos claros de cada uno de ellos.  
- **Path Absoluto** (_Full path name_): Es la ruta completa e inequívoca desde la raíz principal del sistema operativo (`/`) hasta el archivo. No importa en qué carpeta estés ubicado, esta ruta siempre funciona.  
    - Ejemplo: `/home/matias/Documentos/informe.pdf`
- **Path Relativo** (_Relative path name_): Es una ruta incompleta que parte desde tu ubicación actual en la terminal.  
    - Ejemplo: Si estás posicionado dentro de `/home/matias/`, el path relativo para acceder a ese mismo archivo es simplemente: `Documentos/informe.pdf` o `./Documentos/informe.pdf`.

#### 6. ¿Con qué comando puede determinar en qué directorio se encuentra actualmente? ¿Existe alguna forma de ingresar a su directorio personal sin necesidad de escribir todo el path completo? ¿Podría utilizar la misma idea para acceder a otros directorios? ¿Cómo? Explique con un ejemplo. 
Para determinar en qué directorio estás actualmente, se utiliza el comando `pwd` (*Print Working Directory*).  
Se puede volver a tu home usando el símbolo de la tilde `~`. Ejecutando simplemente `cd ~` (o `cd` sin nada más), el sistema te lleva inmediatamente al directorio personal desde cualquier parte del disco.  
Usando la misma idea para otros directorio se puede usar `~` seguido del nombre de otro usuario para entrar a su home, pero debemos de tener permisos de lectura.
- *Ejemplo*: Para ir al directorio del usuario `isocso` desde la terminal de otro usuario, se debe ejecutar `cd ~isocso` y la terminal te moverá automáticamente a `/home/isocso`.

#### 7. Investigue la funcionalidad y parámetros de los siguientes comandos relacionados con el uso del FileSystem: 
1. `umount`: Desmonta de manera segura un sistema de archivos, desconectando un disco o pendrive del árbol de directorios. 
    - `umount -f` (*force*): fuerza el desmontaje del filesystem. 
    - `umount -l` (*lazy*): desmonta el filesystem en cuanto los programas dejen de usarlo.
2. `du` (_Disk Usage_): Calcula cuánto espacio en disco está consumiendo un directorio específico y sus archivos internos. 
    - `du -h` (*human-readable*): formato legible.
    - `du -s` (*summary*): resume el total sin listar archivo por archivo.
3. `df` (_Disk Free_): Muestra el espacio total libre y ocupado de todas las particiones montadas. 
    - `df -h` (*human-readable*): legible en MB/GB, 
    - `df -T` (*print-type*): muestra el tipo de sistema de archivos.
4. `mount`: Conecta un dispositivo de almacenamiento, o una partición, a una carpeta vacía del sistema (*punto de montaje*) para poder acceder a sus datos. 
    - `mount -t`(*filesystem type*): especifica el sistema de archivos. Ejemplo. ext4, ntfs.
    - `mount -o loop`(*options*): monta un archivo de imagen ISO como si fuera un disco.
5. `mkfs` (*Make FileSystem*): Se utiliza para "formatear" una partición vacía, escribiendo las estructuras lógicas de un sistema de archivos nuevo. 
    - `mkfs -t` (*filesystem type*): para especificar el tipo. Ejemplo: `mkfs -t ext4 /dev/sdb1`. 
6. `fdisk` **(con cuidado)**: Es una herramienta interactiva de bajo nivel para manipular tablas de particiones (MBR/GPT). Permite crear, borrar o redimensionar divisiones físicas del disco duro. 
    - `fdisk -l` (list): lista todas las particiones actuales. 
    *Requiere extremo cuidado porque equivocarse de disco destruye todos los datos irrecuperablemente*. 
7. `write`: Aunque no es puramente de FileSystem, es el comando clásico para escribir mensajes de texto que aparecen directamente en la terminal de otro usuario conectado. 
    - `write [usuario]`: se pasa el nombre de usuario. Ejemplo: `write root`.
8. `losetup`: Asocia un archivo estándar (como una imagen `.img` o `.iso`) a un dispositivo de bloque virtual (*loop device*, ejemplo: `/dev/loop0`). Esto permite que herramientas como `mount` o `fdisk` traten a ese archivo como si fuera un disco duro físico real. 
    - `losetup -f` (*find*): encuentra el primer dispositivo loop libre.  
9. `stat`: Muestra la metadata profunda (el inodo completo) de un archivo o sistema de archivos. Revela su tamaño en bloques, permisos exactos en octal, UID, GID y las fechas exactas de último acceso, modificación y cambio estructural.


### 16. Procesos
#### 1. ¿Qué significa que un proceso se está ejecutando en Background? ¿Y en Foreground? 
**Foreground** (*Primer plano*): Es el comportamiento predeterminado. Cuando ejecutas un comando, este toma el **control total de la terminal interactiva**. La terminal queda "bloqueada" esperando a que el proceso termine; todo lo que escribas en el teclado será enviado a ese proceso (*Entrada estándar*) y todos sus resultados se imprimirán en tu pantalla (*Salida estándar*). Hasta que no finalice, no vuelve a aparecer el prompt para ingresar un nuevo comando.

**Background** (*Segundo plano*): Significa que el proceso se envía a ejecutarse de forma "invisible" o asíncrona en la memoria. El **sistema operativo inicia el proceso, pero te devuelve el control de la terminal** inmediatamente. Puedes seguir ejecutando otros comandos mientras el proceso original sigue trabajando de fondo. Un proceso en background pierde la capacidad de recibir entrada desde el teclado.

#### 2. ¿Cómo puedo hacer para ejecutar un proceso en Background? ¿Como puedo hacer para pasar un proceso de background a foreground y viceversa?  
*Para ejecutar un proceso en Background desde cero*:
- Se debe agregar el símbolo `&` al final del comando. Ejemplo: `sleep 100 &`.  
El sistema devolverá un número de trabajo, como `[1]`, y el PID del proceso, devolviéndonos a la terminal al instante.

*Para pasar un proceso de Foreground a Background*:
Si el proceso ya está iniciado y bloqueó la terminal, por ejemplo, con un script que tarda mucho:
1. Presionar `Ctrl + Z`. Esto no mata el proceso, sino que lo pausa/suspende temporalmente y nos devuelve la terminal.
2. Escribir el comando `bg` (*background*) y presionar `Enter`. El proceso suspendido reanudará su ejecución en segundo plano.

*Para pasar un proceso de Background a Foreground*:
Si hay uno o varios procesos ejecutándose en *background*, para traerlos de vuelta a la terminal principal se necesita:
1. Escribir el comando `jobs` para listar los procesos en segundo plano y ver su número identificador. Ejemplo: `[1]`, `[2]`.
2. Escribe el comando `fg %número` (*foreground*). Por ejemplo: `fg %1` traerá el trabajo `[1]` al primer plano, bloqueando la terminal nuevamente. Si solo se escribe `fg`, trae el último proceso enviado al *background*.

#### 3. Pipe ( `|` ). ¿Cuál es su finalidad? Cite ejemplos de su utilización.  
El Pipe (`|`) se utiliza para **encadenar comandos**, creando una "tubería" de datos. Su función exacta es *tomar la Salida Estándar (stdout) del comando que está a su izquierda, e inyectarla directamente como la Entrada Estándar (stdin) del comando que está a su derecha*, sin necesidad de crear archivos temporales en el disco duro.  
  
Ejemplos:
- `ls -l /etc | less`: El directorio `/etc` tiene cientos de archivos. Si se ejecuta `ls -l` solo se vería el final del texto. Al usar el pipe, la salida masiva de `ls` se envía al paginador `less`, permitiendo navegar el resultado con las flechas del teclado.

`cat /var/log/syslog | grep "error"`: Lee todo el contenido del registro del sistema, pero en lugar de imprimirlo en pantalla, se lo pasa por la tubería al comando `grep`, el cual filtra y muestra únicamente las líneas que contengan la palabra "error".

#### 4. Redirección. ¿Qué tipo de redirecciones existen? ¿Cuál es su finalidad? Cite ejemplos de utilización.  
En GNU/Linux, todo proceso tiene tres flujos de datos básicos identificados por números:
- `0`: `stdin` (Entrada estándar) - *Por defecto el teclado*.
- `1`: `stdout` (Salida estándar) - *Por defecto la pantalla*.
- `2`: `stderr` (Salida de errores) - *Por defecto la pantalla*.  
  
La redirección permite cambiar estos orígenes y destinos predeterminados, enviando los datos hacia archivos o leyendo desde ellos.  
*Tipos de redirecciones y ejemplos*:
- **Redirección de Salida Estándar - Sobrescribir (`>`)**: Envía el resultado normal de un comando a un archivo. Si el archivo existe, borra su contenido anterior.
    - *Ejemplo*: `echo "Hola Debian" > saludo.txt`
- **Redirección de Salida Estándar - Añadir (`>>`)**: Envía el resultado a un archivo, pero agregándolo al final del mismo sin borrar lo que ya existía.
    - *Ejemplo*: `echo "Nueva línea" >> saludo.txt`
- **Redirección de Salida de Errores (`2>` o `2>>`)**: Separa los mensajes de error de los resultados normales y los guarda en un archivo.
    - *Ejemplo*: `ls /directorio_falso 2> errores.log` (En pantalla no se verá nada, pero el mensaje "*No existe el archivo*" quedará guardado en `errores.log`).
- **Redirección combinada (`&>` o `> archivo 2>&1`)**: Envía tanto el resultado normal (`1`) como los errores (`2`) al mismo archivo simultáneamente.
    - *Ejemplo*: `ping google.com &> resultado_ping.txt`
- **Redirección de Entrada Estándar (`<`)**: Obliga a un comando a leer sus datos desde un archivo en lugar de esperar a que el usuario escriba en el teclado.
    - *Ejemplo*: `sort < lista_desordenada.txt` (El comando `sort` ordena alfabéticamente el contenido del archivo).


### 17. Otros comandos de Linux (Indique funcionalidad y parámetros):  
#### 1. ¿A qué hace referencia el concepto de empaquetar archivos en GNU/Linux? 
En GNU/Linux, empaquetar significa tomar múltiples archivos o carpetas completas y unirlos secuencialmente dentro de un único archivo "contenedor", conocido como *tarball*, con extensión `.tar`.  
La característica fundamental del empaquetado es que *no reduce el tamaño de los datos*. Su único objetivo es *facilitar el transporte y la gestión*, convirtiendo cientos de archivos en un solo bloque estructurado.

#### 2.  Seleccione 4 archivos dentro de algún directorio al que tenga permiso y sume el tamaño de cada uno de estos archivos. Cree un archivo empaquetado conteniendo estos 4 archivos y compare los tamaños de los mismos. ¿Qué característica nota?  
Usando `du -b [archivo]` para medir el tamaño de un archivo y `tar -cvf [nombrePaquete.tar] [archivo 1] [archivo 2] [...]` para empaquetarlos.  
El archivo empaquetado `.tar` tiene un tamaño igual o superior a la suma exacta de los archivos individuales. Esto es porque el programa de empaquetado no comprime absolutamente nada, simplemente concatena los datos de los 4 archivos y les agrega *bloques adicionales de metadata* (cabeceras con los nombres, permisos, UID, GID y fechas de cada archivo) para poder reconstruirlos en el futuro, lo que genera un pequeño sobrepeso (*overhead*).

#### 3. ¿Qué acciones debe llevar a cabo para comprimir 4 archivos en uno solo? Indique la secuencia de comandos ejecutados.  
Las herramientas de compresión en GNU/Linux (como `gzip` o `bzip2`) solo *saben comprimir un archivo a la vez*.  
Por esto, realizamos dos pasos:
```bash
tar -cvf paquete.tar archivo1 archivo2 archivo3 archivo4
```
Generando el el archivo contenedor `paquete.tar`. Y luego:
```bash
gzip paquete.tar
```
El comando convierte el archivo `.tar`, aplicando el algoritmo de compresión para reducir su tamaño, y lo reemplaza por `paquete.tar.gz`.

#### 4. ¿Pueden comprimirse un conjunto de archivos utilizando un único comando?  
Sí, se logra agregando el parámetro `-z` para usar el algoritmo `gzip` o `-j` para usar `bzip2`.
El comando único sería:
```bash
tar -czvf paquete.tar.gz archivo1 archivo2 archivo3 archivo4
```

#### 5. Investigue la funcionalidad de los siguientes comandos:
1. `tar` (_Tape ARchive_): Es la herramienta estándar para empaquetar y desempaquetar archivos. Originalmente diseñada para respaldos en cintas magnéticas, hoy *crea los archivos* `.tar`. 
    - `tar -c` Permite crear un paquete.
    - `tar -x` (*Extract*).
    - `tar -z`: Comprimirlo usando gzip automáticamente.
    - `tar -v` (*Verbose*): mostrar en pantalla lo que hace.
    - `tar -f` (*File*): indicar el nombre del archivo final.
    - `tar -t`: listar el contenido interior de un paquete sin abrirlo.
2. `grep` (_Global Regular Expression Print_): **Busca patrones de texto o palabras específicas dentro del contenido de los archivos**. Si encuentra una coincidencia, *imprime en la pantalla la línea completa que contiene esa palabra*. Es la herramienta de **filtrado de texto** más poderosa del sistema.
3. `gzip` (_GNU zip_): Es un programa de *compresión de datos* sin pérdida. Reduce drásticamente el espacio que ocupa un archivo en el disco. Al ejecutarse sobre un archivo, lo comprime y le añade la extensión `.gz`, eliminando el archivo original sin comprimir. **Se descomprime con el comando** `gunzip`.
4. `zgrep`: **Combina la funcionalidad de `grep` y `gzip`**. Permite *buscar palabras y patrones de texto directamente dentro de archivos que están comprimidos* (los `.gz`), sin que el usuario tenga que molestarse en descomprimir el archivo primero en el disco duro.
5. `wc` (_Word Count_): Analiza un archivo de texto y devuelve estadísticas sobre su contenido. Por defecto, imprime tres números: la cantidad total de líneas, la cantidad de palabras, y la cantidad de caracteres/bytes.
    - `wc -l` (*line*): puede filtrar usando solo líneas.
    - `wc -w` (*word*): puede filtrar usando solo palabras.
    - `wc -c`: puede filtrar usando solo bytes.


### 18. Indique qué acción realiza cada uno de los comandos indicados a continuación considerando su orden. Suponga que se ejecutan desde un usuario que no es root ni pertenece al grupo de root. (Asuma que se encuentra posicionado en el directorio de trabajo del usuario con el que se logueó). En caso de no poder ejecutarse el comando, indique la razón:  
 
1. `ls −l > prueba`: guarda en `prueba` el contenido detallado del directorio `/home/usuario`, creando o sobreescribiendo el archivo.
2. `ps > PRUEBA`: guarda en `PRUEBA` la lista de procesos actuales, creando o sobreescribiendo el archivo.
3. `chmod 710 prueba`: le otorga permisos de RWX(7) al `usuario` y solo permisos de solo X(1) para el grupo al que pertenece
4. `chown root:root PRUEBA`: no puede ejecutarse, como usuario normal, no se puede regalar la propiedad de un archivo a otro usuario, ni siquiera a `root`.
5. `chmod 777 PRUEBA`: le otorga permisos de RWX(7) al `usuario`, al Grupo al que pertenece y a Otros para `PRUEBA`.
5. `chmod 700 /etc/passwd`: no puede ejecutarse, solo el dueño de un archivo (o `root`) puede cambiar sus permisos usando `chmod`. El dueño de `/etc/passwd` es `root`, así que la terminal daría *Operación no permitida*.
6. `passwd root`: no puede ejecutarse, se necesitan permisos sudo para cambiar la contraseña de otro usuario.
7. `rm PRUEBA`: borra el archivo `PRUEBA`.
8. `man /etc/shadow`: no puede ejecutarse, se necesitan permisos de R(4) para acceder a leer `/etc/shadow`.
9. `find / −name ∗ .conf`: no puede ejecutarse, el `*` está separado del `.conf`.
10. `usermod root −d /home/ newroot −L`: no puede ejecutarse, falla por falta de privilegios para usar `usermod` y por error de sintaxis con `/home/ newroot`, ya que debería estar sin espacios.
11. `cd / root`: no puede ejecutarse, demasiados parametros para `cd` al estar separados por un espacio.
12. `rm ∗`: borra todos los archivos del directorio de trabajo del usuario.
13. `cd / etc`: no puede ejecutarse, demasiados parametros para `cd`
14. `cp ∗ /home −R`: no puede ejecutarse por dos motivos: no hay nada para copiar porque se borró todo con `rm *` y porque no tenemos permisos para escritura sobre el directorio `/home`, solo sobre el `/home/usuario`.
15. `shutdown`: no puede ejecutarse porque apagar el sistema afecta a todos los usuarios conectados, por lo que es una orden reservada estrictamente para superusuarios o `root`.


### 19. Indique qué comando sería necesario ejecutar para realizar cada una de las siguientes acciones:  
1. Terminar el proceso con PID 23: `kill 23`
2. Terminar el proceso llamado `init` o `systemd`. ¿Qué resultados obtuvo?: `killall systemd` (aunque esto necesita ser ejecutado desde el usuario `root` y aún así provocaría un *Kernel Panic*)
3. Buscar todos los archivos de usuarios en los que su nombre contiene la cadena “.conf”:  `find /home -name "*.conf"` 
4. Guardar una lista de procesos en ejecución el archivo `/home/nombre de usuario/procesos`: `ps -aux > ~/procesos`
5. Cambiar los permisos del archivo `/home/nombre de usuario/xxxx` a:    
    a. Usuario: Lectura, escritura, ejecución     
    b. Grupo: Lectura, ejecución      
    c. Otros: ejecución   
    `chmod 751 ~/xxxx`
6. Cambiar los permisos del archivo `/home/nombre de usuario/yyyy` a:  
    a. Usuario: Lectura, escritura.  
    b. Grupo: Lectura, ejecución  
    c. Otros: Ninguno  
    `chmod 650 ~/yyyy`
7. Borrar todos los archivos del directorio `/tmp`: `sudo rm -rf /tmp/*`
8. Cambiar el propietario del archivo `/opt/isodata` al usuario isocso: `sudo chown isocso /opt/isodata`
9. Guardar en el archivo `/home/nombre de usuario/donde` el directorio donde me encuentro en este momento, en caso de que el archivo exista no se debe eliminar su contenido anterior: `pwd >> ~/donde`


### 20. Indique qué comando sería necesario ejecutar para realizar cada una de las siguientes acciones:  
#### 1. Ingrese al sistema como usuario “root”  
`su -`
#### 2. Cree un usuario. Elija como nombre, por convención, la primera letra de su nombre seguida de su apellido. Asígnele una contraseña de acceso. 
`useradd -m -d /home/mchamorro mchamorro` y `passwd mchamorro`
#### 3. ¿Qué archivos fueron modificados luego de crear el usuario y qué directorios se crearon? 
se modificaron `/etc/passwd`, `/etc/shadow`, `/etc/group` y `/etc/gshadow`, y se creó `/home/mchamorro`
#### 4. Crear un directorio en /tmp llamado miCursada  
`mkdir /tmp/miCursada`
#### 5. Copiar todos los archivos de /var/log al directorio antes creado. 
`sudo cp -r /var/log/* /tmp/miCursada`
#### 6. Para el directorio antes creado (y los archivos y subdirectorios contenidos en él) cambiar el propietario y grupo al usuario creado y grupo users.  
`sudo chown -R mchamorro:users /tmp/miCursada`
#### 7. Agregue permiso total al dueño, de escritura al grupo y escritura y ejecución a todos los demás usuarios para todos los archivos dentro de un directorio en forma recursiva.  
`chmod -R 723 /tmp/miCursada`
#### 8. Acceda a otra terminal para loguearse con el usuario antes creado. 
`su - mchamorro`
#### 9. Una vez logueado con el usuario antes creado, averigüe cuál es el nombre de su terminal.  
`tty`(devuelve `/dev/pts/1`)
#### 10. Verifique la cantidad de procesos activos que hay en el sistema.  
`ps -aux | wc -l` (*lines*)
#### 11. Verifique la cantidad de usuarios conectados al sistema.  
`who -q` (*quantity*)
#### 12. Vuelva a la terminal del usuario root y envíele un mensaje al usuario anteriormente creado enviándole que el sistema va a ser apagado.  
`wall "el sistema va a ser apagado"`
#### 13. Apague el sistema. 
`shutdown now`