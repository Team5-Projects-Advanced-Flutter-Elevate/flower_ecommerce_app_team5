/// street : "May 15 Cairo"
/// phone : "01010518801"
/// city : "15 May"
/// lat : "31.2357116"
/// long : "31.2357116"
/// username : "Mohammed Khalil"
class UpdateAddressRequest {
  UpdateAddressRequest({
      this.street, 
      this.phone, 
      this.city, 
      this.lat, 
      this.long, 
      this.username,});

  UpdateAddressRequest.fromJson(dynamic json) {
    street = json['street'];
    phone = json['phone'];
    city = json['city'];
    lat = json['lat'];
    long = json['long'];
    username = json['username'];
  }
  String? street;
  String? phone;
  String? city;
  String? lat;
  String? long;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['phone'] = phone;
    map['city'] = city;
    map['lat'] = lat;
    map['long'] = long;
    map['username'] = username;
    return map;
  }

}