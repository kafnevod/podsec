#!/bin/sh
source podsec-u7s-functions
source $envFile

ip a add  $U7S_TAPIP/$U7S_SERVICEMASK dev $U7S_EXTDEV  || :;
iptables -I POSTROUTING -t nat -s $U7S_SERVICECIDR -d $U7S_SERVICECIDR -j SNAT --to $U7S_EXTIP  || :;
if [ U7S_CONTROLPLANE = 'initMaster' ]
then
  ip a add $U7S_KUBERNETESCLUSTERDNS/$U7S_SERVICEMASK dev $U7S_EXTDEV  || :;
  ip a add $U7S_SLIRP4IP/$U7S_SERVICEMASK dev $U7S_EXTDEV  || :;
  iptables -t nat -I PREROUTING -p tcp -d 0.0.0.0/0 --dport 53 -j DNAT --to=$U7S_TAPIP:6053  || :;
  iptables -t nat -I PREROUTING -p udp -d 0.0.0.0/0 --dport 53 -j DNAT --to=$U7S_TAPIP:6053  || :;
fi

echo "0 2147483647"  > /proc/sys/net/ipv4/ping_group_range

