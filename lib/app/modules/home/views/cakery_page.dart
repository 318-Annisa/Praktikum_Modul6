import 'package:cake_baru/app/modules/home/controllers/cake.dart';
import 'package:cake_baru/app/modules/home/detail/detail_view.dart';
import 'package:flutter/material.dart';

class CookiePage extends StatelessWidget {
  const CookiePage({Key? key}) : super(key: key);
  // ini perubahan buat github
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: ListView(
        children: [
          const SizedBox(height: 15.0),
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return _buildCard(listCakes[index], context);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard(
    Cake cake,
    context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          // Navigate to the detail page when the cake box is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ColumnWidget()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              )
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Hero(
                tag: cake.imageUrl,
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(cake.imageUrl),
                        fit: BoxFit.contain,
                      )),
                ),
              ),
              const SizedBox(
                height: 7.0,
              ),
              Text(
                'Rp ${cake.price}',
                style: const TextStyle(
                  color: Color(0xFFCC8053),
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                ),
              ),
              Text(
                cake.name,
                style: const TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: const Color(0xFFEBEBEB),
                  height: 1.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.shopping_basket,
                          color: Color(0xFFD17E50),
                          size: 16,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Beli',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            color: Color(0xFFD17E50),
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.remove_circle_outline,
                          color: Color(0xDDD17E50),
                          size: 16,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          '3',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            color: Color(0xDDD17E50),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(
                          Icons.add_circle_outline,
                          color: Color(0xFFD17E50),
                          size: 16,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
