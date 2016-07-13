====
i3wm
====

.. note::

    See the full `Salt Formulas installation and usage instructions <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``i3wm``
--------

Installs the `i3 <https://i3wm.org>`_ window manager

Testing
=======

Testing is done wit kitchen-salt

``kitchen converge``
--------------------

Runs the postgres main state

``kitchen verify``
------------------

Runs serverspec tests on the actual instance

``kitchen test``
----------------

Builds and runs test from scratch

``kitchen login``
-----------------

Gives you ssh to the vagrant machine for manual testing
