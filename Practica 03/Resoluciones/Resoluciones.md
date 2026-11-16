### 1. ¿Qué es el Shell Scripting? ¿A qué tipos de tareas están orientados los script? ¿Los scripts deben compilarse? ¿Por qué?
- Corresponde a la utilización de un intérprete de comandos (shell) que, en sistemas operativos de tipo Unix/nix, provee estructuras de control para programar y ejecutar secuencias de comandos o scripts.
- Sus principales orientaciones son:
    - La automatización de tareas del sistema.
    - El desarrollo de aplicaciones interactivas.
    - La creación de aplicaciones con interfaz gráfica (empleando herramientas como el comando `zenity`).
- No, los scripts no necesitan compilarse previamente. Esto se debe a que se ejecutan a través de un intérprete de comandos (shell), el cual lee e interpreta las instrucciones directamente en tiempo de ejecución.

### 2. Investigar la funcionalidad de los comandos echo y read.
- Comando `echo`: Se utiliza para imprimir texto, mensajes o el valor de las variables por la salida estándar (la terminal). Es fundamental para mostrar información al usuario o depurar el script.
- Comando `read`: Se emplea para capturar la entrada ingresada por el usuario a través del teclado y almacenarla en una o más variables, permitiendo que el script sea interactivo.

#### a. ¿Cómo se indican los comentarios dentro de un script?
Los comentarios se indican utilizando el símbolo `#`. Cualquier texto que se encuentre a la derecha del `#` en una línea es ignorado por el intérprete de comandos y se utiliza exclusivamente para documentar o explicar el código.

#### b. ¿Cómo se declaran y se hace referencia a variables dentro de un script?
- _Declaración_: Se crean asignando un valor a un nombre de variable, _sin dejar espacios alrededor del signo igual_ (`=`). Sus nombres son sensibles a mayúsculas y minúsculas (_case sensitive_) y pueden contener letras, números y el guion bajo (`_`), aunque nunca pueden comenzar con un número.
    - Por ejemplo: `NOMBRE="pepe"`.
- _Referencia_ (acceso): Para acceder al contenido de una variable se utiliza el símbolo `$` antes de su nombre 
    - Por ejemplo: `echo $NOMBRE`.
- _Uso de llaves_: Se pueden utilizar llaves alrededor del nombre de la variable para evitar ambigüedades cuando hay texto o caracteres contiguos que de otro modo se interpretarían como parte del nombre de la variable.
    - Por ejemplo: `${NOMBRE}`.

### 3. Crear dentro del directorio personal del usuario logueado un directorio llamado practica-shell-script y dentro de él un archivo llamado mostrar.sh cuyo contenido sea el siguiente:
```bash
# !/bin/bash
# Comentarios acerca de lo que hace el script
# Siempre comento mis scripts, si no lo hago hoy,
# mañana ya no me acuerdo de lo que quise hacer
echo "Introduzca su nombre y apellido:"
read nombre apellido
echo "Fecha y hora actual:"
date
echo "Su apellido y nombre es:"
echo "$apellido $nombre"
echo "Su usuario es: `whoami`"
echo "Su directorio actual es:"
```
Uso: `mkdir practica-shell-script`, `touch mostrar.sh` y el vim para escribir.

#### a. Asignar al archivo creado los permisos necesarios de manera que pueda ejecutarlo
`chmod 770 mostrar.sh`

#### b. Ejecutar el archivo creado de la siguiente manera: ./mostrar.sh

#### c. ¿Qué resultado visualiza?
- Se muestra el texto: `Introduzca su nombre y apellido:`
- Queda esperando el ingreso por teclado. Si ingreso, por ejemplo, `Matias Chamorro`, continua mostrando:
    - `Fecha y hora actual:` seguida de la fecha y hora devueltas por el comando `date`.
    - `Su apellido y nombre es:` seguido de `Chamorro Matias`, bajo el orden `$apellido $nombre`.
    - `Su usuario es:` seguido del nombre de la cuenta con la que se inició sesión, mediante `whoami`.
    - Finalmente, imprime `Su directorio actual es:`

#### d. Las backquotes (`) entre el comando whoami ilustran el uso de la sustitución de comandos. ¿Qué significa esto?
La sustitución de comandos permite ejecutar un comando dentro de una línea de instrucciones y reemplazarlo por el resultado de su ejecución.  
En este caso, cuando Bash encuentra `whoami`, ejecuta el comando `whoami`, toma el texto que este imprime (el nombre del usuario actual) y lo inserta directamente en la cadena del `echo`, de modo que el mensaje final incluye el nombre del usuario de forma dinámica en lugar de la palabra literal "whoami".

#### e. Realizar modificaciones al script anteriormente creado de manera de poder mostrar distintos resultados (cuál es su directorio personal, el contenido de un directorio en particular, el espacio libre en disco, etc.). Pida que se introduzcan por teclado (entrada estándar) otros datos.

### 4. Parametrización: ¿Cómo se acceden a los parámetros enviados al script al momento de su invocación? ¿Qué información contienen las variables $#, $*, $? y $HOME dentro de un script?
- Se accede utilizando **variables posicionales**, donde `$1` representa el primer argumento recibido, `$2` el segundo, _y así sucesivamente_.
- `$#`: Contiene la cantidad total de parámetros o argumentos con los que fue invocado el script.  
- `$*`: Contiene todos los parámetros pasados al script agrupados en una única cadena de texto.
- `$?`: Contiene el código de salida (_exit status_) del último comando o sentencia ejecutada.   
- `$HOME`: Contiene la ruta absoluta al directorio personal (_home_) del usuario actual que está ejecutando la sesión.

