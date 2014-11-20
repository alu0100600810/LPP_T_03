Desarrollo de gema Ruby: Gestión de Exámenes 
=======================
[![Coverage Status](https://coveralls.io/repos/alu0100600810/LPP_T_03/badge.png?branch=desarrollo)](https://coveralls.io/r/alu0100600810/LPP_T_03?branch=master)

## Descripción del equipo

  * Nombre del equipo: **LPP_T_3**
  * Miembros del equipo:
    * Ayose Jesús Castillo Barroso
    * César Ravelo Martínez

## Descripción de la práctica

  La práctica propone implementar una gema Ruby para representar exámenes de preguntas simples con pruebas RSpec para seguir el modelo TDD y su correcto funcionamiento. La estructura del repositorio es la siguiente:

  * [Documentación](doc/)
    * [Documentación de la Práctica](doc/)
    * [Resultados de las Pruebas](doc/pruebas/index.html)
  * [Librerías](lib/)
    * [Gema Ruby](lib/examen/base.rb)
    * [Código fuente de la clase Examen](lib/examen/examen.rb)
    * [Código fuente de la clase Pregunta](lib/examen/pregunta.rb)
    * [Códido fuente de la clase Pregunta Verdadero y Falso](lib/examen/pregunta_verdadero_falso.rb)
  * [RSpec](spec/)
  * [Fichero Rake con las tareas necesarias definidas](Rakefile)
  * Fichero readme con esta documentación




# Examen

Gema Ruby para representar exámenes formados por preguntas de selección simple. La secuencia de preguntas que pueda formar un examen
viene definida como una lista enlazada simple definida en la misma clase Examen donde cada nodo representa una instancia de la clase Pregunta.

## Instalación


Añadir esta linea al Gemfile de su aplicación


```ruby
gem 'examen'
```

y ejecutar:

    $ bundle

O instálelo usted mismo:

    $ gem install examen

## Uso

Para instanciar un objeto Pregunta basta con indicarle:

* Una pregunta
* Una respuesta correcta
* Un conjunto de respuestas erróneas

Puede mostrar por pantalla la pregunta invocando el método [:to_s](lib/examen/pregunta.rb).

Para instanciar un objeto Examen basta con indicarle una instancia de la clase Pregunta.
Puede mostrar por pantalla la pregunta invocando el método [:to_s](lib/examen/examen.rb).
