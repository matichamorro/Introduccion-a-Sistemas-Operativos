# Guia de Temas de Teoría - Primer Parcial

### Introducción
#### 1. ¿Qué es un Sistema Operativo?
#### 2. Enumere qué componentes/aspectos del Hardware (Apoyo) son requeridos para poder cumplir los objetivos de un Sistema Operativo.
#### 3. Enumere componentes de un Sistema Operativo. Cite diferencias entre ellos y que apoyo requieren para cumplir sus objetivos.
#### 4. ¿Que es una llamada al sistema (system call)? ¿Cómo es posible implementarlas?

### Administración de CPU y Procesos
#### 1. Defina y diferencie Programa y Proceso.
#### 2. ¿Cuál es la información mínima que el Kernel debe tener sobre un proceso? ¿En qué estructura de datos asociada almacena dicha información?
#### 3. ¿Qué objetivos persiguen los algoritmos de planificación (scheduling).
#### 4. ¿Qué significa que un algoritmo de scheduling sea apropiativo o no apropiativo (Preemptive o Non-Preemptive)?
#### 5. ¿Qué tareas realizan los siguientes módulos de planificación? ¿Cuándo se ejecutan?
1. Short Term Scheduler
2. Long Term Scheduler
3. Medium Term Scheduler
4. Dispatcher
5. Loader
#### 6. Detallar qué acciones se realizan en el Context Switch.
#### 7. ¿Qué significa que un proceso sea “CPU Bound” y “I/O Bound”?
#### 8. ¿Cuáles son los estados posibles por los que puede atravesar un proceso? ¿Qué representa que un proceso se encuentre en los estados enumerados? Utilizando un diagrama explique las transiciones entre los estados.
#### 9. ¿Cuáles de los schedulers mencionados anteriormente se encargan de las transiciones entre los estados enumerados?
#### 10. Creación de procesos. Diferentes técnicas.
#### 11. Systemcalls fork, execev, exit, wait

### Administración de Memoria - Introducción al tema
#### 1. ¿Qué es la MMU y qué funciones cumple?
#### 2. ¿Que representa el espacio de direcciones de un proceso?
#### 3. Explique y relacione los siguientes conceptos:
1. Dirección Lógica o Virtual
2. Dirección Física
#### 4. Para las siguientes técnicas de administración de memoria principal: particiones fijas , particiones dinámicas, paginación (pura), segmentación y segmentación paginada, trabajar los siguientes puntos.
1. Analizar cómo funciona cada técnica. Tenga en cuenta que estructuras de datos (información) se necesitan, quien las crea, quien las mantiene, quien las define.
2. Tareas que debe realizar el Kernel y cuales realiza el HW
3. Ventajas y desventajas de cada una.
4. Fragmentación (interna y/o externa según corresponda). Indicar la solución a la fragmentación según el tipo y la técnica y quien es responsable de solucionarla.
5. Realice gráficos que le ayuden a indicar cómo se resuelven direcciones lógicas a físicas.
#### 5. Para particiones fijas analice: Particiones de igual tamaño y Particiones de diferente tamaño. Ventajas y desventajas de cada una.
#### 6. Analice los siguientes algoritmos de asignación de memoria a los procesos: Best Fit, Worst Fit, First Fit y Next Fit. Cite ventajas y desventajas de cada algoritmo para cada técnica.