### 5. ¿Cual es la funcionalidad de comando exit? ¿Qué valores recibe como parámetro y cuál es su significado?
- `exit`: Su propósito es provocar la terminación inmediata de la ejecución de un script. __Valores que recibe y su significado__: Recibe como parámetro un número entero comprendido entre **0 y 255**:
    - El valor `0` indica que el script finalizó de forma exitosa y sin errores.
    - Un valor distinto de cero (del `1` al `255`) actúa como un código de error, cuyo significado específico suele ser definido por el desarrollador para identificar diferentes tipos de fallas.

### 6. El comando expr permite la evaluación de expresiones. Investigar que tipo de operaciones se pueden utilizar.
- `expr`: evalúa expresiones y devuelve el resultado a la salida estándar. 
    - Sintaxis: `expr arg1 op arg2`, donde `arg1` y `arg2` representan argumentos y `op` la operación de la expresión.
    - Operaciones aritméticas:
        1. Suma (`+`)
        2. Resta (`-`)
        3. Multiplicación (`\*`, requiere barra invertida para evitar que la terminal la interprete como un comodín)
        4. División entera (`/`)
        5. Módulo o resto de la división (`%`)
    - Operaciones relacionales (comparaciones), devuelven 1 si la condición es verdadera y 0 si es falsa:
        1. Igualdad (`=`)
        2. Desigualdad (`!=`)
        3. Menor que (`<`)
        4. Menor o igual (`<=`)
        5. Mayor que (`>`)
        6. Mayor o igual (`>=`)
    - Operaciones con cadenas de texto (strings):
        1. Extraer subcadenas (`substr`): permite obtener la longitud de una cadena
        2. Buscar la posición de un carácter específico (`index`).

### 7. Comando test:
#### El comando `test` expresion permite evaluar expresiones y generar un valor de retorno, `true` o `false`. Este comando puede ser reemplazado por el uso de corchetes de la siguiente manera `[ expresión ]`. Investigar qué tipo de expresiones pueden ser usadas con el comando `test`. Tenga en cuenta operaciones para: evaluación de archivos, evaluación de cadenas de caracteres y evaluaciones numéricas.
El comando `test` (o su equivalente funcional encerrado entre corchetes `[ expresión ]`) evalúa una condición lógica y devuelve un código de salida: `0` si la expresión es verdadera o un valor distinto de cero si es falsa.
Los tipos de expresiones que se pueden utilizar se dividen principalmente en tres categorías:
- **Evaluación de archivos**: Permiten verificar el estado, tipo o permisos de un archivo o directorio. Algunos ejemplos son:
    - `-e archivo`: Verifica si el archivo existe.
    - `-f archivo`: Verifica si existe y es un archivo regular.
    - `-d directorio`: Verifica si existe y es un directorio.
    - `-r`, `-w`, `-x archivo`: Comprueban si el archivo tiene permisos de lectura, escritura o ejecución, respectivamente.
    - `-s archivo`: Comprueba si el archivo no está vacío (tamaño mayor a cero).
- Evaluación de cadenas de caracteres (strings): Permiten comparar o verificar textos:
    - `"$str1" = "$str2"` o `"$str1" == "$str2"`: Verifica si ambas cadenas son iguales.
    - `"$str1" != "$str2"`: Verifica si son distintas.
    - `-z "$str"`: Verifica si la longitud de la cadena es cero (está vacía).
    - `-n "$str"`: Verifica si la longitud es mayor que cero (no está vacía).
- Evaluaciones numéricas: Utilizan operadores específicos para comparar números:
    - `$num1 -eq $num2`: Igual a (_equal_).
    - `$num1 -ne $num2`: Distinto de (_not equal_).
    - `$num1 -gt $num2`: Mayor que (_greater than_).
    - `$num1 -ge $num2`: Mayor o igual que (_greater than or equal_).
    - `$num1 -lt $num2`: Menor que (_less than_).
    - `$num1 -le $num2`: Menor o igual que (_less than or equal_).

### 8. Estructuras de control. Investigue la sintaxis de las siguientes estructuras de control incluidas en shell scripting:
- **if:**
```bash
if [ condition ]
then
    bloque
elif [ condition ]; then
    bloque
else
    bloque
fi 
```

- **case:**
```bash
case $variable in
    "valor 1") bloque ;;
    "valor 2")
        bloque
        ;;
    *)
        bloque
        ;;
esac
```

- **while:**
```bash
while [ condition ]
do
    bloque
done
```

- **for:**
```bash
for variable in lista_de_elementos
do
    bloque
done
```
(También admite la sintaxis estilo C: `for ((i=0; i < 5; i++)); do bloque; done`).

- **select** (Menú de opciones interactivo):
```bash
select variable in opcion1 opcion2 opcion3
do
    # en $variable está el valor elegido
    bloque
done
```
Genera automáticamente un menú numerado en la terminal a partir de una lista de opciones. Cuando el usuario selecciona un número, el valor elegido se almacena en la variable para ser procesado.


### 9. ¿Qué acciones realizan las sentencias break y continue dentro de un bucle? ¿Qué parámetros reciben?
- `break`: Su función es interrumpir y salir inmediatamente del bucle actual (ya sea `while`, `for` o `until`), deteniendo por completo las iteraciones restantes y continuando con la ejecución del script que se encuentre fuera del bucle.
- `continue`: Su función es saltar el resto de la iteración actual, ignorando las líneas de código que queden por debajo dentro del bucle, y pasar directamente a evaluar la siguiente iteración.
- **Parámetros**: Ambas sentencias pueden recibir opcionalmente un número entero como parámetro (por ejemplo, `break 2` o `continue 2`), el cual indica _cuántos niveles de bucles anidados hacia arriba se deben romper o saltar_. Si no se especifica ningún parámetro, por defecto afectan únicamente al bucle más interno en el que se encuentran.

