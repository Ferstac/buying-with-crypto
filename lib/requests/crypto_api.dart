import 'package:http/http.dart' as http;
import 'dart:convert';

import '../cryptocurrency/cc_data.dart';

class CryptoApiService {
  final String apiKey;

  CryptoApiService(this.apiKey);

  Future<List<CCData>> fetchCryptocurrencyData() async {
    final response = await http.get(
        Uri.parse(
            'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=100&CMC_PRO_API_KEY=3b3beb6a-eabc-4a52-b0c3-db55ebad0f55'),
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Credentials': 'true',
          'Access-Control-Allow-Headers': 'Content-Type',
          'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
        });
    if (response.statusCode == 200) {
      Map<String, dynamic> allData = json.decode(response.body);
      List<dynamic> data = allData["data"];

      var ccDataList = <CCData>[];

      for (var val in data) {
        var record = CCData(
            name: val['name'],
            symbol: val['symbol'],
            rank: val['cmc_rank'],
            price: val['quote']['USD']['price']);

        ccDataList.add(record);
      }
      return ccDataList;
    } else {
      throw Exception('Failed to load cryptocurrency data');
    }
  }
}
