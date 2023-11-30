# fingerprint

Fingerprint puglin to generates a hash needed for banking transactions with ACH-SDk powered by ACH
Colombia.

## Usage

**initialize**

``` dart
//imports
import 'package:fingerprint/fingerprint.dart';

// initialize plugin before getting data fingerprint
await Fingerprint.initialize();
```

**Example Usage**

``` dart
//imports
import 'package:fingerprint/fingerprint_service.dart';
import 'package:fingerprint/model/fingerprint_data_model.dart';

// get data fingerprint
FingerprintDataModel? fingerprint = await FingerprintService.generate();

// Geolocation -> city
String? data = fingerprint?.geolocation?.city;

// Hash -> id
String? data = fingerprint?.hash?.id;

// General -> deviceId
String? data = fingerprint?.general?.deviceId;

```

Return a FingerprintDataModel:

``` dart
class FingerprintDataModel {
  Geolocation? geolocation;
  Hash? hash;
  General? general;

  FingerprintDataModel({
    this.geolocation,
    this.hash,
    this.general,
  });

  FingerprintDataModel.fromJson(Map<String, dynamic> json) {
    geolocation = Geolocation.fromJson(json["Geolocation"]);
    hash = Hash.fromJson(json["Hash"]);
    general = General.fromJson(json["General"]);
  }

  Map<String, dynamic> toJson() => {
        "geolocation": geolocation?.toJson(),
        "hash": hash?.toJson(),
        "general": general?.toJson(),
      };
}

class Geolocation {
  String? city;
  String? country;
  String? ip;
  String? isp;

  Geolocation({
    this.city,
    this.country,
    this.ip,
    this.isp,
  });

  Geolocation.fromJson(Map<String, dynamic> json) {
    city = json["city"];
    country = json["country"];
    ip = json["ip"];
    isp = json["isp"];
  }

  Map<String, dynamic> toJson() => {
        "city": city,
        "country": country,
        "ip": ip,
        "isp": isp,
      };
}

class Hash {
  String? id;

  Hash({this.id});

  Hash.fromJson(Map<String, dynamic> json) {
    id = json["id"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class General {
  String? deviceId;
  String? hostname;
  String? macAddress;
  String? passiveId;

  General({
    this.deviceId,
    this.hostname,
    this.macAddress,
    this.passiveId,
  });

  General.fromJson(Map<String, dynamic> json) {
    deviceId = json["deviceId"];
    hostname = json["hostname"];
    macAddress = json["macAddress"];
    passiveId = json["passiveId"];
  }

  Map<String, dynamic> toJson() => {
        "deviceId": deviceId,
        "hostname": hostname,
        "macAddress": macAddress,
        "passiveId": passiveId,
      };
}
```

**Json Plugin Response**
```
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
