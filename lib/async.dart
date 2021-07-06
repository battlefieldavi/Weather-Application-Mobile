import 'dart:io';
import 'package:flutter/cupertino.dart';
void main()
{
  t11();
}
void t11 ()
{
  String s1='av';
  try{
    double d=double.parse(s1);
    print(d);
  }
  catch(e) {
    print(e);
  }
}
// void task1()
// {
//   print("1 done");
// }
// Future<String> task2() async
// {
//   String r;
//   Duration t=Duration(seconds: 2);
//   await Future.delayed(t,()
//   {//async program code
//     r="2 data";
//     print("2 done");
//   });
// return r;
// }
//
// void task3(String n1)
// {
//   print("3 done + =$n1");
// }
