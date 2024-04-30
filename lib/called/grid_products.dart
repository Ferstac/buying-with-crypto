import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cryptocurrency/cc_data.dart';
import '../requests/crypto_api.dart';
import 'products_data.dart';

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

  void updatePrice(double newBTCPrice, double newETHPrice, double newBNBPrice) {
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
          itemCount: productDetails.length,
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
                                "${productDetails.elementAt(index)['images']}",
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
                                    "${productDetails.elementAt(index)['title']}",
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
                                        "${calculateConvertedPrice(double.parse(productDetails.elementAt(index)['price'].substring(1)), Provider.of<CurrencyProvider>(context).selectedCurrency)} ${Provider.of<CurrencyProvider>(context).selectedCurrency}",
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
                                        items: ["USD", "BTC", "ETH", "BNB"]
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
                                    "${productDetails.elementAt(index)['description']}",
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Ürünü sepete eklemek için ürün bilgilerini bir harita olarak oluşturun
                                  Map<String, dynamic> item = {
                                    'title': productDetails
                                        .elementAt(index)['title'],
                                    'price': calculateConvertedPrice(
                                            double.parse(productDetails
                                                .elementAt(index)['price']
                                                .substring(1)),
                                            Provider.of<CurrencyProvider>(
                                                    context,
                                                    listen: false)
                                                .selectedCurrency)
                                        .toStringAsFixed(2),
                                    'images': productDetails
                                        .elementAt(index)['images'],
                                    'description': productDetails
                                        .elementAt(index)['description'],
                                    'currency': Provider.of<CurrencyProvider>(
                                            context,
                                            listen: false)
                                        .selectedCurrency,
                                  };
                                  // Sepete eklenen ürünleri tutan listeye ekleyin
                                  cartItems.add(item);
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
                        "${productDetails.elementAt(index)['images']}",
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
                            "${productDetails.elementAt(index)['title']}",
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
                            "${calculateConvertedPrice(double.parse(productDetails.elementAt(index)['price'].substring(1)), Provider.of<CurrencyProvider>(context).selectedCurrency).toStringAsFixed(2)} ${Provider.of<CurrencyProvider>(context).selectedCurrency}",
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
                                onPressed: () {
                                  // Ürünü sepete eklemek için ürün bilgilerini bir harita olarak oluşturun
                                  Map<String, dynamic> item = {
                                    'title': productDetails
                                        .elementAt(index)['title'],
                                    'price': calculateConvertedPrice(
                                            double.parse(productDetails
                                                .elementAt(index)['price']
                                                .substring(1)),
                                            Provider.of<CurrencyProvider>(
                                                    context,
                                                    listen: false)
                                                .selectedCurrency)
                                        .toStringAsFixed(2),
                                    'images': productDetails
                                        .elementAt(index)['images'],
                                    'description': productDetails
                                        .elementAt(index)['description'],
                                    'currency': Provider.of<CurrencyProvider>(
                                            context,
                                            listen: false)
                                        .selectedCurrency,
                                  };
                                  // Sepete eklenen ürünleri tutan listeye ekleyin
                                  cartItems.add(item);
                                },
                                icon: const Icon(
                                  CupertinoIcons.cart,
                                ),
                              ),
                              DropdownButton<String>(
                                value: Provider.of<CurrencyProvider>(context)
                                    .selectedCurrency,
                                items: ["USD", "BTC", "ETH", "BNB"]
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
