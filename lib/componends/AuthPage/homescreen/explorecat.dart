import 'package:flutter/material.dart';
import 'package:newsapi_app/model/category.dart';

class exploreSections extends StatelessWidget {
  const exploreSections({super.key, required this.category});
  final ExploreCategory category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10),
      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF001F3F),
                          borderRadius: BorderRadius.circular(15),
                          
                        ),
                        child:Center(child: Text(category.text , style: TextStyle(color: Colors.white , fontSize: 20),)),
                      ),
    );
  }
}