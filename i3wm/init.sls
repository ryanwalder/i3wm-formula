{%- from 'i3wm/map.jinja' import i3 with context %}

i3wm:
  {%- if salt.grains.get('osfullname') == 'Ubuntu' %}
  pkgrepo.managed:
    # TODO: Make more intelligent for different OS; if upstream:
      # Below for Ubuntu, Backports for Debian
    - name: deb http://debian.sur5r.net/i3/ {{ salt.grains.get('lsb_distrib_codename') }} universe
    - file: /etc/apt/sources.list.d/i3.list
    - keyid: 941C42E6
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: i3wm
  {%- endif %}
  pkg.latest:
    - pkgs:
      {%- for pkg in i3.lookup.get('packages') %}
      - {{ pkg }}
      {%- endfor %}
