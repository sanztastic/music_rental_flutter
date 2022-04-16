class CatalogModel {
  static final items = [
    Product(
        id: 1,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc")
  ];
}

class Product {
  late int? id;
  late String? name;
  late String? desc;
  late num? price;
  late String? image;

  Product(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.image});

      Product.fromJson(Map<String,dynamic> json){
        id = json["id"];
        name = json["name"];
        desc = json["desc"];
        price = json["price"];
        image = json["image"];
      }

      Map<String,dynamic> toJson(){
        final _data = <String,dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["desc"] = desc;
        _data["price"] = price;
        _data["image"] = image;

        return _data;
      }
}
