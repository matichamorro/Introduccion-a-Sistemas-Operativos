# Práctica 01

#### 1. Características de GNU/Linux: 
1. Mencione y explique las características más relevantes de GNU/Linux.  
GNU/Linux es un sistema operativo de **tipo Unix**, es decir que sigue ese estándar, además de libre: Está **diseñado por miles de programadores**. Es **gratuito** y de **libre distribución**, Posee muchas distribuciones (variaciones del GNU/linux original creadas por los usuarios para satisfacer distintas necesidades). Es de **código abierto**, lo que permite lo anterior. Es  multiusuario, multitarea y multiprocesador. Es case sensitive y todo en el sistema es un archivo.

2. Mencione otros sistemas operativos y compárelos con GNU/Linux en cuanto a los puntos mencionados en el inciso a.  
En el caso de macOS, las similitudes con linux radican en estar **certificado como Unix**, cumpliendo con las **estándares de SUS y POSIX**.
En cambio, macOS no es un software gratuito ni libre, sino de código cerrado y desarrollado exclusivamente por Apple. Además, no posee muchas distribuciones, por el contrario, solo posee una y funciona exclusivamente en computadoras Mac.
Windows, por otro lado, no es un SO de tipo Unix sino que utiliza el kernel NT, que se origina a partir de VMS; a pesar de ser ambas arquitecturas para sistemas operativos multitarea y multiusuaria, son arquitecturas fundamentalmente distintas. También, cabe aclarar, que fue desarrollado por Microsoft Windows y es de codigo cerrado.
Para sumar a las diferencias, Unix usa un jerarquía de procesos en forma de árbol, cada proceso tiene un padre y puede tener hijos; también se basa en herramientas atómicas que cumplen muy bien una tarea específica. 
Por otro lado, NT usa un diseño de microkernel multihilo, en él los procesos son independientes y se administran los recursos asignando tiempo a los hilos de manera directa.

3. ¿Qué es GNU?  
El sistema GNU fue creado por Richard Stallman con el **fin de crear un Unix libre**. Este define **cuatro libertades** que el sistema tuvo desde el principio como objetivo: la de usar el programa con cualquier propósito, la de estudiar su funcionamiento, la de distribuir sus copias y la de mejorar los programas. Sus siglas significan "GNU no es Unix", esto es debido a que tiene un diseño compatible con el sistema Unix, pero no contiene código de este.

4. Indique una breve historia sobre la evolución del proyecto GNU. 
En 1983 Richard Stallman creó el sistema GNU, pero para asegurar que el mismo fuera libre, debió de crear un marco legal conocido como GPL (General Public License de GNU). En 1985, Stallman creó la FSF (Free Softwore Fondation) con el fin de financiar el proyecto GNU. Para 1990, GNU contaba con un editor de texto (Emacs), un compilador y una gran cantidad de bibliotecas, pero aún le faltaba un Kernel, ya que el prototipo Trix fue abandonado en 1988 por correr unicamente en hardware muy costoso. Desde 1991, Linus Torvalds venía trabajando en un Kernel llamado Linux, el cual distribuiría bajo una licencia GPL. Es por esto que, en el año 1992, Torvalds y Stallman deciden fusionar ambos prayectos, dando lugar a lo que hoy se conoce como GNU/Linux.

5. Explique qué es la multitarea, e indique si GNU/Linux hace uso de ella. 
La multitarea es la **capacidad de un SO para ejecutar varios programas a procesos de forma**, en principio, **simultánea**. En el caso de Linux, este sistema es multitarea. La multitarea permite que **múltiples tareas compartan la CPU sin interferir entre sí**, de manera que cada programa crea que tiene acceso exclusivo gracias a espacios de memoria aislados y, en caso de tener un solo núcleo en la CPU, al sistema alternando entre los procesos con mucha rapidez mediante divisiones del tiempo (time-slicing). **Linux implementa esta caracteristica** mediante la multitarea preventiva, asignando y controlando de forma segura el tiempo que cada proceso pasa en la CPU; a partir del Scheduler que reparte los turnos de ejecución entre los procesos activos; el cambio de contexto, interrupiendo vía hardware al procesador a intervalos regulares para:  pausar el proceso actual, guardar su estado actual y activar el siguiente, permitiendo que un programa monopolice el sistema; o un soporte multiprocesador.

