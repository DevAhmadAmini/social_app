import 'package:flutter/material.dart';

void showErrorSnackBar(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Something went Wrong. Please try again later"),
    ),
  );
}

void showPostedSnackBar(context){
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content:Text("Posted Succesfully"),
    ),
  );
}

void showLoggedInSnackBar(context){
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content:Text("Signed In Succesfully"),
    ),
  );
}

