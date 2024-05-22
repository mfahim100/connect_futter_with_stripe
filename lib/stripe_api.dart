//
//
// Future<void> makePayment() async {
//   try {
//     paymentIntentData =
//     await createPaymentIntent('20', 'USD'); //json.decode(response.body);
//     // print('Response body==>${response.body.toString()}');
//     await Stripe.instance
//         .initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//             setupIntentClientSecret: 'Bearer sk_test_51PE8ViBhBb56K4Ki9xriWGF73Wih2KyvQwoozvvZWT5XnMcNWMjwCrDj4RefltOnZcriDQhZE5QDoyOKBmIfyZaG00ZWXeLYp8',
//             paymentIntentClientSecret:
//             paymentIntentData!['Bearer sk_test_51PE8ViBhBb56K4Ki9xriWGF73Wih2KyvQwoozvvZWT5XnMcNWMjwCrDj4RefltOnZcriDQhZE5QDoyOKBmIfyZaG00ZWXeLYp8'],
//             //applePay: PaymentSheetApplePay.,
//             //googlePay: true,
//             //testEnv: true,
//             customFlow: true,
//             style: ThemeMode.dark,
//             // merchantCountryCode: 'US',
//             merchantDisplayName: 'Kashif'))
//         .then((value) {});
//
//     ///now finally display payment sheeet
//     displayPaymentSheet();
//   } catch (e, s) {
//     print('Payment exception:$e$s');
//   }
// }
//
// displayPaymentSheet() async {
//   try {
//     await Stripe.instance.presentPaymentSheet(
//       //       parameters: PresentPaymentSheetParameters(
//       // clientSecret: paymentIntentData!['client_secret'],
//       // confirmPayment: true,
//       // )
//     )
//         .then((newValue) {
//       print('payment intent${paymentIntentData!['id']}');
//       print(
//           'payment intent${paymentIntentData!['client_secret']}');
//       print('payment intent${paymentIntentData!['amount']}');
//       print('payment intent$paymentIntentData');
//       //orderPlaceApi(paymentIntentData!['id'].toString());
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text("paid successfully")));
//
//       paymentIntentData = null;
//     }).onError((error, stackTrace) {
//       print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
//     });
//   } on StripeException catch (e) {
//     print('Exception/DISPLAYPAYMENTSHEET==> $e');
//     showDialog(
//         context: context,
//         builder: (_) => const AlertDialog(
//           content: Text("Cancelled "),
//         ));
//   } catch (e) {
//     print('$e');
//   }
// }
//
// //  Future<Map<String, dynamic>>
// createPaymentIntent(String amount, String currency) async {
//   try {
//     Map<String, dynamic> body = {
//       'amount': calculateAmount('20'),
//       'currency': currency,
//       'payment_method_types[]': 'card',
//     };
//     print(body);
//     var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         body: body,
//         headers: {
//           'Authorization': 'Bearer sk_test_51PE8ViBhBb56K4Ki9xriWGF73Wih2KyvQwoozvvZWT5XnMcNWMjwCrDj4RefltOnZcriDQhZE5QDoyOKBmIfyZaG00ZWXeLYp8',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         });
//     print('Create Intent reponse ===> ${response.body.toString()}');
//     return jsonDecode(response.body);
//   } catch (err) {
//     print('err charging user: ${err.toString()}');
//   }
// }
//
// calculateAmount(String amount) {
//   final a = (int.parse(amount)) * 100;
//   return a.toString();
// }
//