### 10. ¿Qué tipo de variables existen? ¿Es shell script fuertemente tipado? ¿Se pueden definir arreglos? ¿Cómo?
- _¿Qué tipo de variables existen?_ En Bash, todas las variables **son tratadas internamente como strings**, aunque el intérprete puede evaluarlas numéricamente según el contexto. Por ejemplo, al usar operadores como `-eq` o comandos como `let`.
- _¿Es shell script fuertemente tipado?_ No, es un lenguaje de tipado débil o dinámico. No es necesario declarar el tipo de dato (entero, cadena, flotante) al crear una variable; su valor y tipo se adaptan automáticamente según la asignación.
- _¿Se pueden definir arreglos? ¿Cómo?_ Sí, Bash soporta arreglos (vectores) unidimensionales. Se pueden definir de las siguientes maneras:
    - Asignando valores explícitos entre paréntesis separados por espacios: `mi_arreglo=("valor1" "valor2" "valor3")`
    - Asignando valores a posiciones específicas mediante índices numéricos: `mi_arreglo[0]="primero"mi_arreglo[1]="segundo"`
    - Para hacer referencia a un elemento se usa `${mi_arreglo[indice]}` y para referenciar a todos los elementos se utiliza `${mi_arreglo[*]}` o `${mi_arreglo[@]}`.

### 11. ¿Pueden definirse funciones dentro de un script? ¿Cómo? ¿Cómo se maneja el pasaje de parámetros de una función a la otra?
Se pueden definir funciones para modularizar el código y reutilizar bloques de instrucciones. Existen dos sintaxis principales:
```bash
# Sintaxis 1
mi_funcion() {
    bloque de código
}

# Sintaxis 2 (usando la palabra reservada function)
function mi_funcion {
    bloque de código
}
```
El pasaje de parámetros a una función se realiza de manera idéntica a cómo se le envían argumentos a un script principal: se colocan a continuación del nombre de la función al invocarla. Por ejemplo: `mi_funcion "parametro1" 123`.  
Dentro de la función, se accede a estos valores utilizando las variables posicionales locales (`$1`, `$2`, `$#`, etc.), las cuales reemplazan temporalmente a los parámetros globales del script mientras la función se está ejecutando.


### 12. Evaluación de expresiones.
#### a. Realizar un script que le solicite al usuario 2 números, los lea de la entrada Standard e imprima la multiplicación, suma, resta y cual es el mayor de los números leídos.
```bash 
#!/bin/bash
echo "Ingrese el primer numero:"
read nro1

echo "Ingrese el segundo numero:"
read nro2

echo "Multiplicacion: $(expr $nro1 \* $nro2)"
echo "Suma: $(expr $nro1 + $nro2)"
echo "Resta: $(expr $nro1 - $nro2)"

if [ $num1 -gt $num2 ]; then
    echo "El mayor es el primer número: $num1"
elif [ $num1 -lt $num2 ]; then
    echo "El mayor es el segundo número: $num2"
else
    echo "Ambos números son iguales."
fi
exit 0
```

#### b. Modificar el script creado en el inciso anterior para que los números sean recibidos como parámetros. El script debe controlar que los dos parámetros sean enviados.
```bash 
#!/bin/bash

# Controla que se reciban exactamente 2 parámetros
if [ $# -ne 2 ]; then
    echo "Error: Debe ingresar exactamente dos números como parámetros."
    echo "Uso: $0 <numero1> <numero2>" # $0 guarda el nombre del script
    exit 1 # Al ser distinto de 0, indica error
fi

nro1=$1
nro2=$2

echo "Multiplicacion: $(expr $nro1 \* $nro2)"
echo "Suma: $(expr $nro1 + $nro2)"
echo "Resta: $(expr $nro1 - $nro2)"

if [ $num1 -gt $num2 ]; then
    echo "El mayor es el primer número: $num1"
elif [ $num2 -gt $num1 ]; then
    echo "El mayor es el segundo número: $num2"
else
    echo "Ambos números son iguales."
fi
exit 0
```

#### c. Realizar una calculadora que ejecute las 4 operaciones básicas: +, - ,*, %. Esta calculadora debe funcionar recibiendo la operación y los números como parámetros
```bash 
#!/bin/bash

# Chequeo de parametros (exactamente 3)
if [ $# -ne 3 ]; then
    echo "Error: La cantidad de parametros ingresada debe ser exactamente tres."
    echo "Sintaxis esperada: $0 <operacion> <numero 1> <numero 2>"
    echo "Operaciones validas: +, -, *, /"
    exit 1
fi

op=$1
nro1=$2
nro2=$3

case $op in
    "+") echo "Resultado: $(expr $nro1 + $nro2)" ;;
    "-") echo "Resultado: $(expr $nro1 - $nro2)" ;;
    "*") echo "Resultado: $(expr $nro1 \* $nro2)" ;;
    "%")
        if [ $nro2 -eq 0 ]; then
            echo "Error: Se esta intentando dividir por cero"
            exit 2
        fi
        echo "Resultado:"
        echo "Cociente: $(expr $nro1 / $nro2)"
        echo "Resto: $(expr $nro1 % $nro2)"
        ;;
    *)
        echo "Error: Operación '$op' no válida."
        echo "Utilice una de las siguientes: +, -, *, %"
        exit 3
        ;;
esac
exit 0
```

### 13. Uso de las estructuras de control:
#### a. Realizar un script que visualice por pantalla los números del 1 al 100 así como sus cuadrados.
```bash
#!/bin/bash
for ((i=1; i <= 100; i++)); 
do 
    echo "Numero $i, y su cuadrado: $(expr $i \* $i)"; 
done
exit 0
```

#### b. Crear un script que muestre 3 opciones al usuario: Listar, DondeEstoy y QuienEsta. Según la opción elegida se le debe mostrar:
- Listar: lista el contenido del directorio actual.
- DondeEstoy: muestra la ruta del directorio donde me encuentro ubicado.
- QuienEsta: muestra los usuarios conectados al sistema.
```bash
#!/bin/bash
select opcion in "Listar" "DondeEstoy" "QuienEsta"
do
    case $opcion in
        "Listar")
            ls -l 
            ;;
        "DondeEstoy")
            pwd
            ;;
        "QuienEsta")
            who
            ;;
        *) 
            echo "Opción inválida. Por favor, elija una opción válida."
            ;;
    esac
done
exit 0
```

