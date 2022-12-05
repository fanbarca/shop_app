import 'coordinates.dart';

class Address {
  String? _address;
  String? _city;
  Coordinates? _coordinates;
  String? _postalCode;
  String? _state;

  Address(
      {String? address,
        String? city,
        Coordinates? coordinates,
        String? postalCode,
        String? state}) {
    if (address != null) {
      this._address = address;
    }
    if (city != null) {
      this._city = city;
    }
    if (coordinates != null) {
      this._coordinates = coordinates;
    }
    if (postalCode != null) {
      this._postalCode = postalCode;
    }
    if (state != null) {
      this._state = state;
    }
  }

  String? get address => _address;
  set address(String? address) => _address = address;
  String? get city => _city;
  set city(String? city) => _city = city;
  Coordinates? get coordinates => _coordinates;
  set coordinates(Coordinates? coordinates) => _coordinates = coordinates;
  String? get postalCode => _postalCode;
  set postalCode(String? postalCode) => _postalCode = postalCode;
  String? get state => _state;
  set state(String? state) => _state = state;

  Address.fromJson(Map<String, dynamic> json) {
    _address = json['address'];
    _city = json['city'];
    _coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    _postalCode = json['postalCode'];
    _state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this._address;
    data['city'] = this._city;
    if (this._coordinates != null) {
      data['coordinates'] = this._coordinates!.toJson();
    }
    data['postalCode'] = this._postalCode;
    data['state'] = this._state;
    return data;
  }
}