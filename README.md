# yar2dev_infra
yar2dev Infra repository


# ДЗ 11 Разработка и тестирование Ansible ролей и плейбуков
Travis test db role [![Build Status](https://app.travis-ci.com/yar2dev/ansible-db-role.svg?branch=master)](https://app.travis-ci.com/yar2dev/ansible-db-role)

При помощи Vagrant развернуты виртуальные машины на Virtualbox
Конфигурация находится в Vagrantfile

Доработана роли app db, такси выделены в отдельные файлы.
Параметризировнны файлы puma.yml и создан шаблон puma.service.j2 для создания сервиса.

Для работы веб сервиса через Ngnix добавлены дополнительные пременные в Vagrantfile

Скорретирован путь к ролям для пакера и выполнена проверка.

При помощи Molecule проведены тесты db роли на созданном molecule инстансе.

Роль db вынесена в отдельный репозитарий https://github.com/yar2dev/ansible-db-role, подключена в окружения stage и prod.

Подключен TravisCI к созданному репозитарию, прогон тестов выполняется на AWS.
Для использования AWS используются дополнительный модуль molecule-ec2.



![OTUS Tests](https://github.com/Otus-DevOps-2021-08/yar2dev_infra/actions/workflows/runtests.yml/badge.svg)