#### c. Crear un script que reciba como parámetro el nombre de un archivo e informe si el mismo existe o no, y en caso afirmativo indique si es un directorio o un archivo. En caso de que no exista el archivo/directorio cree un directorio con el nombre recibido como parámetro.
```bash
#!/bin/bash

if [ $# -ne 1 ] ; then
    echo "Error: La cantidad de parametros ingresada debe ser exactamente uno."
    echo "Se espera el nombre de un archivo"
    exit 1
fi

nombre=$1

if [ -f $nombre ]; then 
    echo "El nombre ingresado pertenece a un archivo."
elif [ -d $nombre ]; then 
    echo "El nombre ingresado pertenece a un directorio."
else 
    echo "El nombre ingresado no existe."
    mkdir $nombre
    echo "Directorio '$nombre' creado exitosamente."
fi
exit 0
```

### 14. Renombrando Archivos: haga un script que renombre solo archivos de un directorio pasado como parámetro, agregando una CADENA, contemplando las opciones:  
- `-a CADENA`: renombra el fichero concatenando `CADENA` al final del nombre del archivo  
- `-b CADENA`: renombra el fichero concatenando `CADENA` al comienzo del nombre del archivo  
- Ejemplos: Si tengo los siguientes archivos: `/tmp/a` `/tmp/b`, al ejecutar: `./renombra /tmp/ -a EJ` obtendré como resultado: `/tmp/aEJ` `/tmp/bEJ`. Y si ejecuto: `./renombra /tmp/ -b EJ` el resultado será: `/tmp/EJa` `/tmp/EJb`.

```bash
#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Error: La cantidad de parametros ingresada debe ser exactamente tres."
    echo "Sintaxis esperada: './renombra <directorio> <-a/-b> <cadena>'."
    exit 1
fi

dir=$1
param=$2
str=$3

if [ -d $dir ]; then 

    if [ "$param" != "-a" ] && [ "$param" != "-b" ]; then
        echo "Error: No existe la opcion $param" 
        echo "Por favor, ingrese -a o -b"
        exit 2
    fi

    case "$dir" in 
        */) ;;
        *) dir="$dir/" ;;
    esac

    for file in "${dir}"*; do

        if [ -f "$archivo" ]; then

            if [ "$param" == "-a" ]; then file_renamed=${dir}${file}${str}
            else file_renamed=${dir}${str}${file}
            fi

            mv ${file} ${file_renamed}
            echo "Se renombro correctamente el archivo '$file' a '$file_renamed'."
         
        fi
    done

    echo "Proceso terminado."

else
    echo "Error: El nombre $dir no corresponde a un directorio existente."
    exit 3
fi
exit 0
```

### 15. El comando cut nos permite procesar las líneas de la entrada que reciba (archivo, entrada estándar, resultado de otro comando, etc) y cortar columnas o campos, siendo posible indicar cuál es el delimitador de las mismas. Investigue los parámetros que puede recibir este comando y cite ejemplos de uso.  
- `cut`: herramienta de filtrado muy potente que se utiliza para extraer secciones específicas de cada línea de un archivo o de una entrada de texto (proveniente de la entrada estándar o del resultado de otro comando). Permite recortar por campos delimitados o por posiciones exactas de caracteres.
    - `cut -f <lista>` (_fields_): Permite seleccionar qué campos o columnas se desean extraer. La lista puede ser un número único (`-f1`), una combinación separada por comas (`-f1,3`) o un rango (`-f1-4`).
    - `cut -d <delimitador>` (_delimiter_): Define el carácter que actúa como separador de campos (por defecto, si no se especifica, utiliza la tabulación).
    - `cut -c <lista>` (_characters_): Extrae columnas basándose en posiciones fijas de caracteres en lugar de campos delimitados (por ejemplo, `-c1-5` toma los primeros 5 caracteres de cada línea).
    - `cut -b <lista>` (_bytes_): Similar a `-c`, pero opera a nivel de bytes individuales.
    - `cut --complement`: Invierte la selección, es decir, muestra todo el contenido de la línea excepto los campos o caracteres seleccionados. (Complemento, en conjuntos)

### 16. Realizar un script que reciba como parámetro una extensión y haga un reporte con 2 columnas, el nombre de usuario y la cantidad de archivos que posee con esa extensión. Se debe guardar el resultado en un archivo llamado reporte.txt
```bash
#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: La cantidad de parametros ingresada debe ser exactamente uno."
    echo "Sintaxis esperada: '$0 <extension>'."
    exit 1
fi
ext=$1
if [ $(echo "$ext" | cut -c1-1) != "." ]; then
    echo "Error: La extension debe comenzar con un punto."
    exit 2
fi
if [ $(echo "$ext" | cut -d" " -f1) != "$ext" ]; then
    echo "Error: La extension no debe tener espacios."
    exit 3
fi

echo "Usuario -- Cantidad de archivos '$ext'" > "test/reporte.txt"
echo "----------------------------------------" >> "test/reporte.txt"

for i in /home/*; 
do
    user_name=$(echo ${i} | cut -d/ -f3)
    user_home=$i


    if [ -d ${user_home} ]; then
        echo "Espera un momento... Escribiendo datos..."
        amountOfFiles=$(find $user_home -name "*${ext}" 2> /dev/null | wc -l)
        echo "$user_name -- $amountOfFiles" >> "test/reporte.txt"
    fi
done
exit 0
```

