# yar2dev_infra
yar2dev Infra repository

# Знакомство с облачной инфраструктурой и облачными сервисами

## 

Для подключения к хосту "someinternalhost" в одну команду использользуется ключ -J (ProxyJump)

ssh -i ~/.ssh/appuser -J appuser@178.154.222.209 appuser@10.128.0.5

порядок действий для подключения командой ssh someinternalhost:

если отстствует файл ~/.ssh/config создадим его

touch ~/.ssh/config

Внесем в файл следующие строки:

###bastion host
Host bastion
  HostName 178.154.222.209
  User appuser
  IdentityFile ~/.ssh/appuser



###someinternalhost
Host someinternalhost
  HostName 10.128.0.5
  ProxyJump bastion
  User appuser
  IdentityFile ~/.ssh/appuser

Далее выполним команду 

ssh someinternalhost



В скрипте **setupvpn.sh** изменен метод установки пакета pritunl, ввиду отстутствия его в репозитарии, с repo.pritunl.com на github, так же дополнительно устанавливаются openvpn pritunl-ndppd пакеты.



bastion_IP = 178.154.222.209
someinternalhost_IP = 10.128.0.5