#!/bin/bash

# Definición de las funciones
funcion_argumento() {
    echo "Función para el argumento"
    # Agrega aquí el código para el argumento
}

funcion_argumento1() {
    echo "Función para el argumento1"
    # Agrega aquí el código para el argumento1
}

# Número de repeticiones
num_repeticiones=5

# Bucle for para repetir los comandos
for ((i=0; i<num_repeticiones; i++))
do
    echo "Iteración $((i+1))"

    # Agrega aquí los comandos que quieras repetir
    echo "Información del sistema:"
    uname -a

    echo "Uso de memoria:"
    top -l 1 | head -10 | grep PhysMem

    echo "Listado de discos y espacio disponible:"
    df -h

    echo "Información de la CPU:"
    sysctl -n machdep.cpu.brand_string

    echo "Procesos en ejecución:"
    ps aux

    echo "Uso de CPU:"
    top -l 1 | head -10 | grep "CPU usage"

    echo "Información de red:"
    ifconfig

    echo "Usuarios conectados:"
    who

    echo "Versión de macOS:"
    sw_vers

    echo "Información de la batería (en caso de ser una laptop):"
    ioreg -l | grep -i capacity
    
    # Temporizador de 1 segundo entre iteraciones
    sleep 1

    # Verifica si se ha pasado algún argumento
    if [ "$1" ]; then
        argumento=$1

        # Estructura de condición para elegir entre dos funciones basadas en el argumento
        if [ "$argumento" == "argumento" ]; then
            funcion_argumento
        elif [ "$argumento" == "argumento1" ]; then
            funcion_argumento1
        else
            echo "Argumento no reconocido"
        fi
    else
        echo "No se ha pasado ningún argumento"
    fi
done



