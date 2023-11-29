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
