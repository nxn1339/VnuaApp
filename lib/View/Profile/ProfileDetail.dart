import 'package:agriculture/Utils/UtilColor.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  ProfileDetail({super.key});
  Size size = Size(0, 0);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.save,
                color: UtilColor.textBlue,
              ))
        ],
      ),
      body: Container(
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
