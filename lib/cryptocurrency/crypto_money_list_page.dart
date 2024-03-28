import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

import '../called/grid_products.dart';
import '../requests/crypto_api.dart'; 
import 'cc_data.dart';

class CryptoMoneyList extends StatefulWidget {
  const CryptoMoneyList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CryptoMoneyListState();
  }
}

class _CryptoMoneyListState extends State<CryptoMoneyList> {
  List<CCData> all_data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptocurrency Tracker'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: all_data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(all_data[index].name),
                subtitle: Text(all_data[index].symbol),
                leading: CircleAvatar(
                  child: Text(
                    all_data[index].rank.toString(),
                  ),
                ),
                trailing: Text('\$${all_data[index].price.toStringAsFixed(2)}'),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () => _loadCC(),
      ),
    );
  }

  final CryptoApiService _cryptoApiService = CryptoApiService(
      '100&CMC_PRO_API_KEY=3b3beb6a-eabc-4a52-b0c3-db55ebad0f55');
  _loadCC() async {
    try {
      List<CCData> ccDataList =
          await _cryptoApiService.fetchCryptocurrencyData();
      setState(() {
        all_data = ccDataList;
      });
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }

  // _loadCC() async {
  //   final response = await http.get(
  //       Uri.parse(
  //           'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=100&CMC_PRO_API_KEY=3b3beb6a-eabc-4a52-b0c3-db55ebad0f55'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Access-Control-Allow-Origin': '*',
  //         'Access-Control-Allow-Credentials': 'true',
  //         'Access-Control-Allow-Headers': 'Content-Type',
  //         'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
  //       });
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> allData = json.decode(response.body);
  //     List<dynamic> data = allData["data"];

  //     var ccDataList = <CCData>[];

  //     for (var val in data) {
  //       var record = CCData(
  //           name: val['name'],
  //           symbol: val['symbol'],
  //           rank: val['cmc_rank'],
  //           price: val['quote']['USD']['price']);

  //       ccDataList.add(record);
  //     }

  //     setState(() {
  //       all_data = ccDataList;
  //       Provider.of<CurrencyProvider>(context, listen: false)
  //           .updatePrice(ccDataList[0].price);
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _loadCC();
  }
}
