## RAW Client
raw client is a bash wrapper of udp2raw client.
compiled upon nolibnet version.


### Installation
```bash
# Would need root.
./install.sh
```


### Usage

Usage: ./raw start|-s|--start, stop|-p|--stop, restart|-r|--restart, check|-l|--log, status|-t|--status


```bash
./raw -s  #start
./raw -p  #stop
./raw -r  #restart
./raw -l  #check log
```

### Configuration
1. Edit 'config.ini'
```bash
### udp2raw_server port
r_port=8800

### udp2raw_client port
l_port=8801

### udp2raw_server password
passwd=P@55w0rd
```

2. Edit 'ip_list'
```bash
### input all available server IPs
10.0.0.1
10.0.0.2
```