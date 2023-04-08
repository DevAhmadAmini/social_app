import 'package:flutter/material.dart';


const kTextFieldStyle = InputDecoration(
  hintText: "Enter Your Email",
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue,
    ),
  ),
  border: OutlineInputBorder(),
  disabledBorder: OutlineInputBorder(),
);

const kContainerDecoration = BoxDecoration(
  color: Color(0xff3B70F9),
  borderRadius: BorderRadius.all(
    Radius.circular(18),
  ),
);

const kSearchContainerDecoration = BoxDecoration(
                     color: Colors.grey,
                      borderRadius:  BorderRadius.all(
                        Radius.circular(11),
                      ),
                    );
