# fingerprint

Fingerprint puglin to generates a hash needed for banking transactions with ACH-SDk powered by ACH
Colombia.

## Usage

**Example Usage**

``` dart
final dataJson = await Fingerprint.generate();
```

```
Return a Json:
{
    "Geolocation": {
        "city": "city_name",
        "country": "country_name",
        "ip": "IPv4_numer",
        "isp": "provider_mobile"
    },
    "Hash": {
        "id": "0B6F8I0FGB0D56Z8B44D598F"
    },
    "General": {
        "deviceId": "deviceId_code",
        "hostname": "hostname_text",
        "macAddress": "macAddress_info",
        "passiveId": "passiveId_code"
    }
}
```

©Copyright 2023