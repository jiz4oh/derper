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
    "HostName": "YOU_OWN_HOST,CAN BE AN IP",
    "CertName": "sha256-raw:YOU_OWN_CERT_KEY", // the `YOU_OWN_CERT_KEY` can be checked in docker logs by `docker logs -f derper`
    "InsecureForTests": true // no longer needed after all clients are upgraded to 1.82
}
```

in `https://login.tailscale.com/admin/acls/file`

## Credits

https://github.com/yangchuansheng/ip_derper
