# Práctica 02

### Índice
1. 
2. 
3. [Ejercicio práctico 3](#3-Dado-el-siguiente-lote-de-procesos)
4. 
5. 
6. [Inanición (*Starvation*)](#6-inanición-starvation)
7. 
8. [RR y SRTF con procesos CPU-bound y I/O-bound](#8-algunos-algoritmos-pueden-presentar-ciertas-desventajas-cuando-en-el-sistema-se-cuenta-con-procesos-ligados-a-cpu-y-procesos-ligados-a-entrada-salida-analice-las-mismas-para-los-siguientes-algoritmos)
9. [VRR (*Virtual Round Robin*)](#9-para-equiparar-la-desventaja-planteada-en-el-ejercicio-9-se-plantea-la-siguiente-modificación-al-algoritmo)
10. [Caso hipotético de VRR con interrupcciones por clock](#10-suponga-que-un-kernel-utiliza-un-algoritmo-de-vrr-para-planificar-procesos-para-ello-el-quantum-es-representado-por-un-contador-que-es-decrementado-en-1-unidad-cada-vez-que-ocurre-una-interrupción-de-reloj-bajo-este-esquema-puede-suceder-que-el-quantum-de-un-proceso-nunca-llegue-a-0-cero-justifique-su-respuesta)
11. [Fórmulas de estimación de ráfagas](#11-fórmulas-de-estimación)
12. [Colas Multinivel](#12-colas-multinivel)

### 3. Dado el siguiente lote de procesos:

| Job | Llegada | Unidades de CPU |
| :---: | :---: | :---: |
| 1 | 0 | 4 |
| 2 | 2 | 6 |
| 3 | 3 | 4 |
| 4 | 6 | 5 |
| 5 | 8 | 2 |

#### 1. Realice los diagramas de Gantt según los siguientes algoritmos de scheduling:
1. FCFS (First Come, First Served)
2. SJF (Shortest Job First)
3. Round Robin con quantum = 1
4. Round Robin con quantum = 6
#### 2. Para cada algoritmo calcule el TR y TE para cada job así como el TPR y el TPE.
![Dibujo de los diagramas FCFS, SJF y Round Robin (usando quantum 1 y quantum 6) (punto3.jpg)](<Resoluciones\Diagramas\punto3.jpg>)
#### 3. En base a los tiempos calculados compare los diferentes algoritmos.
El algoritmo SJF es el mejor en esta ocasión, esto es ya que prioriza intentar resolver los jobs 3, 4 y 5 lo más rápido posible, debido a que son tareas que requieren poco tiempo de CPU, contrario al job 2 que es el más largo.
#### 4. En el algoritmo Round Robin, qué conclusión se puede sacar con respecto al valor del quantum.
El quantum sirve para rotar la ocupación del CPU entre los diferentes jobs. Esto
#### 5. ¿Para el algoritmo Round Robin, en qué casos utilizará un valor de quantum alto y qué ventajas y desventajas obtendría?
Al usar un quantum más alto que el promedio de unidades de CPU utilizadas en los jobs, ocurre, como en el caso del quantum 6, que las tareas no necesiten tanto y, por esto mismo, el diagrama se empiece a parecer al algoritmo FCFS.   
Por otro lado, si usamos un quantum demasiado bajo, al no priorizar terminar las tareas más cortas, todas suman tiempo de espera. Es por esto que no es práctico.

### 6. Inanición (Starvation)
#### 1. ¿Qué significa?
Se denomina *Starvation* a la situación en la que un proceso no puede acceder al uso de la CPU y queda en la cola de listos o en estado de espera sin ejecutarse nunca. Esto es debido al algoritmo que se esté usando para administrar el uso de CPU.
#### 2. ¿Cuál/es de los algoritmos vistos puede provocarla?
Los algoritmos preemptive (apropiativos, de la CPU) son capaces de generarla por priorizar siempre la ejecución de ciertos procesos y no darle lugar a ejecutarse a otros. Estos algoritmos son: SRTF, SJF y Uso de prioridades.
#### 3. ¿Existe alguna técnica que evite la inanición para el/los algoritmos mencionados en el inciso b?
Si, el *aging* (envejecimiento) o *penalty* es una técnica que consiste en aumentar la prioridad de un proceso a medida que pasa más tiempo esperando en la cola. De esta forma, incluso el proceso más largo o de menor prioridad inicial eventualmente alcanza la prioridad máxima y obtiene el uso de la CPU.

### 8. Algunos algoritmos pueden presentar ciertas desventajas cuando en el sistema se cuenta con procesos ligados a CPU y procesos ligados a entrada salida. Analice las mismas para los siguientes algoritmos:
1. **Round Robin**  
Problema: *Perjudica a los procesos ligados a E/S*.  
- Comportamiento de *CPU-bound*: Utilizan todo su quantum de tiempo asignado y luego vuelven al final de la cola de listos.
- Comportamiento de *I/O-bound*: Ejecutan por una fracción muy pequeña del quantum e inmediatamente se bloquean esperando la operación de E/S. Cuando la operación termina, vuelven al final de la cola de listos.
- Desventaja: Los procesos ligados a E/S tienen que esperar muchísimo tiempo en la cola de listos (mientras los procesos ligados a CPU agotan sus quantums largos) solo para ejecutar una ráfaga ínfima de CPU y volver a bloquearse.
- Consecuencia: Los dispositivos de E/S pasan mucho tiempo ociosos esperando que el proceso reciba la CPU para emitir la siguiente solicitud, degradando enormemente el rendimiento interactivo del sistema.

2. **SRTF** (Shortest Remaining Time First)  
Problema: Perjudica y causa *starvation* a los procesos ligados a CPU.
- Comportamiento de *CPU-bound*: Tienen ráfagas de CPU muy largas (mucho tiempo restante de ejecución).
- Comportamiento de *I/O-bound*: Como interactúan constantemente con los dispositivos, sus ráfagas de CPU son extremadamente cortas. Para el planificador SRTF, estos son los "trabajos más cortos".
- Desventaja: Cada vez que un proceso de E/S termina su operación y vuelve a la cola de listos, su ráfaga corta requerida es menor al tiempo restante del proceso ligado a CPU que se está ejecutando. Por lo tanto, el sistema operativo desaloja constantemente al proceso de CPU para darle el control al proceso de E/S.
- Consecuencia: Genera un gran *overhead* (costo extra) por la cantidad excesiva de cambios de contexto. Además, si entran continuamente procesos ligados a E/S, los procesos ligados a CPU sufrirán la *starvation*, ya que nunca llegarán a terminar.


### 9. Para equiparar la desventaja planteada en el ejercicio 9, se plantea la siguiente modificación al algoritmo:
**Algoritmo VRR (Virtual Round Robin)**: Este algoritmo funciona igual que el Round Robin, con la diferencia que cuando un proceso regresa de una I/O se coloca en una cola auxiliar. Cuando se tiene que tomar el próximo proceso a ejecutar, los procesos que se encuentran en la cola auxiliar tienen prioridad sobre los otros. Cuando se elije un proceso de la cola auxiliar se le otorga el procesador por tantas unidades de tiempo como le faltó ejecutar en su ráfaga de CPU anterior, esto es, se le otorga la CPU por un tiempo que surge entre la diferencia del quantum original y el tiempo usado en la última ráfaga de CPU.

#### 1. Analice el funcionamiento de este algoritmo mediante un ejemplo. Marque en cada instante en que cola se encuentran los procesos.

#### 2. Realice el ejercicio 9)a) nuevamente considerando este algoritmo, con un quantum de 2 unidades


### 10. Suponga que un Kernel utiliza un algoritmo de VRR para planificar procesos. Para ello, el quantum es representado por un contador, que es decrementado en 1 unidad cada vez que ocurre una interrupción de reloj. ¿Bajo este esquema, puede suceder que el quantum de un proceso nunca llegue a 0 (cero)? Justifique su respuesta.  
Podría ser posible bajo dos motivos:
1. **Ráfagas de CPU más cortas que el ciclo del reloj** (Comportamiento *I/O-bound*):
Como el contador solo se decrementa cuando ocurre una interrupción de reloj, si un proceso ejecuta una syscall para una operación de E/S (bloqueándose de *forma voluntaria*) *antes* de que ocurra la siguiente interrupción del reloj, abandona la CPU y su contador no llega a ser decrementado por el Kernel en ese ciclo.  
En el algoritmo VRR, este proceso pasará a la cola de espera y, al terminar la E/S, irá a la cola auxiliar conservando el quantum que le quedaba. Si el proceso repite ráfagas de CPU ínfimas seguidas de E/S durante toda su vida, siempre cederá la CPU antes de la interrupción de reloj, por lo que su contador nunca llegará a cero.
2. **Terminación temprana del proceso**:
Algo más simple sería que el proceso termine su ciclo de vida y ejecute su instrucción de finalización (`exit()`) teniendo todavía quantum a favor.

### 11. Fórmulas de estimación
El algoritmo SJF (y SRTF) tiene como su principal problema su implementación, dada la dificultad de conocer la duración de la próxima ráfaga de CPU. Es posible realizar una estimación de la próxima, utilizando la media de las ráfagas de CPU para cada proceso. Así, por ejemplo, podemos tener la siguiente fórmula (1):
$$ S_{n+1}=\frac{1}{n}\sum _{i=1}^{n}T_{i}\ $$
O expresada de forma recursiva (basada en el valor anterior):
$$ S_{n+1}=\frac{1}{n}T_{n}+\left(1-\frac{1}{n}\right)S_{n}\ $$
- T<sub>i</sub> = duración de la ráfaga de CPU i-ésima del proceso.
- S<sub>i</sub> = valor estimado para el i-ésimo caso
- S<sub>1</sub> = valor estimado para la primera ráfaga de CPU. No es calculado.
#### 1. Suponga un proceso cuyas ráfagas de CPU reales tienen como duración: 6, 4, 6, 4, 13, 13, 13. Calcule qué valores se obtendrían como estimación para las ráfagas de CPU del proceso si se utiliza la fórmula 1, con un valor inicial estimado de S1=10.  
1. $n=1$:   $S_2 = \frac{1}{1}(6) + 0(10) = 6$
2. $n=2$:   $S_3 = \frac{1}{2}(4) + \frac{1}{2}(6) = 2 + 3 = 5$
3. $n=3$:   $S_4 = \frac{1}{3}(6) + \frac{2}{3}(5) = 2 + 3.33 = 5.33$
4. $n=4$:   $S_5 = \frac{1}{4}(4) + \frac{3}{4}(5.33) = 1 + 4 = 5$
5. $n=5$:   $S_6 = \frac{1}{5}(13) + \frac{4}{5}(5) = 2.6 + 4 = 6.6$
6. $n=6$:   $S_7 = \frac{1}{6}(13) + \frac{5}{6}(6.6) = 2.167 + 5.5 = 7.67$
7. $n=7$:   $S_8 = \frac{1}{7}(13) + \frac{6}{7}(7.67) = 1.857 + 6.57 = 8.43$

La fórmula 1 le da el mismo peso a todos los casos (siempre calcula la media). Es posible reescribirla permitiendo darle un peso mayor a los casos más recientes y menor a casos viejos (o viceversa). Se plantea la siguiente fórmula (2):   
$$ S_{n+1} = \alpha T_{n} + (1-\alpha)S_{n} $$
- Con 0 < α < 1.
#### 2. Analice para qué valores de α se tienen en cuenta los casos más recientes.
En la fórmula $S_{n+1} = \alpha T_n + (1-\alpha)S_n$, el término $\alpha$ **representa el peso o importancia que se le da a la ráfaga real más reciente** ($T_n$).  
mientras que $(1-\alpha)$ **es el peso de la historia pasada** ($S_n$).  
Para que los casos más recientes tengan mayor peso que la historia acumulada, el coeficiente $\alpha$ debe ser mayor que $(1-\alpha)$.$$\alpha > 1 - \alpha \implies 2\alpha > 1 \implies \alpha > 0.5$$
Por lo tanto, se tienen en cuenta los casos más recientes (con mayor peso) para valores de $\alpha > 0.5$. Cuanto más cercano a 1 sea $\alpha$, más rápido "olvida" el algoritmo el pasado y más se adapta a la última ráfaga.

#### 3. Para la situación planteada en a) calcule qué valores se obtendrían si se utiliza la fórmula 2 con α = 0,2; α = 0,5 y α = 0,8.

#### 4. Para todas las estimaciones realizadas en a y c ¿Cuál es la que más se asemeja a las ráfagas de CPU reales del proceso?

### 12. Colas Multinivel
*Actualmente los algoritmos de planificación vistos se han ido combinando para formar algoritmos más eficientes. Así surge el algoritmo de Colas Multinivel, donde la cola de procesos listos es dividida en varias colas, teniendo cada una su propio algoritmo de planificación.*
#### 1. Suponga que se tiene dos tipos de procesos: Interactivos y Batch. Cada uno de estos procesos se coloca en una cola según su tipo. ¿Qué algoritmo de los vistos utilizará para administrar cada una de estas colas?.  
Utilizaría *VRR (Virtual Round Robin)* con un quantum no tan grande para los procesos Interactivos, ya que al requerir de dispositivos E/S (I/O-bound), lo mejor es un quantum pequeño.
En cambio, usaría *SRTF (Shortest Remaining Time First)* para los procesos Batch que son CPU-bound, es decir que requieren de más uso de CPU. Esto es porque priorizaría terminar en segundo plano los procesos más cortos para un tiempo de retorno promedio más corto. También se necesitaría evitar la *starvation* de los procesos más largos, implementano una técnica de *aging*. 
Otra alternativa para la cola de Batch sería *FCFS (First-Come First-Served)*, que penaliza el tiempo de retorno promedio pero elimina por completo el riesgo de inanición y el *overhead* por cambios de contexto. 
  
*A su vez, se utiliza un algoritmo para administrar cada cola que se crea. Así, por ejemplo, el algoritmo podría determinar mediante prioridades sobre qué cola elegir un proceso.*

#### 2. Para el caso de las dos colas vistas en a: ¿Qué algoritmo utilizaría para planificarlas?
Utilizaría un algoritmo de Asignación de Tiempo (*Time Slicing*) entre las colas.  
Si bien los procesos Interactivos son más urgentes, utilizar un algoritmo de Prioridad Absoluta donde la cola Batch solo recibe atención si la cola Interactiva está vacía provocaría *starvation* en los trabajos Batch si el sistema tiene un uso interactivo constante.  
Una alternativa excelente es usar *Colas Multinivel con Retroalimentación (MLFQ)*. De esta forma, el planificador no solo administra el tiempo, sino que castiga a los procesos interactivos que abusan de la CPU moviéndolos a la cola Batch (Degradación por abuso), y premia a los procesos Batch que sufren inanición subiéndolos temporalmente a la cola Interactiva (*Aging*).


### 14. Envejecimiento
En el esquema de Colas Multinivel, cuando se utiliza un algoritmo de prioridades para administrar las diferentes colas los procesos pueden sufrir starvation. La técnica de envejecimiento se puede aplicar a este esquema, haciendo que un proceso cambie de una cola de menor prioridad a una de mayor prioridad, después de cierto periodo de tiempo que el mismo se encuentra esperando en su cola. Luego de llegar a una cola en la que el proceso llega a ser atendido, el mismo retorna a su cola original. 
*Por ejemplo: Un proceso con prioridad 3 está en cola su cola correspondiente. Luego de X unidades de tiempo, el proceso se mueve a la cola de prioridad 2. Si en esta cola es atendido, retorna a su cola original, en caso contrario luego de sucederse otras X unidades de tiempo el proceso se mueve a la cola de prioridad 1. Esta última acción se repite hasta que el proceso obtiene la CPU, situación que hace que el mismo vuelva a su cola original.*
#### Para los casos a y b del ejercicio 13 realice el diagrama de Gantt considerando además que se tiene un envejecimiento de 4 unidades.

  
### 15. La situación planteada en el ejercicio anterior, donde un proceso puede cambiar de una cola a otra, se la conoce como Colas Multinivel con Realimentación.  
Suponga que se quiere implementar un algoritmo de planificación que tenga en cuenta el tiempo de ejecución consumido por el proceso, penalizando a los que más tiempo de ejecución tienen. (Similar a la tarea del algoritmo SJF que tiene en cuenta el tiempo de ejecución que resta).  
#### Utilizando los conceptos vistos de Colas Multinivel con Realimentación indique qué colas implementaría, qué algoritmo usaría para cada una de ellas así como para la administración de las colas entre sí. Tenga en cuenta que los procesos no deben sufrir inanición.  
Usando los conceptos de colas multinivel, utilizaría 3 colas para administrar la planificación del uso de CPU. Estas colas tendrían una planificación vertical de colas de prioridad absoluta (es decir, que siempre se atiende a la cola de prioridad 1 y solo en caso de estar vacía se atiende a la cola 2, y así sucesivamente con la cola 2 y 3) y también apropiativa, dando lugar a que en caso de haber procesos con prioridad alta siempre se los atienda con urgencia. Además, tendría en cuenta los conceptos de *aging*, es decir que, por ejemplo, si un proceso pasa 8 unidades de CPU sin ser atendido en la cola 2 o 3, se lo promueve a la cola superior temporalmente, de forma que los procesos no sufran de *starvation* hasta el final a causa de la prioridad absoluta apropiativa. Para agregar a esto, también incluiría un concepto de *penalty*, de manera que, en ciertos casos, la prioridad de ciertos procesos sea rebajada.  
En primer lugar, la primera de las colas estaría planificada a partir de un Virtual Round Robin con un quantum pequeño, por ejemplo 4, esta cola sería la de mayor prioridad y está pensada para atender rápidamente ráfagas cortas de CPU, por esto, en caso de no abandomar la CPU por su propia cuenta en su ráfaga de 4 unidades de CPU, la prioridad del proceso se rebajaría y pasaría al final de la segunda cola de prioridad. Habría que tener en cuenta que todos los procesos nuevos deberían entrar en esta cola al principio.  
Hablando de la segunda cola de prioridad, también utilizaría un Round Robin como planificador horizontal, pero en este caso, por ejemplo, sería de 16 unidades. Esta cola tendría un quantum mayor al de la primera, ya que estaría pensada para procesos más largos que no pudieron terminar en la primera cola. En caso de no terminar en una ráfaga de esta cola de prioridad, el proceso pasaría a la última cola.  
Por último, la tercera cola, esta estaría planificada horizontalmente con un FCFS y atendería a aquellos procesos que quedaron relegados por ser acaparadores de CPU, sufriendo de un doble *penalty*. Aquellos procesos que residen en esta cola, son CPU-bound, que requieren gran cantidad de tiempo de ejecución.    
Cabe aclarar los procesos I/O-bound, suelen abandonar la CPU antes de consumir todo su quantum, por lo que no sufrirían de *penalty* al no ser acaparadores de CPU. Y para que no sufran con unidades de CPU desperdiciadas debido al Round Robin, y buscando priorizar procesos interactivos con el usuario (I/O-bound), utilizaría un alternativa Virtual Round Robin.   
Aunque los procesos interactivos suelen vivir en la primera cola de prioridad gracias al VRR, si un proceso en la segunda o tercera cola realiza una E/S, al volver se lo premia subiéndolo a la primera cola, reforzando que se "premia" a quien no acapara la CPU.  
  
    
### 16. A cuáles de los siguientes tipos de trabajos:
- a. cortos acotados por CPU
- b. cortos acotados por E/S
- c. largos acotados por CPU
- d. largos acotados por E/S  
  
benefician las siguientes estrategias de administración:  
1. prioridad determinada estáticamente con el método del más corto primero (SJF).    
respuestas *a* y *b*: esto es a razón de que, sin importar si el proceso es CPU-bound o I/O-bound, si su tiempo de ejecución es corto, la planificación SJF lo priorizará ante el resto, por lo cual siempre se ejecutarán primero. Incluso podría llegar a la situación de que los procesos largos, indistintamente de cualquier tipo, sufran de *starvation*.  
2. prioridad dinámica inversamente proporcional al tiempo transcurrido desde la última operación de E/S.  
respuestas *b* y *d*: esto es debido a que solo se tiene el cuenta el tiempo transcurrido desde la última operación de E/S del proceso, por eso, aquellos I/O-bound van a lograr tener una mayor prioridad con respecto a los que son CPU-bound, al tender a realizar muchas más operaciones E/S, independientemente de si el proceso es más largo o más corto.  


### 17. Analizar y explicar por qué si el quantum en Round-Robin se incrementa sin límite, el algoritmo de planificación se aproxima a FIFO
Esto es a causa de que si el quantum se empieza a asemejar a la duración de un proceso, este puede ejecutarse en, incluso, una sola ráfaga. De esta manera, se pierde el concepto de rotación entre los diferentes procesos que llegan, lo cual indica que se deja de asegurar la no acaparación del CPU por parte de un único proceso, lo que ocurre en FCFS también.


### 18. Dado los siguientes programas en un pseudo-código que simula la utilización de llamadas al sistema para crear procesos en Unix/Linux, indicar qué mensajes se imprimirán en pantalla (sin importar el orden en que saldrían):
#### 1. Caso 1
```
printf(“hola”)
x = fork()
if x < 1 {
    execv(“ls”)
    printf(“mundo”)
    exit(0)
}
exit(0)
```
Imprimiría: "hola".

#### 2. Caso 2
```
printf(“hola”)
x = fork()
if x < 1 {
    execv(“ps”)
    printf(“mundo”)
    exit(0)
}
execv(“ls”)
printf(“fin”)
exit(0)
```
Imprimiría: "hola".

#### 3. Caso 3
```
printf(“Anda a rendir el Primer Parcial de Promo!”)
newpid = fork()
if newpid == 0 {
    printf(“Estoy comenzando el Examen”)
    execv(“ps”)
    printf(“Termine el Examen”)
}
printf(“¿Como te fue?”)
exit(0)
printf(“Ahora anda a descansar”)
```
Imprimiría: "Anda a rendir el Primer Parcial de Promo!", "Estoy comenzando el Examen" y "¿Como te fue?".


### 19. Dado el siguiente programa en C, analice su objetivo sin necesidad de ejecutarlo. 
(tenga en cuenta el funcionamiento del *[iterador for en C](https://ccia.ugr.es/~jfv/ed1/c/cdrom/cap4/cap43.htm)*) para poder responder: 
```C
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
int main ( void ) {
    int c ;
    pid_t pid ;
    printf( " Comienzo . : \n " ) ;
    for ( c = 0 ; c < 3 ; c++ ) {
        pid = fork ( ) ;
    }
    printf ( " Proceso \n " ) ;
    return 0 ;
}
``` 
#### 1. ¿Cuántas líneas con la palabra "Proceso" aparecen al final de la ejecución de este programa?
Aparecen 8 líneas con la palabra "Proceso".  
La fórmula matemática general para calcular la cantidad de procesos resultantes de ejecutar `fork()` en un bucle es $2^N$, donde $N$ es el número de iteraciones. En este caso, $2^3 = 8$.

#### 2. ¿El número de líneas es el número de procesos que han estado en ejecución?. Ejecute el programa y compruebe si su respuesta es correcta. Modifique el valor del bucle for y compruebe los nuevos resultados.
Sí, ya que al no existir ninguna instrucción `if` que altere el flujo, por ejemplo, obligando a los hijos a terminar antes o a ejecutar otro programa con `execv()`, todos los procesos que nacen en el bucle terminan saliendo de él al llegar `c` a 3. Por lo tanto, los 8 procesos alcanzan la instrucción `printf ( " Proceso \n " ) ;` y luego finalizan con `return 0 ;`.


### 20. Modifiquemos el programa anterior. Ahora, además de un mensaje, vamos a añadir una variable y antes de finalizar el programa vamos a mostrar el valor de la misma:
```C
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
int main ( void ) {
    int c ;
    pid_t pid ;
    int p = 0;
    printf( " Comienzo . : \ n " ) ;
    for ( c = 0 ; c < 3 ; c++ ) {
        pid = fork ( ) ;
    }
    p++;
    printf ( " Proceso %d\n ",p ) ;
    return 0 ;
}
```
#### 1. ¿Qué valores se imprimirán en la consola?
Se imprimirá exactamente la misma cantidad de líneas (8 líneas), pero esta vez el mensaje en cada una será: " Proceso 1 ".

#### 2. ¿Todas las líneas tendrán el mismo valor o algunas líneas tendrán valores distintos?
Todas las líneas tendrán exactamente el mismo valor.

#### 3. ¿Cuál es el valor (o valores) que aparece?. Compile y ejecute el programa y compruebe si su respuesta es correcta.
El único valor que aparece en la variable `p` es el 1. Esto es porque `fork()` crea un proceso hijo que es una réplica exacta del proceso padre, pero con un espacio de memoria totalmente independiente, por lo que cada proceso hereda una copia de la variable `p` con el valor que tenía en ese momento (0). Luego, cada uno de los 8 procesos ejecuta la instrucción `p++` de forma individual, incrementando su propia copia de 0 a 1.

#### 4. Realice modificaciones al programa, por ejemplo: modifique el valor del bucle for, cambie el lugar dónde se incrementa la variable p, y compruebe los nuevos resultados.
Si hicieramos esto en el bucle for, cambiando el valor del bucle y la posición de la instrucción `p++`: 
```C
for ( c = 0 ; c < 4 ; c++ ) {
    pid = fork();
    p++;
}
```
Si ejecutaramos esto, se imprimirán 16 líneas que dirán " Proceso 4 ". Esto es porque crearía $2^4 = 16$ procesos. También se podría observar que el trabajo de `fork()` en este caso es el de generar un proceso hijo con una copia de `p` = 0, luego ambos incrementarían el valor de `p` a 1, se repetiría el mismo bucle para cada uno, dando lugar a dos procesos hijos más, los cuales almacenarían una copia independiente del valor de `p` = 1; ahora los 4 procesos incrementarían sus propias variables `p` a 2, y así sucesivamente hasta que los 16 procesos tengan una copia de `p` que valga 4.

### 21. Dado un esquema de segmentación donde cada dirección hace referencia a 1 byte y la siguiente tabla de segmentos de un proceso, traduzca, de corresponder, las direcciones lógicas indicadas a direcciones físicas. La Dirección lógica está representada por: **segmento:desplazamiento**

| Segmento | Dir. Base | Tamaño |
| :---: | :---: | :---: |
| 0 | 102 | 12500 |
| 1 | 28699 | 24300 |
| 2 | 68010 | 15855 |
| 3 | 80001 | 400 |

#### 1. 0000:9001
Esta dirección lógica apunta al segmento 0, indicando que el desplazamiento desde la dirección base del mismo es de 9001 bytes. Verificando que el desplazamiento sea menos al tamaño del segmento (12500 bytes), lo cual en este caso es correcto, calculamos la dirección física sumando a la dirección base el desplazamiento: 102 + 9001 = byte número 9103

#### 2. 0001:24301
Esta dirección lógica apunta al segmento 1, indicando que el desplazamiento desde la dirección base del mismo es de 24301 bytes. Verificamos que el desplazamiento sea menos al tamaño del segmento (24300 bytes), lo cual en este caso no se cumple. Por lo que el kernel informaría una excepción.

#### 3. 0002:5678
Esta dirección lógica apunta al segmento 2, indicando que el desplazamiento desde la dirección base del mismo es de 5678 bytes. Verificando que el desplazamiento sea menos al tamaño del segmento (15855 bytes), lo cual en este caso es correcto, calculamos la dirección física sumando a la dirección base el desplazamiento: 68010 + 5678 = byte número 73688

#### 4. 0001:18976
Esta dirección lógica apunta al segmento 1, indicando que el desplazamiento desde la dirección base del mismo es de 18976 bytes. Verificando que el desplazamiento sea menos al tamaño del segmento (24300 bytes), lo cual en este caso es correcto, calculamos la dirección física sumando a la dirección base el desplazamiento: 28699 + 18976 = byte número 47675

#### 5. 0003:0
Esta dirección lógica apunta al segmento 3, indicando que el desplazamiento desde la dirección base del mismo es de 0 bytes. Esto no se puede traducir a una dirección física, debido a que el desplazamiento debe ser menos al tamaño del segmento y mayor a 0.

### 24. Dado un esquema de paginación, donde cada dirección hace referencia a 1 byte, se tiene un tamaño de dirección de 32 bits y un tamaño de página de 2048 bytes. Suponga además un proceso P1 que necesita 51358 bytes para su código y 68131 bytes para sus datos.
#### 1. De los 32 bits de las direcciones ¿Cuántos se utilizan para identificar página? ¿Cuantos para desplazamiento?
- Desplazamiento (*Offset*): El tamaño de página es de 2048 bytes. Para poder referenciar a cada uno de esos bytes dentro de la página, necesitamos encontrar un número de bits $n$ tal que $2^n = 2048$. Como $2^{11} = 2048$, se utilizan 11 bits para el desplazamiento.
- Página: El tamaño total de la dirección es de 32 bits. Si le restamos los 11 bits de desplazamiento, nos quedan: $32 - 11 =$ 21 bits para identificar la página.

#### 2. ¿Cuál sería el tamaño lógico máximo de un proceso?
Con 32 bits puedes generar $2^{32}$ direcciones distintas, como cada dirección apunta a 1 byte, el tamaño máximo es $2^{32}$ bytes. 
Lo cual equivale a 4 GiB ($2^{30}$).

#### 3. ¿Cuántas páginas máximo puede tener el proceso P1?
El límite de páginas está dado por la cantidad de bits que hay para identificar las páginas. Como hay 21 bits para el direccionamiento de las páginas, el proceso puede tener un máximo de $2^{21}$ páginas.
  
#### 4. Si se contaran con 4GiB (Gibibytes) de RAM, ¿cuantos marcos habría disponibles para utilizar?
La memoria física (RAM) se divide en "marcos" (frames), que tienen exactamente el mismo tamaño que las páginas (2048 bytes).
4 GiB equivalen a $2^{32}$ bytes y la cantidad de marcos se calcula con: Tamaño de RAM / Tamaño del marco.  
$2^{32} / 2^{11} = 2^{21}$ pr lo que habría $2^{21}$ marcos disponibles (igual al número máximo de páginas porque el tamaño lógico máximo y la RAM física coinciden en 4 GiB).  
  
#### 5. ¿Cuántas páginas necesita P1 para almacenar su código?
El código ocupa 51358 bytes.  
$51358 / 2048 = 25,077$ páginas (redondeando a $26$ páginas).

#### 6. ¿Cuántas páginas necesita P1 para almacenar sus datos?
Los datos ocupan 68131 bytes.  
$68131 / 2048 = 33,267$ páginas (redondeando a $34$ páginas).

#### 7. ¿Cuántos bytes habría de fragmentación interna entre lo necesario para almacenar su código y sus datos? Ayuda: Recuerde que en una misma página no pueden convivir código y datos.
- *Fragmentación en Código*: 
Se le asignaron 26 páginas $\times$ 2048 bytes = $53248$ bytes.
Espacio desperdiciado = $53248$ MOD $2048 = 1890$ bytes.
- *Fragmentación en Datos*:
Se le asignaron 34 páginas $\times$ 2048 bytes = $69632$ bytes.
Espacio desperdiciado = $69632$ MOD $2048 = 1501$ bytes.
- Fragmentación interna total: $1890 + 1501 = 3391$ bytes.

#### 8. Asumiendo que el hardware utiliza tabla de páginas de un (1) nivel, que la dirección se interpreta como 20 bits para identificar página y 12 bits para desplazamiento, y que cada Entrada de Tabla de Páginas (PTE) requiere de 1 Kib. ¿Cuál será el tamaño mínimo que la tabla de páginas del proceso P1 ocupará en RAM?
Ahora tenemos: 20 bits para página y 12 bits para desplazamiento. Esto significa que el nuevo tamaño de página es $2^{12} = 4096$ bytes.    
Primero, recalculemos cuántas páginas usa realmente P1 con este nuevo tamaño:     
- Código: $51358 / 4096 = 12,53 \rightarrow$ 13 páginas.
- Datos: $68131 / 4096 = 16,63 \rightarrow$ 17 páginas.
- Total de páginas que usa el proceso P1 = 30 páginas.
Sobre el tamaño de la tabla:
Una tabla de páginas pura de 1 nivel debe tener una entrada (PTE) por cada página lógica posible, sin importar si el proceso es chiquito o grande.
- Cantidad total de páginas lógicas posibles = $2^{20}$ (porque hay 20 bits para la página).
- Si cada entrada (PTE) pesa 1 Kib (asumiendo que se refiere a 1 KibiByte = 1024 bytes), el tamaño de la tabla sería $2^{20} \times 1 \text{ KiB} =$ 1 GiB.