import 'package:flower_ecommerce_app_team5/modules/home/data/datasource_contract/new_address.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo_contract/new_address_repo.dart';

@Injectable(as: NewAddressRepo)
class NewAddressRepoImpl implements NewAddressRepo {
  NewAddressOnlineDataSource newAddressOnlineDataSource;
  NewAddressRepoImpl(this.newAddressOnlineDataSource);
  @override
  Future<void> addAddress(var street,var phone,var city,var lat,var long,var name) async {
    await newAddressOnlineDataSource.addAddress(street,phone,city,lat,long,name);
  }
}
