#!/bin/bash
cecho(){
     echo -e "\033[$1m$2\033[0m"
}
cecho 32 ok
cecho 33 Error
cecho 34 hello
cecho 35 che


