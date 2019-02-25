# Brewer

A baisc nerves system able to connect to network
update through manage firmware server

# How to use

```
export MIX_TARGET=rpi3
export NERVES_NETWORK_SSID=yourSSID
export NERVES_NETWORK_PSK=yourPASSWORD
mix deps.get
mix firmware
```



# How to use Hub

```
mix nerves_hub.user register (optional if you already registered)
mix nerves_hub.user auth
mix nerves_hub.product create
mix nerves_hub.device create
mix nerves_hub.firmware sign --key devkey
mix nerves_hub.device burn 0001
mix nerves_hub.firmware publish --key devkey
mix nerves_hub.deployment create
mix nerves_hub.firmware publish --key devkey --deploy qa_deployment
```
