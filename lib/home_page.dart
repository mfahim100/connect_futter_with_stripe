import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map<String,dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(onPressed: () async {
            print('jhhkhjh');
            await makePayment();
          },style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,

          ), child: const Text('Connect With Stripe'),),
        ),
      ),
    );
  }




  Future<void> makePayment() async {
    try{
      paymentIntentData = await createPaymentIntent('20', 'USD');
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentData!['client_secret'],
            style: ThemeMode.dark,
            merchantDisplayName: 'Fahim',
          ));

      displayPaymentSheet();


    }
        catch(e){
      print('The exception in makePayment is $e');
        }
  }

  displayPaymentSheet()async{


    try{
      Stripe.instance.presentPaymentSheet();
      setState(() {
        paymentIntentData = null;
      });
    }

        catch(e){
      print('The exception is displayPaymentSheet $e');
        }
  }



  createPaymentIntent(String amount,currency) async {
    try{
      Map<String, dynamic> body ={
        'amount': calculateAmount(amount),
        'currency':currency,
        'payment_method_types[]':'card'
      };

      var response = await http.post(Uri.parse('https://api.stripe.com/v1/payment_intent'),
      body: body,
        headers: {
          'Authorization':'Bearer sk_test_51PE8ViBhBb56K4Ki9xriWGF73Wih2KyvQwoozvvZWT5XnMcNWMjwCrDj4RefltOnZcriDQhZE5QDoyOKBmIfyZaG00ZWXeLYp8',
          'Content-Type' : 'application/x-www-form-urlencoded'
        });

      return jsonDecode(response.body.toString());
    }
        catch(e){
       print('THe exception in createPaymentIntent is $e');
        }


  }



  calculateAmount(String amount){
    final price = int.parse(amount) *100;
    return price.toString();
  }






}

