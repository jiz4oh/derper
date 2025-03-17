# ip derper

## Run

```
git clone https://github.com/jiz4oh/derper.git
cd derper
docker compose up -d
```

## Configure

add

```
{
	"Name": "custom",
	"RegionID": 900,
	"HostName": "YOU_OWN_HOST,CAN BE A DOMAIN",
    "InsecureForTests": true
}
```

in `https://login.tailscale.com/admin/acls/file`

## Credits

https://github.com/yangchuansheng/ip_derper
