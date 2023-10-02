import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapi_app/componends/AuthPage/homescreen/homescreen_page.dart';
import 'package:newsapi_app/componends/AuthPage/signup_controller.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController _phoneOrEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
                child: Text(
              "Subspace",
              style: GoogleFonts.playfairDisplay(fontSize: 20),
            )),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(color: Colors.black),
                child: Text(
                  "Let's Sign You in.\nWelcome Back",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            PhoneEmailContainer(
              controller: _phoneOrEmailController,
              hintText: 'Phone,Email or Username',
            ),
            const SizedBox(height: 20),
            PhoneEmailContainer(
              controller: _phoneOrEmailController,
              hintText: 'Password',
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    "Login",
                    style: GoogleFonts.inter(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: const BoxDecoration(color: Colors.black),
              child: Column(
                children: [
                  Text(
                    "Don't have an account? Register.",
                    style: GoogleFonts.inter(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(child: Text("Register")),
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
