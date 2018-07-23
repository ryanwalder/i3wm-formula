{%- from 'i3wm/map.jinja' import i3 with context %}

{%- if salt.grains.get('osfullname') == 'Ubuntu' %}
i3wm-repo:
  pkgrepo.managed:
    - name: deb http://debian.sur5r.net/i3/ {{ salt.grains.get('lsb_distrib_codename') }} universe
    - file: /etc/apt/sources.list.d/i3.list
    - keyid: E3CA1A89941C42E6
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: i3wm-repo
{%- endif %}

i3wm:
  pkg.latest:
    - pkgs:
      {%- for pkg in i3.lookup.get('packages') %}
      - {{ pkg }}
      {%- endfor %}
