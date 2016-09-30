# Equipos de fútbol - Persistencia en MongoDB con Morphia

## Objetivo
Testea el mapeo de una [aplicación de planteles de equipos de fútbol](https://github.com/uqbar-project/eg-equipos-futbol-mongodb/wiki) con MongoDB. 

## Modelo
La base de datos se estructura en un documento jerárquico:

* equipo 
 * jugadores

## Instalación
Antes de correr los test, tenés que instalar una base de datos MongoDB y levantar el server
(ejecutable mongod, en Linux sudo service mongod start). 

En la carpeta [scripts](scripts) vas a encontrar dos archivos:

* [Script Jugadores](scripts/Script Jugadores.txt) para ejecutarlo en el shell de MongoDB (ejecutable mongo). Este script inserta datos de varios equipos de fútbol con sus jugadores.
* [Queries Jugadores](scripts/Queries Jugadores.txt) con queries de ejemplo para probar directamente en el shell.

Acá te mostramos cómo correr los scripts con [Robomongo](https://robomongo.org/) un cliente MongoDB con algunas prestaciones gráficas:

![video](video/demo.gif)

Luego sí, podés correr los tests del proyecto Xtend, que verifica

* que Palermo no está en el plantel de Boca del juego de datos
* que Riquelme sí está en el plantel de Boca del juego de datos
* que hay dos jugadores que comienzan con "Casta" (Castagno de Tigre y Dino Castaño de Boca)

## Proyecto
El proyecto base de Xtend está usando el framework [Morphia - un ODM contra MongoDB](http://mongodb.github.io/morphia/).

**IMPORTANTE:** Usar la versión 1.2.1 o superior de Morphia ya que la anterior no se integra correctamente con Arena.


