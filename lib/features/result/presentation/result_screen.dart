import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultScreen extends StatefulWidget {
  final Map<String, dynamic> decodedBody;
  ResultScreen({super.key, required this.decodedBody});

  @override
  State<ResultScreen> createState() => _ResultScreenState();

  static void presentScreen(BuildContext context, Map<String, dynamic> decodedBody) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(decodedBody: decodedBody),
        ));
  }
}

class _ResultScreenState extends State<ResultScreen> {
  /// TODO: assign a variable to store result
  /// Example:
  String? prediction;
  String? description;
  List<String>? causes;
  List<String>? symptoms;
  String? treatments;
  String? imageUrl;
  

  @override
  void initState(){
    // TODO: fetch result here

    /// abc = ------
    super.initState();
    final Map<String, dynamic> resultData = widget.decodedBody;
    prediction = resultData["result"]["Predictions"];
    description = resultData["result"]["Descriptions"];
    causes = resultData["result"]["Causes"]?.cast<String>();
    symptoms = resultData["result"]["Symptoms"]?.cast<String>();
    treatments = resultData["result"]["Treatment"];
    imageUrl = resultData["image"];
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Result'),
  //       centerTitle: true,
  //     ),
  //     body: FutureBuilder(
  //       future: null,
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return const Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //         // if (snapshot.hasData) {
  //           return const Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         // } else {
  //         //   print("here2 $snapshot");
  //         //   return const Center(
  //         //     child: CircularProgressIndicator(),
  //         //   );
  //         // }
  //       },
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (imageUrl != null && imageUrl!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // Optional rounded corners
                child: SizedBox(
                  height: 256,
                  width: 256,
                  child: Image.network(
                    imageUrl!,
                    fit: BoxFit.cover, // Adjust as needed
                    errorBuilder: (context, error, stackTrace) =>
                        const Text('Error loading image'),
                  ),
                ),
              ),
            Card(
              child: ListTile(
                title: Text("Predictions:"),
                subtitle: Text(prediction ?? "N/A"), // Handle null prediction
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Description:"),
                subtitle: Text(description ?? "N/A"), // Handle null description
              ),
            ),
            if (causes != null && causes!.isNotEmpty)
              Card(
                child: ListTile(
                  title: Text("Causes:"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: causes!.map((cause) => Row(
                      children: [
                        const Text("• "), // Use a bullet point symbol (adjust spacing as needed)
                        Expanded(child:Text(cause)),
                      ],
                    )).toList(),
                  ),
                ),
              ),
            if (symptoms != null && symptoms!.isNotEmpty)
              Card(
                child: ListTile(
                  title: Text("Symptoms:"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: symptoms!.map((symptom) => Row(
                      children: [
                        const Text("• "), // Use a bullet point symbol (adjust spacing as needed)
                        Expanded(child: Text(symptom)),
                      ],
                    )).toList(),
                  ),
                ),
              ),
            if (treatments != null && treatments!.isNotEmpty)
              Card(
                child: ListTile(
                  title: Text("Treatments:"),
                  subtitle: Text(
                    treatments ?? "N/A"
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
