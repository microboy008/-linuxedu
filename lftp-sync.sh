#!/bin/bash
lftp -u Nsd1806,Nsd1806 -e "mirror --only-newer --verbose / /root/note/" 176.204.15.117 <<EOF
bye
EOF