6. ¿Qué es POSIX?  
Posix es un **estándar creado por el IEEE que define como debe comunicarse un programa con el sistema operativo**, de ahí sus siglas (Portable operating system interface, y la x a partir de su funcionamiento en sistemas de tipo Unix). El objetivo que tiene es el de lograr que **el software sea fácil de mover y usar** entre diferentes computadoras, permitiendo compatibilidad, orden y unión.


#### 3. Estructura de GNU/Linux:  
1. Nombre cuáles son los componentes fundamentales de GNU/Linux. 
Los componentes fundamentales de GNU/Linux consisten en el Kernel de Linux, que actúa como la última capa entre el hardware fisico de la computadora y el software, administrando el CPU, la memoria y los dispositivos, además de presentar una solución en caso de que falle todo lo demás ante algún problema imprevisto; el intérprete de comandos, el shell, el cual recibe lo que se escribe en la terminal y lo convierte en instrucciones para el SO, puede ser CLI (Command Line Intertace), como en el caso de Debian, CUI (Character User Interface, un sinónimo de CLI que estrictamente solo tiene caracteres ASCII) ó GUI (Graphical User Interface); y también el sistema de archivos, los cuales organizan la forma en que se almacenan los archivos en los dispositivos de almacenamiento.

2. Mencione y explique la estructura básica del Sistema Operativo GNU/Linux. 
- Núcleo (Kernel): El corazón del sistema; gestiona los recursos de la memoria, los procesos y la comunicación directa con el hardware.
- Shell (Intérprete de comandos): La interfaz que traduce las órdenes del usuario (por texto o consola) en instrucciones entendibles para el núcleo.
- Utilidades y Aplicaciones: Los programas, bibliotecas del proyecto GNU y herramientas de software que permiten realizar tareas específicas

#### 4. Kernel:  
1. ¿Cuáles son sus funciones principales?  
El Kernel ejecuta programas y gestiona dispositivos de hardware con el fin de comunicar el hardware con el software, es también el encargado de la administración de memoria, CPU y E/S. 

2. ¿Es posible tener más de un Kernel de GNU/Linux instalado en la misma máquina?(ayuda /boot)  
Es posible tener múltiples kernels de Linux instalados en la misma computadora, ya que cada uno se guarda en las particiones de disco destinadas a los /boot; estas contienen cada uno su instalación del kernel, como un archivo individual, y su propio archivo initrd. Al ejecutarse el gestor de arranque (GRUB), detecta todos los kernels y permite elegir el descado con un menú.

3. ¿En qué directorio se encuentra ubicado?  
El archivo de la instalación del Kernel se encuentra en el directorio /boot .

#### 5. Intérprete de comandos (Shell):

1. ¿Qué es y cuáles son sus funciones?  
El Shell, también conocido como CLI (Command Line Interface), línea de comandos, terminal o consola; actúa como **modo de comunicación entre el usuario y el sistema operativo**, esperando el ingreso de comandos por parte del usuario, mientras que la respuesta del SO es mostrada al usuario en la misma ventana. Cada usuario puede tener una interfaz o shell, y **pueden personalizarse** ya que **son programables**. El funcionamiento del shell consiste en que, en su forma más básica, se muestra un *prompt*, un conjunto de caracteres que se muestran en una línea de comandos para indicarnos que está a la espera de ordenes, en el Bourne Shell y sus derivados, el prompt suele ser el carácter $ para los usuarios y # para el administrador. Luego el usuario teclea una orden en el teclado y finaliza la orden, y la computadora ejecuta la orden, proporcionando una salida de texto.


