import 'package:flutter/material.dart';
import 'package:music_rental_flutter/pages/welcome/welcome_page.dart';

import '../../../main.dart';
import '../../../widgets/admin_drawer.dart';
import '../../../widgets/item_widget.dart';
import '../../models/product.dart';
import '../../product/product_list.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AdminBuildDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              storage.deleteAll();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const WelcomePage()));
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
      ),
      body: 
      ProductList(),
      
    );
  }
}
