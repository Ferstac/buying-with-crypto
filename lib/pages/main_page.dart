import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../called/grid_products.dart';
import '../called/pop_up_menu.dart';
import '../called/menu_drawer.dart';
import '../called/products_data.dart';
import '../cryptocurrency/cc_data.dart';
import '../requests/crypto_api.dart';
import 'cart_page.dart';
import 'favorites_page.dart';
import 'live_support_page.dart';
import 'notifications_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final PageController pageController;
  final ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  Timer? carouselTimer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carouselTimer = getTimer();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBottomAppBar = false;
      } else {
        showBottomAppBar = true;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  bool showBottomAppBar = true;

  @override
  Widget build(BuildContext context) {
    var userState = Provider.of<UserState>(context);

    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: SizedBox(
          child: ListTile(
            selected: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10),
                right: Radius.circular(10),
              ),
            ),
            title: Text(
              "Buying with Crypto",
              style: Theme.of(context).textTheme.subtitle1!.merge(
                    const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                    ),
                  ),
            ),
            subtitle: Text(
              "Welcome to shop",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            trailing: userState.isLoggedIn
                ? PopUpMenu(
                    menuList: const [
                      PopupMenuItem(
                        child: Text("Log Out"),
                        value: 5,
                      ),
                      PopupMenuDivider(),
                      PopupMenuItem(
                        child: Text("Settings"),
                        value: 3,
                      ),
                      PopupMenuItem(
                        child: Text("About Us"),
                        value: 4,
                      ),
                    ],
                    icon: CircleAvatar(
                      backgroundImage: const NetworkImage(
                        'https://images.unsplash.com/photo-1628563694622-5a76957fd09c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aW5zdGFncmFtJTIwcHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                      ),
                      child: Container(),
                    ),
                  )
                : PopUpMenu(
                    menuList: const [
                      PopupMenuItem(
                        child: ListTile(
                          leading: Icon(
                            CupertinoIcons.add_circled,
                          ),
                          title: Text("Registration"),
                        ),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          leading: Icon(
                            CupertinoIcons.arrow_down_circle,
                          ),
                          title: Text("Log in"),
                        ),
                        value: 2,
                      ),
                      PopupMenuDivider(),
                      PopupMenuItem(
                        child: Text("Settings"),
                        value: 3,
                      ),
                      PopupMenuItem(
                        child: Text("About Us"),
                        value: 4,
                      ),
                    ],
                    icon: CircleAvatar(
                      backgroundImage: const NetworkImage(
                        'https://images.unsplash.com/photo-1628563694622-5a76957fd09c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aW5zdGFncmFtJTIwcHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                      ),
                      child: Container(),
                    ),
                  ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 190, 252, 4),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50.0,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(),
                    child: Center(
                      child: Text(
                        "Place for advertising",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        child: PageView.builder(
                          controller: pageController,
                          onPageChanged: (index) {
                            pageNo = index;
                            setState(() {});
                          },
                          itemBuilder: (context, pageIndex) {
                            return AnimatedBuilder(
                              animation: pageController,
                              builder: (ctx, child) {
                                return child!;
                              },
                              child: GestureDetector(
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
                                                  "${productDetails.elementAt(pageIndex)['images']}",
                                                  height: 200,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${productDetails.elementAt(pageIndex)['title']}",
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
                                                          "${calculateConvertedPrice(double.parse(productDetails.elementAt(pageIndex)['price'].substring(1)), Provider.of<CurrencyProvider>(context).selectedCurrency)} ${Provider.of<CurrencyProvider>(context).selectedCurrency}",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleMedium!
                                                                  .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                        ),
                                                        const SizedBox(
                                                            width: 8.0),
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
                                                              child:
                                                                  Text(value),
                                                            );
                                                          }).toList(),
                                                          onChanged: (String?
                                                                  newValue) =>
                                                              _loadCC(newValue),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 8.0),
                                                    Text(
                                                      "${productDetails.elementAt(pageIndex)['description']}",
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
                                                  child:
                                                      const Text("Sepete Ekle"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                // {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(
                                //       content:
                                //           Text("Hello you tapped at ${index + 1} "),
                                //     ),
                                //   );
                                // },
                                onPanDown: (d) {
                                  carouselTimer?.cancel();
                                  carouselTimer = null;
                                },
                                onPanCancel: () {
                                  carouselTimer = getTimer();
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    right: 8,
                                    left: 8,
                                    top: 24,
                                    bottom: 12,
                                  ),
                                  child: Image.network(
                                    "${productDetails.elementAt(pageIndex)['images']}",
                                    fit: BoxFit.fill,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.0),
                                    // color: Colors.amberAccent,
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: 5,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          5,
                          (index) => GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.circle,
                                size: 12.0,
                                color: pageNo == index
                                    ? Colors.indigoAccent
                                    : Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(24.0),
                        child: GridProducts(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: showBottomAppBar
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LiveSupport()),
          );
        },
        child: const Icon(
          Icons.mark_unread_chat_alt_outlined,
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        child: BottomAppBar(
          notchMargin: 8.0,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                // onPressed: () => selectedItem(context, 5),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                icon: const Icon(
                  Icons.home_outlined,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Favorites()),
                  );
                },
                icon: const Icon(
                  CupertinoIcons.heart,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cart()),
                  );
                },
                icon: const Icon(
                  CupertinoIcons.cart,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notifications()),
                  );
                },
                icon: const Icon(
                  CupertinoIcons.bell,
                ),
              ),
            ],
          ),
        ),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutQuint,
        height: showBottomAppBar ? 70 : 0,
      ),
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
