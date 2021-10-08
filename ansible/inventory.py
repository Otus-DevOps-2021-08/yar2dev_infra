#!/usr/bin/env python

#This script get addresses from terraform output and generate inventory json output for ansible
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
                'hosts': app_address,
                'vars': {
                    'example_variable': 'value'
                }
            },

            'db': {
                'hosts': db_address,
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


# Get app and db servers addresses from terraform stage.

terraform_command = "(cd ../terraform/stage && terraform output)"
app_address = []
db_address = []

with Popen(terraform_command, stdout=PIPE, universal_newlines=True, shell=True) as process:

    for line in process.stdout:

        if "external" in line:
            if "app" in line:
                line = line.rstrip()
                line = line.split(" = ")
                app_address.append(line[1])

            elif "db" in line:
                line = line.rstrip()
                line = line.split(" = ")
                db_address.append(line[1])


AnsbleInventory()
