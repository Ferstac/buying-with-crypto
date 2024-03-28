import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cryptocurrency/cc_data.dart';
import '../requests/crypto_api.dart';

class CurrencyProvider extends ChangeNotifier {
  String selectedCurrency = 'USD';
  double? BTCPrice;
  double? ETHPrice; // Burada price değişkenini double türünde tanımlayın
  double? USDTPrice;
  double? BNBPrice;
  void updateCurrency(String newCurrency) {
    selectedCurrency = newCurrency;
    notifyListeners();
  }

  void updatePrice(double newBTCPrice, double newETHPrice ,
      double newBNBPrice) {
    BTCPrice = newBTCPrice; // Price değişkenini güncelleyin
    ETHPrice = newETHPrice;
    USDTPrice = 1.0;
    BNBPrice = newBNBPrice;
    // conversionRates'ı güncellemek için bir işlevi burada çağırın
    updateConversionRates(BTCPrice, ETHPrice, BNBPrice);

    notifyListeners();
  }
}

Map<String, double> conversionRates = {
  "USD": 1.0,
  "BNB": 0.0,
  "BTC": 0.0, // Varsayılan değeri 0.0 olarak ayarladım
  "ETH": 0.0,
};

// conversionRates'ı güncellemek için bir işlev
void updateConversionRates(BTCPrice, ETHPrice, BNBPrice) {
  conversionRates = {
    "USD": 1.0,
    "BNB": BNBPrice,
    "BTC": BTCPrice,
    "ETH": ETHPrice,
  };
}

double calculateConvertedPrice(double originalPrice, String selectedCurrency) {
  double? conversionRate = conversionRates[selectedCurrency];
  return originalPrice / conversionRate!;
}

class GridProducts extends StatefulWidget {
  const GridProducts({Key? key}) : super(key: key);

  @override
  State<GridProducts> createState() => _GridProductsState();
}

class _GridProductsState extends State<GridProducts>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "white sneaker with adidas logo",
      "price": "\$255",
      "images":
          "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80",
      "description": "Description of white sneaker with adidas logo",
    },
    {
      "title": "Black Jeans with blue stripes",
      "price": "\$245",
      "images":
          "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "description": "Description of Black Jeans with blue stripes",
    },
    {
      "title": "Red shoes with black stripes",
      "price": "\$155",
      "images":
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    },
    {
      "title": "Gamma shoes with beta brand.",
      "price": "\$275",
      "images":
          "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    },
    {
      "title": "Alpha t-shirt for alpha testers.",
      "price": "\$25",
      "images":
          "https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    },
    {
      "title": "Beta jeans for beta testers",
      "price": "\$27",
      "images":
          "https://images.unsplash.com/photo-1602293589930-45aad59ba3ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    },
    {
      "title": "V&V  model white t shirts.",
      "price": "\$55",
      "images":
          "https://images.unsplash.com/photo-1554568218-0f1715e72254?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    },
    {
      "title": "Black Jeans with blue stripes",
      "price": "\$245",
      "images":
          "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "description": "Description of Black Jeans with blue stripes",
    },
    {
      "title": "Black Jeans with blue stripes",
      "price": "\$245",
      "images":
          "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "description": "Description of Black Jeans with blue stripes",
    },
    {
      "title": "Black Jeans with blue stripes",
      "price": "\$245",
      "images":
          "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "description": "Description of Black Jeans with blue stripes",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            mainAxisExtent: 310,
          ),
          itemCount: gridMap.length,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.network(
                                "${gridMap.elementAt(index)['images']}",
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${gridMap.elementAt(index)['title']}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Text(
                                        "${calculateConvertedPrice(double.parse(gridMap.elementAt(index)['price'].substring(1)), Provider.of<CurrencyProvider>(context).selectedCurrency)} ${Provider.of<CurrencyProvider>(context).selectedCurrency}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      const SizedBox(width: 8.0),
                                      DropdownButton<String>(
                                        value: Provider.of<CurrencyProvider>(
                                                context)
                                            .selectedCurrency,
                                        items: ["USD","BTC", "ETH", "BNB"]
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) =>
                                            _loadCC(newValue),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    "${gridMap.elementAt(index)['description']}",
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Ekleme işlemini burada gerçekleştirin
                                },
                                child: const Text("Sepete Ekle"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.amberAccent.shade100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      child: Image.network(
                        "${gridMap.elementAt(index)['images']}",
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${gridMap.elementAt(index)['title']}",
                            style:
                                Theme.of(context).textTheme.titleMedium!.merge(
                                      const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "${calculateConvertedPrice(double.parse(gridMap.elementAt(index)['price'].substring(1)), Provider.of<CurrencyProvider>(context).selectedCurrency).toStringAsFixed(2)} ${Provider.of<CurrencyProvider>(context).selectedCurrency}",
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.heart,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.cart,
                                ),
                              ),
                              DropdownButton<String>(
                                value: Provider.of<CurrencyProvider>(context)
                                    .selectedCurrency,
                                items: ["USD","BTC", "ETH", "BNB"]
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) =>
                                    _loadCC(newValue),
                                iconSize: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  final CryptoApiService _cryptoApiService = CryptoApiService(
      '100&CMC_PRO_API_KEY=3b3beb6a-eabc-4a52-b0c3-db55ebad0f55');
  _loadCC(newValue) async {
    Provider.of<CurrencyProvider>(context, listen: false)
        .updateCurrency(newValue!);
    try {
      List<CCData> ccDataList =
          await _cryptoApiService.fetchCryptocurrencyData();
      setState(() {
        Provider.of<CurrencyProvider>(context, listen: false).updatePrice(
            ccDataList[0].price, ccDataList[1].price, ccDataList[3].price);
      });
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}
