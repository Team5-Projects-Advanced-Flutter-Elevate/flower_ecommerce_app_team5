import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/saved_address/data/models/saved_address_response/saved_address_response_dto.dart';

sealed class SavedAddressIntent{

}
class GetSavedAddress extends SavedAddressIntent{}

sealed class UpdateAddressIntent{

}
class UpdateAddress extends UpdateAddressIntent{
  UpdateAddress(this.addressEntity,this.userId);
  AddressEntity addressEntity;
  String userId;
}

sealed class DeleteAddressIntent{

}
class DeleteAddress extends DeleteAddressIntent{
  DeleteAddress(this.addressEntity,this.userId);
  AddressEntity addressEntity;
  String userId;
}