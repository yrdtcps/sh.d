#!/bin/bash

curl -s txt.go.sohu.com/ip/soip | grep -Eo sohu_user_ip=\"[.0-9]+\" | grep -Eo [.0-9]+


