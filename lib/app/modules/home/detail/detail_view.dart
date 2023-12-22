import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey[200], // Set your desired background color here
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF545D68),
              ),
              onPressed: () {
                // Use Navigator to pop the current route and go back to the previous screen
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'Cake Store Doa Ibu',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545068),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_none,
                  color: Color(0xFF545D68),
                ),
                onPressed: () {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 370,
                  height: 350,
                  child: Image.asset(
                    "assets/tiramisu.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40, // Adjust the height of the BUY button
                width: 190, // Adjust the width of the BUY button
                color: Colors.blueGrey,
                child: Center(
                  child: Text(
                    "BUY",
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18, // Adjust the font size of the BUY button
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text('UK: 36-40.'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 150),
            child: const Text(
              'Rp. 300.000',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
