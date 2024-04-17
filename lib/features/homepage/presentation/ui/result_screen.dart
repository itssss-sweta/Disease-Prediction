import 'package:dis_pred/features/homepage/domain/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  // final Map<String, dynamic> decodedBody;
  const ResultScreen({
    super.key,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();

  static void presentScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ResultScreen(),
        ));
  }
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final response = context.read<HomeViewModel>().predictionResponseModel;
    final results = response?.result;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: context.read<HomeViewModel>().uploadImage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  if (response?.image != null &&
                      (response?.image?.isNotEmpty ?? false))
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SizedBox(
                        height: 256,
                        width: 256,
                        child: Image.network(
                          response?.image ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error_outline),
                        ),
                      ),
                    ),
                  Card(
                    child: ListTile(
                      title: const Text("Predictions:"),
                      subtitle: Text(results?.predictions ?? "N/A"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: const Text("Description:"),
                      subtitle: Text(results?.descriptions ?? "N/A"),
                    ),
                  ),
                  if (results?.causes != null &&
                      (results?.causes?.isNotEmpty ?? false))
                    Card(
                      child: ListTile(
                        title: const Text("Causes:"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: results?.causes
                                  ?.map((cause) => Row(
                                        children: [
                                          const Text("• "),
                                          Expanded(child: Text(cause)),
                                        ],
                                      ))
                                  .toList() ??
                              [],
                        ),
                      ),
                    ),
                  if (results?.symptoms != null &&
                      (results?.symptoms?.isNotEmpty ?? false))
                    Card(
                      child: ListTile(
                        title: const Text("Symptoms:"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: results?.symptoms
                                  ?.map((symptom) => Row(
                                        children: [
                                          const Text("• "),
                                          Expanded(child: Text(symptom)),
                                        ],
                                      ))
                                  .toList() ??
                              [],
                        ),
                      ),
                    ),
                  if (results?.treatment != null &&
                      (results?.treatment?.isNotEmpty ?? false))
                    Card(
                      child: ListTile(
                        title: const Text("Treatments:"),
                        subtitle: Text(results?.treatment ?? "N/A"),
                      ),
                    ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
