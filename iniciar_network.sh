#!/bin/bash
echo "--- INICIANDO LA NETWORK (MODO 16GB) ---"

# 1. Iniciar PROXY (Velocity)
# Asignamos 1GB. Es más que suficiente para miles de conexiones.
echo "> Encendiendo Velocity (Proxy)..."
cd Proxy
java -Xms1G -Xmx1G -jar velocity.jar > log.txt 2>&1 &
PID_PROXY=$!
cd ..

# 2. Iniciar LOBBY
# Asignamos 2GB. Ideal para que el login sea instantáneo.
echo "> Encendiendo Lobby..."
cd Lobby
java -Xms2G -Xmx2G -jar paper.jar --nogui > log.txt 2>&1 &
PID_LOBBY=$!
cd ..

# 3. Iniciar SURVIVAL
# Asignamos 10GB. ¡La bestia!
echo "> Encendiendo Survival..."
echo "> NOTA: Escribe 'stop' aquí para apagar todo la network."
cd Survival
java -Xms10G -Xmx10G -jar paper.jar --nogui 

# Apagado
echo "--- APAGANDO EL RESTO DE LA NETWORK ---"
kill $PID_PROXY
kill $PID_LOBBY
echo "Todo apagado correctamente."