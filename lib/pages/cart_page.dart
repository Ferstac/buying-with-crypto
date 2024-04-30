import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../called/grid_products.dart';
import '../called/products_data.dart';
import '../cryptocurrency/cc_data.dart';
import '../requests/crypto_api.dart';
import 'live_support_page.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> with SingleTickerProviderStateMixin {
  bool showBottomAppBar = true;
  final ScrollController _scrollController = ScrollController();

  // Her bir ürün için seçim durumunu tutacak liste
  List<bool> selectedItems =
      List<bool>.generate(cartItems.length, (index) => false);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_isBottom) {
      setState(() {
        showBottomAppBar = false;
      });
    } else {
      setState(() {
        showBottomAppBar = true;
      });
    }
  }

  // Checkbox durumunu değiştiren işlev
  void toggleCheckbox(int index) {
    setState(() {
      selectedItems[index] = !selectedItems[index];
    });
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= maxScroll;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(
              fontFamily: "SignikaSemiBold",
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: [
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          mainAxisExtent: 240,
                        ),
                        itemCount: cartItems.length,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: Image.network(
                                              "${cartItems.elementAt(index)['images']}",
                                              height: 200,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${cartItems.elementAt(index)['title']}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                const SizedBox(height: 8.0),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "${calculateConvertedPrice(double.parse(cartItems.elementAt(index)['price'].substring(1)), Provider.of<CurrencyProvider>(context).selectedCurrency)} ${Provider.of<CurrencyProvider>(context).selectedCurrency}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium!
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    const SizedBox(width: 8.0),
                                                    DropdownButton<String>(
                                                      value: Provider.of<
                                                                  CurrencyProvider>(
                                                              context)
                                                          .selectedCurrency,
                                                      items: [
                                                        "USD",
                                                        "BTC",
                                                        "ETH",
                                                        "BNB"
                                                      ].map((String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue) =>
                                                              _loadCC(newValue),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 8.0),
                                                Text(
                                                  "${cartItems.elementAt(index)['description']}",
                                                ),
                                              ],
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
                                borderRadius: BorderRadius.circular(70.0),
                                color: Colors.amberAccent.shade100,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(70.0),
                                      topRight: Radius.circular(70.0),
                                    ),
                                    child: Image.network(
                                      "${cartItems.elementAt(index)['images']}",
                                      height: 120,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${cartItems.elementAt(index)['title']}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .merge(
                                                const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Row(children: [
                                          Checkbox(
                                            value: selectedItems[index],
                                            onChanged: (bool? value) {
                                              toggleCheckbox(index);
                                            },
                                          ),
                                          Text(
                                            "${calculateConvertedPrice(double.parse(cartItems.elementAt(index)['price'].substring(1)), Provider.of<CurrencyProvider>(context).selectedCurrency).toStringAsFixed(2)} ${Provider.of<CurrencyProvider>(context).selectedCurrency}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .merge(
                                                  TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.grey.shade500,
                                                  ),
                                                ),
                                          ),
                                        ])
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: showBottomAppBar
          ? Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FloatingActionButton(
                onPressed: () {
                  // Seçili ürünleri al
                  List<Map<String, dynamic>> selectedProducts = [];
                  for (int i = 0; i < selectedItems.length; i++) {
                    if (selectedItems[i]) {
                      selectedProducts.add(cartItems[i]);
                    }
                  }
                  // İşlemleri yap
                },
                child: const Text(
                  'Buy selected',
                  style: TextStyle(
                      fontFamily: "SignikaSemiBold",
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20.0),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                mini: false,
              ),
            )
          : null,
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
