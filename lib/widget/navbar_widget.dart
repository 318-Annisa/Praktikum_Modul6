// navbar_widget.dart
import 'package:cake_baru/app/modules/home/views/webview_page.dart';
import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.transparent,
      elevation: 10,
      child: Container(
        height: 70.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60.0),
            topRight: Radius.circular(60.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: 50.0,
                width: MediaQuery.of(context).size.width / 2 - 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.home,
                      color: Color(0xFFEF7532),
                      size: 35,
                    ),
                    Icon(
                      Icons.search,
                      color: Color(0xFF676E79),
                      size: 35,
                    ),
                  ],
                )),
            SizedBox(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_basket_outlined),
                    color: Color(0xFF676E79),
                    iconSize: 35,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WebviewPage()),
                      );
                    },
                  ),
                  Icon(
                    Icons.person_outline,
                    color: Color(0xFF676E79),
                    size: 35,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