### 17. Escribir un script que al ejecutarse imprima en pantalla los nombre de los archivos que se encuentran en el directorio actual, intercambiando minúsculas por mayúsculas, además de eliminar la letra a (mayúscula o minúscula). Por ejemplo, si en el directorio actual están los siguientes archivos:  
- IsO  
- pepE  
- Maria    
y ejecutó: `./ejercicio17`, se obtendrá como resultado:  
- iSo  
- PEPe  
- mRI    
Ayuda: Investigar el comando `tr` 

- `tr`(_translate_): permite traducir, transformar o eliminar caracteres de la entrada estándar y escribir el resultado en la salida estándar.
    - Sintaxis: `tr [opciones] conjunto1 [conjunto2]`
        - `conjunto1`: Los caracteres que se buscarán en la entrada.
        - `conjunto2`: Los caracteres de reemplazo correspondientes a cada posición de `conjunto1`.
    - `tr -d` (_delete_): Eliminar caracteres específicos, por ejemplo, eliminar tanto la letra a minúscula como la A mayúscula: `tr -d 'aA'`.

```bash
#!/bin/bash
current_dir=$(pwd)
while read -r line
do
    echo $(echo $line | tr -d'aA' | tr 'a-zA-Z' 'A-Za-z') 
done < current_dir
exit 0
```

### 18. Crear un script que verifique cada 10 segundos si un usuario se ha logueado en el sistema (el nombre del usuario será pasado por parámetro). Cuando el usuario finalmente se loguee, el programa deberá mostrar el mensaje "Usuario XXX logueado en el sistema" y salir.  
```bash
#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Error: La cantidad de parametros ingresada debe ser exactamente uno."
    echo "Sintaxis esperada: '$0 <usuario>'."
    exit 1
fi

user=$1

while true
do
    sleep 10
    who | grep ${user}
    if [ $? = 0 ]; then
        echo "Usuario ${user} logueado en el sistema"
        break
    fi
done
exit 0
```

### 19. Escribir un Programa de "Menu de Comandos Amigable con el Usuario" llamado menú, el cual, al ser invocado, mostrará un menú con la selección para cada uno de los scripts creados en esta práctica. Las instrucciones de cómo proceder deben mostrarse junto con el menú. El menú deberá iniciarse y permanecer activo hasta que se seleccione Salir. Por ejemplo:  
```
MENU DE COMANDOS  
03. Ejercicio 3  
12. Evaluar Expresiones  
13. Probar estructuras de control  
...  
Ingrese la opción a ejecutar: 03
```

```bash
#!/bin/bash

opciones=(
    "Ejercicio 3"
    "Ejercicio 12c - Calculadora"
    "Ejercicio 13a - Cuadrados del 1 al 100"
    "Ejercicio 13b - Comandos rápidos (Listar, DondeEstoy, QuienEsta)"
    "Ejercicio 13c - Verificar o crear archivo/directorio"
    "Ejercicio 14 - Renombrar archivos (-a / -b)"
    "Ejercicio 16 - Generar reporte de extensión por usuario"
    "Ejercicio 17 - Intercambiar mayusculas y minusculas"
    "Ejercicio 18 - Monitorear logueo de usuario"
    "Salir"
)

select opt in $(ls)
do
    case $opt in 
        "Ejercicio 3")
            ./ejercicio3
            ;;
        "Ejercicio 12c - Calculadora")
            echo "Ingrese una operacion (+, -, *, /):"
            read op
            echo "Ingrese un numero"
            read num1
            echo "Ingrese un numero"
            read num1
            ./ejercicio12 $op $num1 $num2
            ;;
        "Ejercicio 13a - Cuadrados del 1 al 100")
            ./ejercicio13a
            ;;
        "Ejercicio 13b - Comandos rápidos (Listar, DondeEstoy, QuienEsta)")
            ./ejercicio13b
            ;;
        "Ejercicio 13c - Verificar o crear archivo/directorio")
            echo "Ingrese el nombre de un archivo:"
            read file
            ./ejercicio13c $file
            ;;
        "Ejercicio 14 - Renombrar archivos (-a / -b)")
            echo "Ingrese el nombre de un archivo:"
            read file
            echo "Ingrese una opcion -a (after) / -b (before):"
            read param
            echo "Ingrese una cadena:"
            read str
            ./ejercicio14 $file $param $str
            ;;
        "Ejercicio 16 - Generar reporte de extensión por usuario")
            echo "Ingrese una extension a buscar:"
            read ext
            ./ejercicio16 $ext
            ;;
        "Ejercicio 17 - Intercambiar mayusculas y minusculas")
            ./ejercicio17
            ;;
        "Ejercicio 18 - Monitorear logueo de usuario")
            echo "Ingrese el nombre de un usuario:"
            read user
            ./ejercicio18 user
            ;;
        "Salir")
            exit 0
            ;;
    esac
done
```

### 20. Pila/Stack:
#### a. Realice un script que simule el comportamiento de una estructura de PILA e implemente las siguientes funciones aplicables sobre una estructura global definida en el script:  
- push: Recibe un parámetro y lo agrega en la pila  
- pop: Saca un elemento de la pila 
- length: Devuelve la longitud de la pila 
- print: Imprime todos elementos de la pila  
#### b. Dentro del mismo script y utilizando las funciones implementadas:  
1. Agregue 10 elementos a la pila  
2. Saque 3 de ellos  
3. Imprima la longitud de la pila  
4. Luego imprima la totalidad de los elementos que en ella se encuentran.  

```bash
#!/bin/bash

stack=()

function push {
    if [ $# -eq 1 ]; then
        stack[${#stack[@]}]=$1
    else
        echo "Error: se espera exactamente un parametro"
        return 1    
    fi
    return 0
}

function pop {
    local len=${#stack[@]}
    if [ "$len" -gt 0 ]; then
        echo "${stack[$((len - 1))]}"
        unset "${stack[$((len - 1))]}"     
    else
        echo "Error: La pila ya se encuentra vacía."
        return 1
    fi
    return 0
}

function length {
    echo "${#stack[@]}"
    return 0
}

function print {
    echo "${stack[@]}"
    return 0
}

for ((i=0; i < 10; i++))
do
    echo "Agregando elemento $i.."
    push $i
done

for ((i=0; i < 3; i++))
do
    echo "Sacando elemento: "
    pop
done

echo -n "Longitud actual: "
length

echo -n "Elementos en la pila: "
print

exit 0
```

