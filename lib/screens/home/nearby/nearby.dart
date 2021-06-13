import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wmp/utils/constants.dart';

class NearBy extends StatefulWidget {
  const NearBy({Key? key}) : super(key: key);

  @override
  _NearByState createState() => _NearByState();
}

class _NearByState extends State<NearBy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(20, (index) {
            return Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Container(
                    width: 25,
                    child: Text('${index + 1}'),
                  ),
                  _imageView(),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  _imageView() {
    return Image(
      image: AssetImage('assets/images/profile.jpg'),
      width: 100,
    );
  }
}
