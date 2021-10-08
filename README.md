# yar2dev_infra
yar2dev Infra repository


# ДЗ 7 Принципы организации инфраструктурного кода и работа над инфраструктурой в команде на примере Terraform

Создана VPC Network
- в конфигурационном файле main.tf определены ресурсы yandex_vpc_network и yandex_vpc_subnet
- интерйфейс VM определен на созданный vpc_subnet

С помошью Packer и шаблонов app.json db.json соответственно создано два образа: с ruby и mondodb

Конфигурация терреаформ разделена на две части app.tf и db.tf для VM приложения и базы данных.

Далее конфигурации вынесены в отдельные модули app и db со своиси файлами variables и output.

Созданы раздельные окружения для stage и prod

В YC создан bucket terraform-state-storage-yar2dev
В него вынесен terraform-stage.tf и terraform-prod.tf для окружений stage и prod

В модули app и db добавлены провиженеры для деплоя приложения puma, настройки адреса mongodb
и настройки подключения к базе данных с любых IP.
