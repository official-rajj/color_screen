// import "package:flutter/material.dart";

// class GstScreen extends StatefulWidget {
//   const GstScreen({super.key});

//   @override
//   State<GstScreen> createState() => _GstScreenState();
// }

// class _GstScreenState extends State<GstScreen> {
//   TextEditingController txtAmnt = TextEditingController();
//   TextEditingController txtPer = TextEditingController();
//   TextEditingController txtTotalAmnt = TextEditingController();
//   var igst = 0.0;
//   var sgst = 0.0;
//   var cgst = 0.0;
//   bool isRev = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("GST CALC"),
//         backgroundColor: Colors.orange,
//       ),
//       body: Column(
//         children: [
//           SwitchListTile(
//             value: isRev,
//             onChanged: (v) {
//               isRev = v;
//               setState(() {});
//             },
//             title: Text('isReverse'),
//           ),
//           SizedBox(height: 20),
//           TextField(
//             controller: txtAmnt,
//             decoration:
//                 InputDecoration(hintText: 'Enter Amount', labelText: 'Amount'),
//           ),
//           SizedBox(height: 20),
//           TextField(
//             controller: txtPer,
//             decoration:
//                 InputDecoration(hintText: 'Enter GST %', labelText: 'GST %'),
//           ),
//           Text('CGST:$cgst'),
//           Text('SGST:$sgst'),
//           Text('IGST:$igst'),
//           TextField(
//             controller: txtTotalAmnt,
//             decoration: InputDecoration(
//                 hintText: 'Enter Total Amount', labelText: ' Total Amount'),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               if (txtAmnt.text.isNotEmpty && txtPer.text.isNotEmpty) {
//                 igst = double.parse(txtAmnt.text) *
//                     double.parse(txtPer.text) *
//                     0.01;
//                 cgst = igst * 0.5;
//                 sgst = igst * 0.5;
//                 txtTotalAmnt.text =
//                     (double.parse(txtAmnt.text) + igst).toString();
//               }
//               setState(() {});
//             },
//             child: Text('Calculate'),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class GstScreen extends StatefulWidget {
  const GstScreen({super.key});

  @override
  State<GstScreen> createState() => _GstScreenState();
}

class _GstScreenState extends State<GstScreen> {
  TextEditingController txtAmnt = TextEditingController();
  TextEditingController txtPer = TextEditingController();
  TextEditingController txtTotalAmnt = TextEditingController();
  var igst = 0.0;
  var sgst = 0.0;
  var cgst = 0.0;
  bool isRev = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GST CALC"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SwitchListTile(
              value: isRev,
              onChanged: (v) {
                setState(() {
                  isRev = v;
                });
              },
              title: Text('Reverse Calculation'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: txtAmnt,
              decoration: InputDecoration(
                  hintText: isRev ? 'Enter Total Amount' : 'Enter Amount',
                  labelText: isRev ? 'Total Amount' : 'Amount'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: txtPer,
              decoration:
                  InputDecoration(hintText: 'Enter GST %', labelText: 'GST %'),
            ),
            Text('CGST: $cgst'),
            Text('SGST: $sgst'),
            Text('IGST: $igst'),
            TextField(
              controller: txtTotalAmnt,
              decoration: InputDecoration(
                hintText: isRev ? 'Enter Amount' : 'Total Amount',
                labelText: isRev ? 'Amount' : 'Total Amount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (txtAmnt.text.isNotEmpty && txtPer.text.isNotEmpty) {
                  var amount = double.parse(txtAmnt.text);
                  var gstPercent = double.parse(txtPer.text);

                  if (isRev) {
                    // Reverse calculation
                    igst = amount * (gstPercent / (100 + gstPercent));
                    cgst = igst / 2;
                    sgst = igst / 2;
                    txtTotalAmnt.text = (amount - igst).toStringAsFixed(2);
                  } else {
                    // Regular calculation
                    igst = amount * gstPercent * 0.01;
                    cgst = igst * 0.5;
                    sgst = igst * 0.5;
                    txtTotalAmnt.text = (amount + igst).toStringAsFixed(2);
                  }
                }
                setState(() {});
              },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
