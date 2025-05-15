import 'dart:convert';
import 'package:flower_ecommerce_app_team5/modules/home/data/datasource_contract/terms.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/terms.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../models/terms_resposne/terms_response.dart';

@Injectable(as: TermsLocalDataSource)
class TermsLocalDataSourceImpl implements TermsLocalDataSource {
  @override
  Future<GetTermsEntity> loadData() async {
    // TODO: implement loadData
    final jsonString = await rootBundle.loadString('assets/files/Terms.json');

    final jsonMap = json.decode(jsonString);

    final terms = GetTerms.fromJson(jsonMap);

    return terms.toEntity();
  }
}
