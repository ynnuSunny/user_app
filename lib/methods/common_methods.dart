import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CommonMethods {
  checkConnectivity(BuildContext context) async{
    var connectionResult = await Connectivity().checkConnectivity();

    if(connectionResult!=  ConnectivityResult.wifi && connectionResult!= ConnectivityResult.mobile){
        if(!context.mounted) return;
        displaySnackBar("Your internet is  not working", context);

    }
    // print("Your internet is  not working");

  }
  displaySnackBar(String messageText, BuildContext context) {
    var snackBar =SnackBar(content: Text(messageText));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}