#!/usr/bin/env python3

#This script get addresses from yandex cloud list and generate inventory json output for ansible
import os
import sys
import argparse
from subprocess import Popen, PIPE

try:
    import json
except ImportError:
    import simplejson as json

class AnsbleInventory(object):

    def __init__(self):
        self.inventory = {}
        self.read_cli_args()


        if self.args.list:
            self.inventory = self.ansible_inventory()

        print (json.dumps(self.inventory));

    # Template for inventory output
    def ansible_inventory(self):

        return {

            'app': {
                'hosts': app_ext_address,
                'vars': {
                    'db_internal': db_int_address,
                }
            },

            'db': {
                'hosts': db_ext_address,
                'vars': {
                    'example_variable': 'value'
                }
            },


            '_meta': {
                'hostvars': {}
            }
        }

    def read_cli_args(self):
        parser = argparse.ArgumentParser()
        parser.add_argument('--list', action = 'store_true')
        parser.add_argument('--host', action = 'store')
        self.args = parser.parse_args()


# Get app and db servers addresses from yc list.

yc_command = "(yc compute instance list)"

app_ext_address = []
db_ext_address = []

skip = False
response =Popen(yc_command, stdout=PIPE, stderr=PIPE,universal_newlines=True, shell=True)

with Popen(yc_command, stdout=PIPE, stderr=PIPE,universal_newlines=True, shell=True) as process:

    for line in process.stderr:
        skip = True

#Parsing yc output
    for line in process.stdout:

        if "app" in line:

            line = line.split("|")
            addr = line[5].strip()
            app_ext_address.append(addr)

        elif "db" in line:

            line = line.split("|")
            addr = line[5].strip()
            db_ext_address.append(addr)

            addr = line[6].strip()
            db_int_address = addr


if skip != True:
    AnsbleInventory()

else:

    with open('inventory.json', 'r') as file:
        read_file = file.read()
    print(read_file)
