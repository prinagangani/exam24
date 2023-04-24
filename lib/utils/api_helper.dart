
import 'dart:convert';

import 'package:exam24/screens/model/home_modal.dart';
import 'package:http/http.dart'as http;
class ApiHelper {
  Future<CountryModal> getApi() async {
    String link = 'https://corona-virus-world-and-india-data.p.rapidapi.com/api';
    Uri uri = Uri.parse(link);
    var response = await http.get(uri, headers: {
      "content-type": "application/octet-stream",
      "X-RapidAPI-Key": "e0cdb18cd9mshd15ab6a2b65c6acp189ff3jsne82159b4829a",
      "X-RapidAPI-Host": "corona-virus-world-and-india-data.p.rapidapi.com"});
    var data = jsonDecode(response.body);
    CountryModal c1 = CountryModal.fromJson(data);
    return c1;
  }
}