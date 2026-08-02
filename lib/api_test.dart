import 'package:flutter/material.dart';
import 'Serives/api_service.dart';

class TestApi extends StatefulWidget {
  const TestApi({super.key});

  @override
  State<TestApi> createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  @override
  void initState() {
    super.initState();
    testApi();
  }

  void testApi() async {
    final response = await ApiService().getCategories();
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Testing API..."),
      ),
    );
  }
}