
sealed class AddressIntent{

}
class GetAddress extends AddressIntent{
}

class UpdateAddress extends AddressIntent{
  UpdateAddress(this.productId);
  String productId;
}

class DeleteAddress extends AddressIntent{
  DeleteAddress(this.productId);
  String productId;
}