Práctica de laboratorio #5: RSpec
=======================

## Descripción del equipo

  * Nombre del equipo: **LPP_T_3**
  * Miembros del equipo:
    * Ayose Jesús Castillo Barroso
    * César Ravelo Martínez

## Descripción de la práctica

  La práctica 5 propone implementar una gema Ruby para representar preguntas simples con pruebas RSpec para seguir el modelo TDD y su correcto funcionamiento. La estructura del repositorio es la siguiente:

  * [Documentación](doc/)
    * [Documentación de la Práctica](doc/prct5.pdf)
    * [Resultados de las Pruebas](doc/pruebas/index.html)
  * [Librerías](lib/)
    * [Gema Ruby Preguntas Simples](lib/pregunta/base.rb)
  * [RSpec](spec/)
  * [Fichero Rake con las tareas necesarias definidas](Rakefile)
  * Fichero readme con esta documentación




# LPPT3::Pregunta

Gema Ruby para representar preguntas de selección simple de Exámenes

## Instalación


Añadir esta linea al Gemfile de su aplicación


```ruby
gem 'pregunta'
```

y ejecutar:

    $ bundle

O instálelo usted mismo:

    $ gem install pregunta

## Uso

Para instanciar un objeto Pregunta basta con indicarle:

* Una pregunta
* Una respuesta correcta
* Un conjunto de respuestas erróneas

Puede mostrar por pantalla la pregunta invocando el método [:to_s](lib/pregunta/base.rb).
