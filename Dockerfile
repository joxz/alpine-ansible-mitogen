FROM jones2748/alpine-ansible-py3:latest

RUN set -euxo pipefail ;\
    pip3 install --no-cache --upgrade mitogen ;\
    touch /etc/ansible/ansible.cfg ;\
    echo "[defaults]" > /etc/ansible/ansible.cfg ;\
    echo "strategy_plugins = /usr/lib/python3.6/site-packages/ansible_mitogen/plugins/strategy" >> /etc/ansible/ansible.cfg ;\
    echo "strategy = mitogen_linear" >> /etc/ansible/ansible.cfg

WORKDIR /ansible

ENTRYPOINT ["/usr/bin/dumb-init","--","entrypoint.sh"]
CMD ["/bin/sh"]