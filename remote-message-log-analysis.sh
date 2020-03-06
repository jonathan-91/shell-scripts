#!/bin/bash
# -- Analyze remote host's message log --
SYSIP="$1"
WC=$(echo $SYSIP | grep "." | wc -l)
if [ "$WC" == "0" ]; then
    read -p " --- Please enter the IP of the system: " SYSIP
fi
ssh $SYSIP <<'EOF'
    for i in `ls /var/log/messages*|grep -v '.gz'`;do
        echo
        echo " - LOG: $i"
        UNIQENTRIES=`cat $i|sed 's/\[/\ /g'|awk '{print $5}'|sed 's|:||g'|sort| uniq`
        count_uniq () {
            for b in $UNIQENTRIES ;do
                LCOUNT=`cat $i|grep $b|wc -l`
                echo "$b - $LCOUNT"
            done
        }
        echo "Program: - Line Count:"
        count_uniq | sort -k3 -rn
    done
EOF
