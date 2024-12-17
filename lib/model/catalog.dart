class CatalogModel {
  static final items = [
    Item(
        id:1,
        name:"apple",
        description: "fresh",
        price: 30,
        color: "#FF0000 ",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFkkHvVGKA9Ofr5uH9exGOxEJ94rLwcJs1mQ&s",
        )
  ];
}

class Item {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.image});
}
