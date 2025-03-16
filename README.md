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
	"CertName": "sha256-raw:YOU_OWN_CERT_KEY",
    // "InsecureForTests": true, // no longer needed
}
```

in `https://login.tailscale.com/admin/acls/file`

the `YOU_OWN_CERT_KEY` can be checked in docker logs by `docker logs -f derper`

## Credits

https://github.com/yangchuansheng/ip_derper
