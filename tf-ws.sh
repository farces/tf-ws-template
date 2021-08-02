#!/bin/sh
terraform $1 --var-file=environments/$(echo $(cat .terraform/environment)".tfvars") $2