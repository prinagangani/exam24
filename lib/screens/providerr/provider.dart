
import 'package:exam24/screens/model/home_modal.dart';
import 'package:exam24/utils/api_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeProvider extends ChangeNotifier{

  List dataList = [];

  Future<CountryModal> call()
  async {
    ApiHelper apiHelper = ApiHelper();
    CountryModal c1 =await apiHelper.getApi();
    return c1;
  }

}
