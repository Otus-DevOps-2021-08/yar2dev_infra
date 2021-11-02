# yar2dev_infra
yar2dev Infra repository


# ДЗ 10 Ansible: работа с ролями и окружениями

Созданы структуры ролей для app и db командами ansible-galaxy init app и ansible-galaxy init db
В созданные роли пернесены секции task, templates, handlers и files из плейбуков ansible/app.yml и ansible/db.yml
В самих плейбуках теперь указаны вызовы соответствующих ролей.

Созданы окружения stage и prod в директории ansible/environments в них перенесен файл динамической инвентаризации. По умолчанию вызывается окружение stage.

Для использования переменных для групп хостов созданы папки group_vars в каждом из окружении и параметризированы файлы app.yml и db.yml.

Через файл зависимостей requirements.yml из ansible-galaxy добавлена роль jdauphant.nginx.
Роль jdauphant.nginx добавлена в плейбук app.yml.

Создан ключевой файл vault.key для шифрования файла credentials.yml содержащим пароли создаваемых пользователей.
Шифрование командами:
ansible-vault encrypt environments/prod/credentials.yml
ansible-vault encrypt environments/stage/credentials.yml
Путь к ключевому файлу указан в ansible.cfg.

В Github actions добавлены проверки для Ansibel, Terraform и Packer.
В README.md добавлены бейджи статусов.


![Ansible Validate](https://github.com/Otus-DevOps-2021-08/yar2dev_infra/actions/workflows/ansible-lint.yml/badge.svg)
![Packer Validate](https://github.com/Otus-DevOps-2021-08/yar2dev_infra/actions/workflows/packer_validate.yml/badge.svg)
![OTUS Tests](https://github.com/Otus-DevOps-2021-08/yar2dev_infra/actions/workflows/runtests.yml/badge.svg)
![Terraform Validate](https://github.com/Otus-DevOps-2021-08/yar2dev_infra/actions/workflows/terraform_validate.yml/badge.svg)