### 21. Dada la siguiente declaración al comienzo de un script:  
- `num=(10 3 5 7 9 3 5 4) ` 
#### Implemente la función productoria dentro de este script, cuya tarea sea multiplicar todos los números que el arreglo contiene. (la cantidad de elementos del arreglo puede variar).    
```bash
#!/bin/bash

num=(10 3 5 7 9 3 5 4)

function productoria {
    local total=1
    for i in ${num[@]}
    do
        total=$((total * i))
    done
    echo "El producto total es: $total"
    return 0
}
```

### 22. Implemente un script que recorra un arreglo compuesto por números e imprima en pantalla sólo los números pares y que cuente sólo los números impares y los informe en pantalla al finalizar el recorrido. 
```bash
#!/bin/bash

array=(10 3 5 7 9 3 5 4)
amountOddNum=0
for ((i=0; i < ${#array[@]}; i++))
do
    if [ $((array[i] % 2)) -eq 0 ]; then
        echo "Numero par ${array[i]} encontrado."
    else
        amountOddNum=$((amountOddNum + 1))
    fi
done
echo "Cantidad de numeros impares: $amountOddNum"
exit 0
```

### 23. Dada la definición de 2 vectores del mismo tamaño y cuyas longitudes no se conocen.  
vector1=(1..N)    
vector2=(1..N)   
Por ejemplo: 
`vector1=( 1 80 65 35 2 )` y `vector2=( 5 98 3 41 8 )`.  
Complete este script de manera tal de implementar la suma elemento a elemento entre ambos vectores y que la misma sea impresa en pantalla de la siguiente manera:  
- La suma de los elementos de la posición 0 de los vectores es 6  
- La suma de los elementos de la posición 1 de los vectores es 178   
...   
- La suma de los elementos de la posición 4 de los vectores es 10 

```bash
#!/bin/bash

vector1=( 1 80 65 35 2 )
vector2=( 5 98 3 41 8 )  

if [ ${#vector1[@]} -ge ${#vector2[@]} ]; then
    len=${#vector1[@]}
else
    len=${#vector2[@]}
fi

for ((i=0; i < len; i++))
do
    echo "La suma de los elementos de la posicion $i de los vectores es $((vector1[i] + vector2[i]))"
done
exit 0
```

### 24. Realice un script que agregue en un arreglo todos los nombres de los usuarios del sistema pertenecientes al grupo “users”. Adicionalmente el script puede recibir como parámetro:  
- `-b n`: Retorna el elemento de la posición n del arreglo si el mismo existe. Caso contrario, un mensaje de error.  
- `-l`: Devuelve la longitud del arreglo  
- `-i`: Imprime todos los elementos del arreglo en pantalla  

```bash
#!/bin/bash

users=($(grep "^users:" /etc/group | cut -d: -f4 | tr ',' ' '))

if [ $# -eq 2 ] && [ $1 = '-b' ]; then 
    pos=$2
    if [ $pos -ge ${#users[@]} ]; then
        echo "Error: no existe la posicion $pos."
        exit 1
    else
        echo "${users[$pos]}" 
    fi

elif [ $# -eq 1 ]; then
    param=$1
    case $param in
        '-l')   
            echo "${#users[@]}"
            ;;
        '-i')
            echo "${users[@]}"
            ;;
        *) 
            echo "Error: Sintaxis esperada: $0 <parametro>"
            echo "Parametros esperados: -b <n> / -l / -i"
    esac
elif [ $# -eq 0 ]; then
    exit 0
else
    echo "Sintaxis esperada: $0 <parametro>"
    echo "Parametros esperados: -b <n> / -l / -i"
    exit 1
fi
exit 0

```

### 25. Escriba un script que reciba una cantidad desconocida de parámetros al momento de su invocación (debe validar que al menos se reciba uno). Cada parámetro representa la ruta absoluta de un archivo o directorio en el sistema. El script deberá iterar por todos los parámetros recibidos, y solo para aquellos parámetros que se encuentren en posiciones impares (el primero, el tercero, etc) el verificar si el archivo o directorio existen en el sistema, imprimiendo en pantalla que tipo de objeto es (archivo o directorio). Además, deberá informar la cantidad de archivos o directorios inexistentes en el sistema. 
```bash
#!/bin/bash

if [ $# -ge 1 ]; then 
    args=("$@")
    amountNonExist=0

    for ((i=0; i < ${#args[@]}; i++))    
    do
        if [ $(expr $i % 2) -eq 0 ]; then #evaluo que sean pares porque lo guarde en un array, el cual empieza con indice 0
            if [ -f ${args[$i]} ]; then
                echo "${args[$i]} es un archivo."
            elif [ -d ${args[$i]} ]; then
                echo "${args[$i]} es un directorio."
            else
                echo "${args[$i]} no existe o no es valido."
                amountNonExist=$(expr $amountNonExist + 1)
            fi
        fi
    done
    echo "Cantidad de arhcivos o directorios inexistentes: $amountNonExist"

else
    echo "Error: se espera como minimo una ruta absoluta como parametro."
    exit 1
fi
exit 0
```

