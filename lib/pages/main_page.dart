import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';

import '../called/grid_products.dart';
import '../called/pop_up_menu.dart';
import '../called/menu_drawer.dart';
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
  List<String> imgs = [
    "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80",
    "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    "https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
  ];
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
  Widget build(BuildContext context) => Scaffold(
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
              trailing: PopUpMenu(
                menuList: const [
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(
                        CupertinoIcons.person,
                      ),
                      title: Text("My Profile"),
                    ),
                    value: 0,
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    child: Text("Settings"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("About Us"),
                    value: 2,
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                      ),
                      title: Text("Log Out"),
                    ),
                    value: 3,
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
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Image.network(
                                        imgs[pageIndex],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
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
                                      imgs[pageIndex],
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