2. Investigue y mencione al menos 3 intérpretes de comandos que existen para GNU/Linux y compárelos entre ellos.  
Existen **tres** grandes familias de Shells dentro de GNU/Linux y Unix, estas son: Korn-Shell (**ksh**), Bourne-Shell (**sh**) y C-Shell (**csh**). Estas se diferencian entre sí básicamente en la sintaxis de sus comandos y en la interacción con el usuario.  
- `/bin/sh` En el caso de Bourne Shell, está disponible en todas las versiones de UNIX y es lo suficientemente básico como para que funcione en todas las plataformas.
- `/bin/csh` En el caso de C-Shell, este debe su nombre al lenguaje de programación C, ya que al hacer scripts su sintaxis es similar. Es el estándar en los BSD, un sistema operativo libre derivado de Unix, y derivados.
- `/bin/ksh` Korn Shell; estándar de SYSV. Maneja un historial de comandos. Basado en sh,
con agregados para hacerlo más amigable.
- `/bin/bash` También está Bourne Again Shell, el cual es uno de los más avanzadoas y populares en GNU/Linux. Tiene licencia GNU. Ofrece las mismas capacidades de csh pero incluyendo otras funciones avanzadas.


3. ¿Dónde se ubican (path) los comandos propios y externos al Shell?  
Cuando el shell recibe una orden lo primero que hace es ver si está **dentro de sus órdenes internas** (como lo son por ejemplo cd, export, return, exit...), luego mira en los **alias de comandos**, y después busca el comando en cada ubicación indicada en la variable **PATH** (puede consultarse con `echo $PATH`). 
Los comandos propios son reconocidos y ejecutados por el shell directamente y sin ayuda de ningún otro ejecutable. Los comandos externos pueden estar en `/bin`, `/usr/bin`, `/usr/local/bin` o cualquier otra ubicación si se la agrega a la variable *PATH*. Si los nombres de un comando externo y uno interno se superponen, se ejecutará el interno, solo exceptuando el caso en el que forcemos la ejecución del externo indicándose el path completo.



4. ¿Por qué considera que el Shell no es parte del Kernel de GNU/Linux?  
El shell no forma parte del kernel básico del SO; sino que el mismo "dialoga" con el kernel. El shell es una aplicación de la capa de usuario que traduce las órdenes escritas o visuales del usuario para que el sistema las entienda. Funciona por encima del kernel, usando llamadas al sistema para comunicarse con él.


5. ¿Es posible definir uno distinto para cada usuario?  
Sí, cada usuario puede tener una interfaz o shell. La shell es iniciada por un proceso denominado "login", y dado que cada usuario tiene asignado una shell por defecto, la misma se inicia cada vez que un usuario comienza a trabajar en su estación de trabajo (es decir se "loguea" en una terminal). Dentro del contenido del archivo /etc/passwd, se puede ver cual es la shell que cada usuario tiene asignada por defecto.

#### 6. El sistema de Archivos (File System) en Linux:
1. ¿Qué es?  
Es la forma en que dentro de un sistema de cómputo se organizan, se administran los archivos. Esa administración comprende:  
- Métodos de acceso: cómo se acceden los datos contenidos en el archivo.
- Manejo de archivos: cómo actúan los mecanismos para almacenar, referenciar, compartir y proteger los archivos.
- Manejo de la memoria secundaria: Cómo se administra el espacio para los archivos en memoria secundaria.
- Mecanismos de integridad: con qué métodos se garantiza la incorruptibilidad del archivo.
Generalmente un sistema de archivos Tiene directorios que asocian nombres de archivos con archivos, conectando el nombre de archivo a un índice en una tabla de asignación de archivos de algún tipo, como los i-nodos de los sistemas Unix. La estructura de directorios puede ser plana o jerárquica (ramificada o "en árbol").  
En sistemas de archivos jerárquicos por lo general se declara la ubicación precisa de un archivo con una cadena de texto llamada "ruta" o *path*. Una ruta viene dada por una sucesión de nombres de directorios y subdirectorios, ordenados de izquierda a derecha y separados por algún carácter especial que suele ser una barra `/` o barra invertida `\` y puede terminar en el nombre de un archivo presente en la última rama de directorios especificada.  
Los sistemas de archivos tradicionales **proveen métodos para crear, mover y eliminar archivos y directorios**, pero carecen de métodos para crear, por ejemplo, enlaces adicionales a un directorio o archivo, ó para renombrar enlaces padres.



2. ¿Cuál es la estructura básica de los File System en GNU/Linux? Mencione los directorios más importantes e indique qué tipo de información se encuentra en ellos. ¿A qué hace referencia la sigla FHS?  


3. Mencione sistemas de archivos soportados por GNU/Linux.  


