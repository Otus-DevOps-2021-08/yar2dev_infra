#output "external_ip_address_app" {
#  value = yandex_compute_instance.app.network_interface.0.nat_ip_address
#}
output "external_ip_addresses_apps" {
  value = [for s in yandex_compute_instance.app : map(s.name, s.network_interface.0.nat_ip_address)]
}

output "external_ip_address_lb" {
  value = [for s in yandex_lb_network_load_balancer.lb.listener : tolist(s.external_address_spec).0.address].0
}