### 26. Realice un script que implemente a través de la utilización de funciones las operaciones básicas sobre arreglos:  
- inicializar: Crea un arreglo llamado array vacío  
- agregar_elem <parametro1>: Agrega al final del arreglo el parámetro recibido  
- eliminar_elem <parametro1>: Elimina del arreglo el elemento que se encuentra en la posición recibida como parámetro. Debe validar que se reciba una posición válida  
- longitud: Imprime la longitud del arreglo en pantalla  
- imprimir: Imprime todos los elementos del arreglo en pantalla  
- inicializar_Con_Valores <parametro1><parametro2>: Crea un arreglo con longitud <parametro1> y en todas las posiciones asigna el valor <parametro2>  

```bash
#!/bin/bash

inicializar() {
    array=()
}

agregar_elem() {
    if [ $# -eq 1 ]; then
        param=$1
        len=${#array[@]}
        array[$len]=$param
    else
        echo "Error: Se espera exactamente un parametro."
        return 1
    fi
    return 0
}

eliminar_elem() {
    if [ $# -eq 1 ]; then
        if [ $1 -lt ${#array[@]} ]; then
            unset array[$1]
        else
            echo "Error: La posicion recibida no existe en el arreglo"
            return 2
        fi
    else 
        echo "Error: Se espera exactamente un parametro."
        return 1
    fi
}

longitud() {
    echo ${#array[@]}
}

imprimir() {
    echo ${array[@]}
}

inicializar_Con_Valores(){
    if [ $# -eq 2 ]; then
        for ((i=0; i < $1; i++))
        do
            array[$i]=$2
        done
    else
        echo "Error: Se esperan exactamente dos parametros."
    fi
}

```

### 27. Realice un script que reciba como parámetro el nombre de un directorio. Deberá validar que el mismo exista y de no existir causar la terminación del script con código de error 4. Si el directorio existe deberá contar por separado la cantidad de archivos que en él se encuentran para los cuales el usuario que ejecuta el script tiene permiso de lectura y escritura, e informar dichos valores en pantalla. En caso de encontrar subdirectorios, no deberán procesarse, y tampoco deberán ser tenidos en cuenta para la suma a informar.  
```bash
#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Se espera exactamente un parametro."
    exit 1
else
    if [ -d $1 ]; then
        dir=$1
        amount_r=0
        amount_w=0
        for f in "${dir}"/*
        do
            if [ -f $f ]; then
                if [ -r $f ]; then
                    amount_r=$(expr $amount_r + 1)
                fi
                if [ -w $f ]; then
                    amount_w=$(expr $amount_w + 1)
                fi
            fi
        done
        echo "La cantidad de archivos con permisos de lectura es: $amount_r."
        echo "La cantidad de archivos con permisos de escritura es: $amount_w"
        
    else
        echo "Error: no existe el directorio pasado por parametro"
        exit 4
    fi
fi
exit 0 
```

### 28. Implemente un script que agregue a un arreglo todos los archivos del directorio /home cuya terminación sea .doc. Adicionalmente, implemente las siguientes funciones que le permitan acceder a la estructura creada:  
- verArchivo <nombre_de_archivo>: Imprime el archivo en pantalla si el mismo se encuentra en el arreglo. Caso contrario imprime el mensaje de error “Archivo no encontrado” y devuelve como valor de retorno 5  
- cantidadArchivos: Imprime la cantidad de archivos del /home con terminación .doc  
- borrarArchivo <nombre_de_archivo>: Consulta al usuario si quiere eliminar el archivo lógicamente. Si el usuario responde Si, elimina el elemento solo del arreglo. Si el usuario responde No, elimina el archivo del arreglo y también del FileSystem. Debe validar que el archivo exista en el arreglo. En caso de no existir, imprime el mensaje de error "Archivo no encontrado" y devuelve como valor de retorno 10.
```bash
#!/bin/bash

array=($(find /home/* -name '*.doc'))

verArchivo() {
    if [ $# -eq 1 ]; then
        local file=$1
        local found=0
        local index=0
        for ((i=0; i < ${#array[@]}; i++))
        do
            if [ $file = $(basename ${array[$i]}) ]; then
                found=1
                index=$i
                break
            fi
        done
        if [ $found -eq 1 ]; then
            cat "${array[$index]}"
        else
            echo "Archivo no encontrado."
            return 5
        fi
    else
        echo "Error: Se espera exactamente un parametro."
        return 1
    fi
    return 0
}

cantidadArchivos() {
    echo "${#array[@]}"
    return 0
}

borrarArchivo() {
    if [ $# -eq 1 ]; then
        local file=$1
        local found=0
        local index=0
        for ((i=0; i < ${#array[@]}; i++))
        do
            if [ $file = $(basename ${array[$i]}) ]; then
                found=1
                index=$i
                break
            fi
        done
        if [ $found -eq 1 ]; then
            echo "Desea borrar solo de forma logica el archivo?: "
            read opt
            case $opt in
                Si)
                    unset array[$index]
                    ;;
                No)
                    rm -f "${array[$index]}"
                    unset array[$index]
                    ;;
                *)
                    echo "Error: Debe ingresar 'Si' o 'No'."
                    return 2
                    ;;
            esac
        else
            echo "Archivo no encontrado."
            return 10
        fi
    else
        echo "Error: Se espera exactamente un parametro."
        return 1
    fi
    return 0
}

```

### 29. Realice un script que mueva todos los programas del directorio actual (archivos ejecutables) hacia el subdirectorio "bin" del directorio HOME del usuario actualmente logueado. El script debe imprimir en pantalla los nombres de los que mueve, e indicar cuántos ha movido, o que no ha movido ninguno. Si el directorio "bin" no existe, deberá ser creado.  
```bash
#!/bin/bash

amountMoves=0

if [ ! -d "$HOME/bin" ]; then
    mkdir "$HOME/bin"
fi

for file in ./*
do
    if [ -f "$file" ] && [ -x "$file" ]; then
        mv "$file" "$HOME/bin"
        echo "Se movio: $file"
        amountMoves=$(expr $amountMoves + 1)
    fi
done

if [ $amountMoves -eq 0 ]; then
    echo "No se ha movido ningún archivo."
else
    echo "Cantidad de movimientos: $amountMoves."
fi

exit 0
```

