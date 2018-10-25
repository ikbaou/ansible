
ansible-playbook -K --extra-vars "target_host=localhost target_env=simap.local" playbook.yml
ansible-playbook -K --extra-vars "target_host=app1-server.simap.local target_env=simap.local" playbook.yml

