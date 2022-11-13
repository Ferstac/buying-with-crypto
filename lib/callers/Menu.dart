import 'package:flutter/material.dart';
import 'package:flutter_application_2/callers/navigation_drawer_widget.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';


class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<String> imgs = [
    "https://wallpaperaccess.com/full/508751.jpg",
    "https://wallpaperaccess.com/full/32822.jpg",
    "https://wallpaperaccess.com/full/1369012.jpg",
  ];
  late final PageController pageController;
  final ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  Timer? carasouelTmer;

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
    carasouelTmer = getTimer();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBtmAppBr = false;
        setState(() {});
      } else {
        showBtmAppBr = true;
        setState(() {});
      }
    });
    super.initState();
  }

  bool showBtmAppBr = true;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: SizedBox(
            // height: 5.0,
            child: ListTile(
              onTap: () {},
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
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 190, 252, 4),
                ]),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 45.0,
              bottom: 20.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
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
                SizedBox(
                  height: 350,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (index) {
                      pageNo = index;
                      setState(() {});
                    },
                    itemBuilder: (context, pagaPosition) {
                      return AnimatedBuilder(
                        animation: pageController,
                        builder: (ctx, child) {
                          return child!;
                        },
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Image.network(
                                imgs[pagaPosition],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          onPanDown: (d) {
                            carasouelTmer?.cancel();
                            carasouelTmer = null;
                          },
                          onPanCancel: () {
                            carasouelTmer = getTimer();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 8, left: 8, top: 24, bottom: 12),
                            child: Image.network(
                              imgs[pagaPosition],
                              fit: BoxFit.fill,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(54.0),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 3,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (pagaPosition) => GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.circle,
                          size: 12.0,
                          color: pageNo == pagaPosition
                              ? Colors.indigoAccent
                              : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
