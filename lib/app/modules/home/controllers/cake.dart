class Cake {
  final int id;
  final String name;
  final String price;
  final String imageUrl;
  final bool isFavorite;
  final String subMenu;

  Cake({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.isFavorite,
    required this.subMenu,
  });
}

final List<Cake> listCakes = [
  Cake(
    id: 1,
    name: 'Banana Cake',
    price: '65.000',
    imageUrl: 'assets/banana.jpg',
    isFavorite: true,
    subMenu: 'cake_box',
  ),
  Cake(
    id: 2,
    name: 'Tiramisu Cake',
    price: '45.000',
    imageUrl: 'assets/tiramisu.jpg',
    isFavorite: true,
    subMenu: 'cake_box',
  ),
  Cake(
    id: 3,
    name: 'Fruit Puding',
    price: '70.000',
    imageUrl: 'assets/pudingbuah.jpg',
    isFavorite: true,
    subMenu: 'cake_box',
  ),
  Cake(
    id: 4,
    name: 'Tiramisu Cake',
    price: '60.000',
    imageUrl: 'assets/brownies.jpeg',
    isFavorite: true,
    subMenu: 'cake_box',
  ),
  Cake(
    id: 5,
    name: 'Bolu Pandan',
    price: '60.000',
    imageUrl: 'assets/pandan.webp',
    isFavorite: true,
    subMenu: 'cake_box',
  ),
  Cake(
    id: 5,
    name: 'Croissant',
    price: '60.000',
    imageUrl: 'assets/croisant.webp',
    isFavorite: true,
    subMenu: 'cake_box',
  ),
];
