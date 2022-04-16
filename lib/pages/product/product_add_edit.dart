import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_rental_flutter/pages/models/product.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class ProductAddEdit extends StatefulWidget {
  const ProductAddEdit({ Key? key }) : super(key: key);

  @override
  State<ProductAddEdit> createState() => _ProductAddEditState();
}

class _ProductAddEditState extends State<ProductAddEdit> {
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isAPICallProcess = false;
  Product ? product;
  bool isEditMode = false;
  bool isImageSelected = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: AppBar(
        title: const Text("NodeJS -Crud App"),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: ProgressHUD(
        child: Form(
          key: globalFormKey,
          child: productForm(),
          ),
          inAsyncCall:isAPICallProcess,
          opacity: .3,
          key: UniqueKey(),
      ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    product = Product(desc: '', id: null, image: '', name: '', price: null);

    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        product = arguments['model'];
        isEditMode = true;
        setState(() {});
      }
    });
  }

  Widget productForm(){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.only(
            bottom: 10,
            top: 10
          ),
          child: FormHelper.inputFieldWidget(context,
          // const Icon(Icons.ac_unit),
          "ProductName",
          "Product Name",
          (onValidateVal){
            if(onValidateVal.isEmpty){
              return "product name cant't be empty";
            }
            return null;
          },
          (onSavedVal){
            product!.name = onSavedVal;
          },
          initialValue: product!.name!,
          borderColor: Colors.black,
          borderFocusColor: Colors.black,
          textColor: Colors.black,
          hintColor: Colors.black.withOpacity(.7),
          borderRadius: 10,
          showPrefixIcon: false,

          ),
          ),
          Padding(padding: const EdgeInsets.only(
            bottom: 10,
            top: 10
          ),
          child: FormHelper.inputFieldWidget(context,
          // const Icon(Icons.ac_unit),
          "ProductPrice",
          "Product Price",
          
          (onValidateVal){
            if(onValidateVal.isEmpty){
              return "product price cant't be empty";
            }
            return null;
          },
          (onSavedVal){
            product!.price = int.parse(onSavedVal);
          },
          initialValue: product!.price == null ? "":product!.price.toString(),
          borderColor: Colors.black,
          borderFocusColor: Colors.black,
          textColor: Colors.black,
          hintColor: Colors.black.withOpacity(.7),
          borderRadius: 10,
          showPrefixIcon: false,
          suffixIcon: const Icon(Icons.monetization_on),

          ),
          ),
          picPicker(isImageSelected,product!.image ?? "", (file)=>{
            setState(
                () {
                  product!.image = file.path;
                  isImageSelected = true;
                },
              )
          }), 
          const SizedBox(height: 20,),
          Center(child: FormHelper.submitButton("save", (){
            if(validateAndSave()){
              //API Service
            }
          },btnColor: HexColor("#283871"),
          borderColor: Colors.white,
          borderRadius: 10,
          )),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  static Widget picPicker(bool isFileSelected, String filename,Function onFilePicked){
    Future<XFile?> _imageFile;
    ImagePicker picker  = ImagePicker();

    return Column(
      children: [
        filename.isNotEmpty ? 
        !isFileSelected ? Image.file(File(filename),height: 200,width: 200,)
        :SizedBox(child: Image.network(filename,width: 200,height: 200,fit: BoxFit.scaleDown,),)
        :SizedBox(child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc",width: 200,height: 200,fit: BoxFit.scaleDown,)
        ,),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 35.0,
              width: 35.0,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: const Icon(Icons.image, size: 35.0),
                onPressed: () {
                  _imageFile = picker.pickImage(source: ImageSource.gallery);
                  _imageFile.then((file) async {
                    onFilePicked(file);
                  });
                },
              ),
            ),
            SizedBox(
              height: 35.0,
              width: 35.0,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: const Icon(Icons.camera, size: 35.0),
                onPressed: () {
                  _imageFile = picker.pickImage(source: ImageSource.camera);
                  _imageFile.then((file) async {
                    onFilePicked(file);
                  });
                },
              ),
            ),
      ],
    ),
      ],
    ); 
  }
}