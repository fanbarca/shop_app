import 'address.dart';

class Customer {
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _maidenName;
  String? _gender;
  String? _email;
  String? _phone;
  String? _username;
  String? _password;
  String? _birthDate;
  String? _image;
  Address? _address;


  Customer(
      {int? id,
        String? firstName,
        String? lastName,
        String? maidenName,
        int? age,
        String? gender,
        String? email,
        String? phone,
        String? username,
        String? password,
        String? birthDate,
        String? image,
        String? bloodGroup,
        int? height,
        double? weight,
        String? eyeColor,
        String? domain,
        String? ip,
        Address? address,
        String? macAddress,
        String? university,

        String? ein,
        String? ssn,
        String? userAgent}) {
    if (id != null) {
      this._id = id;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (maidenName != null) {
      this._maidenName = maidenName;
    }

    if (gender != null) {
      this._gender = gender;
    }
    if (email != null) {
      this._email = email;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (username != null) {
      this._username = username;
    }
    if (password != null) {
      this._password = password;
    }
    if (birthDate != null) {
      this._birthDate = birthDate;
    }
    if (image != null) {
      this._image = image;
    }

    if (address != null) {
      this._address = address;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get maidenName => _maidenName;
  set maidenName(String? maidenName) => _maidenName = maidenName;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get birthDate => _birthDate;
  set birthDate(String? birthDate) => _birthDate = birthDate;
  String? get image => _image;
  set image(String? image) => _image = image;
  Address? get address => _address;
  set address(Address? address) => _address = address;

  Customer.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _maidenName = json['maidenName'];
    _gender = json['gender'];
    _email = json['email'];
    _phone = json['phone'];
    _username = json['username'];
    _password = json['password'];
    _birthDate = json['birthDate'];
    _image = json['image'];
    _address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['maidenName'] = this._maidenName;
    data['gender'] = this._gender;
    data['email'] = this._email;
    data['phone'] = this._phone;
    data['username'] = this._username;
    data['password'] = this._password;
    data['birthDate'] = this._birthDate;
    data['image'] = this._image;
    if (this._address != null) {
      data['address'] = this._address!.toJson();
    }
    return data;
  }
}







