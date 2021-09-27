# yar2dev_infra
yar2dev Infra repository

# ДЗ№5 Сборка образов VM при помощи Packer



Создан сервисный аккаунт и назначены ему права editor.
Создан ключевой файл, для поступа к сервисному аккаунту через Packer
Создан шаблонный конфигурационный файл ubuntu16.json и файл перменных variables.json к нему.
Выполнена проверка запуском - packer build -var-file variables.json ubuntu16.json
Создан полный образ с приложением puma с помошью конфигурационного файла immutable.json
Создан скрипт create-reddit-vm.sh для автоматического разворачивания инстанса с установленным приложением из образа reddit-full
