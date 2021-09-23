# yar2dev_infra
yar2dev Infra repository

# ДЗ№3 Деплой тестового приложения

testapp_IP = 62.84.118.249
testapp_port = 9292



Для запуска получения инстанса с установленным приложением запустить:

yc compute instance create \
  --name reddit-app-autosetup \
  --hostname reddit-app-autosetup \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=./metadata.yaml
  