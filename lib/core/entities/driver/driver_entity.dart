
import 'package:flower_ecommerce_app_team5/core/bases/base_data_model.dart';

class DriverEntity extends BaseDataModel {
  DriverEntity({
    this.id,
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.nid,
    this.nIDImg,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.createdAt,
    this.isCanceled,
  }) : super(
         equatableProps: [
           id,
           country,
           firstName,
           lastName,
           vehicleType,
           vehicleNumber,
           vehicleLicense,
           nid,
           nIDImg,
           email,
           gender,
           phone,
           photo,
           role,
           createdAt,
           isCanceled,
         ],
       );

  final String? id;
  final String? country;
  final String? firstName;
  final String? lastName;
  final String? vehicleType;
  final String? vehicleNumber;
  final String? vehicleLicense;
  final String? nid;
  final String? nIDImg;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;
  final String? createdAt;
  final bool? isCanceled;
}
