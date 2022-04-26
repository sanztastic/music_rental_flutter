import 'package:flutter/material.dart';
import 'package:music_rental_flutter/pages/forgotPassword/components/pageOneProvider.dart';
import 'package:music_rental_flutter/widgets/my_button.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPageOne extends StatefulWidget {
  const ForgotPasswordPageOne({ Key? key }) : super(key: key);

  @override
  State<ForgotPasswordPageOne> createState() => _ForgotPasswordPageOneState();
}

class _ForgotPasswordPageOneState extends State<ForgotPasswordPageOne> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    PageOneProvider pageOneProvider = Provider.of<PageOneProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Please enter your email address",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  hintText: "Email Address",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                onPressed: () {
                  pageOneProvider.verifyEmail(
                    email: email, context: context);
                  },
                  btnText: "Submit",
                    color: const [Color(0xff027f47), Color(0xff01a95c)],
              )
            ],
          ),
        ),
      ),
    );
  }
}