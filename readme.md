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


### Example
```bash
./raw -s
[Message] Started.
[Message] Check log please use: ./raw -l


./raw -p
[Message] Deamon pid=26143
[Message] Stopping...
[Message] pid 26143 stopped.
[Message] pid 26161 stopped.
[Message] pid 26162 stopped.


./raw -l 
[2020-03-07 16:22:42][Message] RAW Client not detected, starting...
[2020-03-07 16:22:42][Message] RAW Client connected to 10.0.0.1
[2020-03-07 16:46:14][Message] Status check - Running, ip=10.0.0.1, loss=50.0%, avg=352.020ms, pid=25188, ppid=24441
[2020-03-07 16:47:37][Message] Status check - Running, ip=10.0.0.1, loss=30.0%, avg=352.272ms, pid=25188, ppid=24441
[2020-03-07 16:48:59][Message] Status check - Running, ip=10.0.0.1, loss=30.0%, avg=351.814ms, pid=25188, ppid=24441
[2020-03-07 16:50:21][Message] Status check - Running, ip=10.0.0.1, loss=20.0%, avg=352.362ms, pid=25188, ppid=24441
[2020-03-07 16:51:43][Message] Status check - Running, ip=10.0.0.1, loss=10.0%, avg=352.134ms, pid=25188, ppid=24441
[2020-03-07 16:53:05][Message] Status check - Running, ip=10.0.0.1, loss=40.0%, avg=352.095ms, pid=25188, ppid=24441
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