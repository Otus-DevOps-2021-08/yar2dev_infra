yc compute instance create \
  --name reddit-app-full \
  --hostname reddit-app-full \
  --memory=4 \
  --create-boot-disk image-folder-id=b1g57rqo8odl71qsg70r,image-name=reddit-full,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/appuser.pub
