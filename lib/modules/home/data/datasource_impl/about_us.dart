import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../../domain/entities/about_us.dart';
import '../datasource_contract/about_us.dart';
import '../models/about_us_response/about_us_response.dart';

@Injectable(as: AboutUsLocalDataSource)
class AboutUsLocalDataSourceImpl implements AboutUsLocalDataSource {
  @override
  Future<AboutUsEntity> loadData() async {
    final String jsonString =
    await rootBundle.loadString('assets/files/AboutUs.json');

    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    final aboutUsModel = AboutUs.fromJson(jsonMap);

    return aboutUsModel.toEntity();
  }

}
