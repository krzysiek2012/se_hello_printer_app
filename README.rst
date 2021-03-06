.. image:: https://app.statuscake.com/button/index.php?Track=3tUBihXJbe&Days=1&Design=1
  :target: https://www.statuscake.com

.. image:: https://travis-ci.org/krzysiek2012/se_hello_printer_app.svg?branch=master
  :target: https://travis-ci.org/krzysiek2012/se_hello_printer_app

Simple Flask App
================

Aplikacja Dydaktyczna wyświetlająca imię i wiadomość w różnych formatach dla zajęć
o Continuous Integration, Continuous Delivery i Continuous Deployment.

- Rozpocząnając pracę z projektem (wykorzystując virtualenv). Hermetyczne środowisko dla pojedyńczej aplikacji w python-ie:

  ::


    # ubuntu, add to ~/.bashrc
    #Na stronie można znaleźć informacje jak skonfigurować bash.rc
    #aby virtualenv włączał się automatycznie wraz z Terminalem
    #Kompatybilne z wersja Linux ubuntu 20.04
    #https://dev.to/jsgurugit/how-to-setup-python-virtual-environment-for-python3-on-ubuntu-19-10-dkp
    #
    $ source /usr/local/bin/virtualenvwrapper.sh

    # tworzymy hermetyczne środowisko dla bibliotek aplikacji:
    $ mkvirtualenv wsb-simple-flask-app
    $ pip install -r requirements.txt
    $ pip install -r test_requirements.txt

    # z makefile
    $ make deps

  Sprawdź: [documentację virtualenvwrappera] (https://virtualenvwrapper.readthedocs.io/en/latest/command_ref.html) _ oraz [biblioteki flask] (http://flask.pocoo.org).

- Uruchamianie applikacji:

  ::

    # jako zwykły program
    $ python main.py

    # albo:
    $ PYTHONPATH=. FLASK_APP=hello_world flask run

- Uruchamianie testów (see: http://doc.pytest.org/en/latest/capture.html):

  ::

    $ PYTHONPATH=. py.test
    $ PYTHONPATH=. py.test  --verbose -s

- Kontynuując pracę z projektem, aktywowanie hermetycznego środowiska dla aplikacji py:

  ::

    $ source /usr/local/bin/virtualenvwrapper.sh # nie trzeba, jeśli już w .bashrc
    $ workon wsb-simple-flask-app

    ...

    # deaktywacja virtualenv
    $ deactivate

- Integracja z TravisCI:

  ::

    ...


Pomocnicze
==========

Ubuntu
------

- Instalacja python virtualenv i virtualenvwrapper:

  ::

    $ sudo pip install virtualenv
    $ sudo pip install virtualenvwrapper

- Instalacja dockera: `dockerce howto <https://docs.docker.com/install/linux/docker-ce/ubuntu/>`_


Materiały
=========

- https://virtualenvwrapper.readthedocs.io/en/latest/