### 30. Implemente la estructura de datos Set (Conjunto de valores) en Bash. Un conjunto se define como una colección de valores únicos, es decir que solo almacena una vez cada valor, aún cuando se intente agregar el mismo valor más de una vez. La implementación debe soportar las siguientes operaciones mediante funciones: 
- initialize - inicializa el set vacío. 
- initialize_with - inicializa el set con un conjunto de valores que recibe como argumento (debe validar que se reciba al menos uno). 
- add - Agrega un valor al conjunto, el cual recibe como argumento. No debe agregar elementos repetidos. El resultado de la operación será un éxito sólo si el valor puede ser agregado al conjunto. 
- remove - Elimina uno o más valores del conjunto, los cuales recibe como argumentos. Si la operación elimina al menos un valor, se considera un éxito. 
- contains - Chequea si el conjunto contiene un valor recibido como argumento. El resultado será éxito si el valor está en el conjunto. 
- print - Imprime los elementos del conjunto, de a uno por línea. 
- print_sorted - Imprime los elementos del conjunto, de a uno por línea y ordenados alfabéticamente. Tip: Investigar cómo combinar el comando `sort` con la función `print`. 
```bash
#!/bin/bash

initialize() {
    array_set=()
}

initialize_with() {
    if [ $# -ge 1 ]; then
        array_set=("$@")
    else
        echo "Error: Se necesita un parametro como minimo."
        return 1
    fi
    return 0
}

add() {
    if [ $# -eq 1 ]; then
        local found=0
        local param=$1
        for e in "${array_set[@]}"
        do
            if [ "$param" = "$e" ]; then
                found=1
                break
            fi
        done
        if [ $found -eq 0 ]; then
            array_set[${#array_set[@]}]=$param
        else
            echo "Error: No se puede agregar $param porque ya se encuentra en el set."
            return 2
        fi
    else
        echo "Error: Se necesita un parametro exactamente."
        return 1
    fi
    return 0
}

remove() {
    if [ $# -ge 1 ]; then
        local success=0
        for r in "$@"
        do
            for ((i=0; i < ${#array_set[@]}; i++))  
            do
                if [ $r = ${array_set[$i]} ]; then
                    unset array_set[$i]
                    array_set=("${array_set[@]}")
                    success=1
                    break
                fi
            done
        done
    else
        echo "Error: Se necesita un parametro como minimo."
        return 1
    fi
    if [ $success = 0 ]; then
        echo "Error: No se pudo eliminar ningun elemento pasado por parametro."
        return 2
    fi
    return 0
}

contains() {
    if [ $# -eq 1 ]; then
        local found=0
        local param=$1
        for e in "${array_set[@]}"
        do
            if [ "$param" = "$e" ]; then
                found=1
                break
            fi
        done
        if [ $found -eq 0 ]; then
            echo "No se encuentra el elemento buscado."
            return 2
        fi
    else
        echo "Error: Se necesita un parametro exactamente."
        return 1
    fi
    return 0
}

print() {
    for e in "${array[@]}"
    do
        echo "$e"
    done
}

print_sorted() {
    print | sort -n
}

```

### 31. Realice un script que reciba como argumento una lista de posibles nombres de usuarios del sistema y, para cada uno de los que efectivamente existan en el sistema y posean un directorio personal configurado que sea válido, realice las modificaciones necesarias en su directorio personal para que tenga un subdirectorio llamado “directorio_iso” con la siguiente estructura:
```
directorio_iso 
├── 2025 
│   ├── 01 
│   │   └── archivo.txt 
│   ├── 02 
│   │   └── archivo.txt 
│   ├── 03 
│   │   └── archivo.txt 
│   ├── 04 
│   │   └── archivo.txt 
│   ├── 05 
│   │   └── archivo.txt 
│   ├── 06 
│   │   └── archivo.txt 
│   ├── 07 
│   │   └── archivo.txt 
│   ├── 08 
│   │   └── archivo.txt 
│   ├── 09 
│   │   └── archivo.txt 
│   ├── 10 
│   │   └── archivo.txt 
│   ├── 11 
│   │   └── archivo.txt 
│   └── 12 
│       └── archivo.txt 
└── 2026 
    ├── 01 
    │   └── archivo.txt 
    ├── 02 
    │   └── archivo.txt 
    ├── 03 
    │   └── archivo.txt 
    ├── 04 
    │   └── archivo.txt 
    ├── 05 
    │   └── archivo.txt 
    ├── 06 
    │   └── archivo.txt 
    ├── 07 
    │   └── archivo.txt
    ├── 08 
    │   └── archivo.txt 
    ├── 09 
    │   └── archivo.txt 
    ├── 10 
    │   └── archivo.txt 
    ├── 11 
    │   └── archivo.txt 
    └── 12 
        └── archivo.txt  
```
Para resolver la creación de los directorios y archivos utilice la funcionalidad “Brace Expansion” brindada por bash: https://www.gnu.org/software/bash/manual/html_node/Brace-Expansion.html

```bash
#!/bin/bash

if [ $# -ge 1 ]; then
    for username in "$@"
    do
        found=0
        for userhome in /home/*
        do
            if [ "$username" = "$(basename $userhome)" ]; then
                echo "Generando archivos y directorios en el directorio /home del usuario $username."
                mkdir -p "$userhome/directorio_iso"/{2025,2026}/{01..12}
                touch "$userhome/directorio_iso"/{2025,2026}/{01..12}/archivo.txt
                found=1
                break
            fi
        done
        if [ $found -eq 0 ]; then
            echo "Aviso: El usuario '$username' no existe en el sistema o su directorio home no es válido." 
        fi
    done
else
    echo "Error: Se espera como minimo un parametro"
    exit 1
fi
exit 0

```