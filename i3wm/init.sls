{%- from 'i3wm/map.jinja' import i3 with context %}

i3wm-repo:
  {%- if salt.grains.get('osfullname') == 'Ubuntu' %}
  pkgrepo.managed:
    - name: deb http://debian.sur5r.net/i3/ {{ salt.grains.get('lsb_distrib_codename') }} universe
    - file: /etc/apt/sources.list.d/i3.list
    - require_in:
      - pkg: i3wm-repo
  pkg.latest:
    - name: sur5r-keyring
    - skip_verify: True
    - require_in:
      - pkg: i3wm
  {%- endif %}

i3wm:
  pkg.latest:
    - pkgs:
      {%- for pkg in i3.lookup.get('packages') %}
      - {{ pkg }}
      {%- endfor %}
