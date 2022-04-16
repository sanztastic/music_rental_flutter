import 'package:flutter/material.dart';
import 'package:music_rental_flutter/pages/models/product.dart';
import 'package:music_rental_flutter/pages/product/product_item.dart';

class ProductList extends StatefulWidget {
  const ProductList({ Key? key }) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = List<Product>.empty(growable: true);

  @override
  void initState(){
    super.initState();

    products.add(
      Product(
        id: 2,
        name: "televison",
        desc: "UHD 4k Android",
        price: 100000,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc"
        )
    );

    products.add(
      Product(
        id: 3,
        name: "Smart Phone",
        desc: "Nokia Android",
        price: 100000,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc"
        )
    );

    products.add(
      Product(
        id: 4,
        name: "Laptop",
        desc: "Gaming 1060 GTX 16gb Ram",
        price: 100000,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc"
        )
    );
  }

    Widget productList(products){
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.green, 
                  minimumSize: const Size(88, 36),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)
                    )
                  )
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, "/add-product");

                  },
                  child: const Text("Add Product"),
                  ),
                  ListView.builder(shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: products.length,
                  itemBuilder: (context,index){
                    return ProductItem(
                      model: products[index],
                      onDelete: (Product product){},
                    );
                  },
                  )
              ],
            )
          ],
        ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Node js -CRUD App"),
        elevation: 0,

      ),
      backgroundColor: Colors.grey[200],
      body: productList(products),
      
    );
  }
}