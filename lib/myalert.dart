import 'package:flutter/material.dart';

class MyAlert extends StatelessWidget {
  final controller;
  VoidCallback oncancel;
  VoidCallback onsave;

  MyAlert(
      {super.key,
      required this.controller,
      required this.oncancel,
      required this.onsave});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(8),
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
      content: SingleChildScrollView(
        child: Container(
          height: 280,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/4105860_2152177.jpg',
                  ),
                  fit: BoxFit.cover,
                )),
                height: 140,
                width: double.infinity,
                child: Image.asset(
                  'assets/4105860_2152177.jpg',
                  fit: BoxFit.cover,
                  height: 60,
                ),
              ),
              Text(
                'Create a new task',
                style: TextStyle(
                  fontFamily: 'hello',
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: 'Add new task',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)))),
              SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    height: 40,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    color: Colors.grey,
                    onPressed: oncancel,
                    child: Text(
                      'cancel',
                      style: TextStyle(
                        fontFamily: 'hello',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  MaterialButton(
                    height: 40,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    color: Colors.red,
                    onPressed: onsave,
                    child: Text(
                      'save',
                      style: TextStyle(
                        fontFamily: 'hello',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
