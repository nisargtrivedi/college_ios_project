
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

getMenuDecoration(){
  return  BoxDecoration(color: Colors.green,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.shade600,
            spreadRadius: 1,
            blurRadius: 10
        )
      ],
      borderRadius: BorderRadius.all(Radius.circular(10)));
}
// Color(0xff499fd5)