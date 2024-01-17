import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Util{
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessage(BuildContext context,String msg){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg),));
  }


}