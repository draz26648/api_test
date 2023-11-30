import 'package:api_test/model/api_service/api_service.dart';
import 'package:api_test/model/api_service/end_points.dart';
import 'package:api_test/model/models/news_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsModel? newsModel;
  bool isLoading = false;

  @override
  void initState() {
    getHeadLines();
    super.initState();
  }

  void getHeadLines() async {
    setState(() {
      isLoading = true;
    });
    newsModel = await ApiService.getHeadLines();
    isLoading = false;
    setState(() {});
  }

  List<String> categories = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology',
  ];

  List<String> countries = [
    'eg',
    'us',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Country'),
              DropdownButton<String>(
                value: country,
                onChanged: (value) {
                  setState(() {
                    country = value!;
                  });
                  getHeadLines();
                },
                items: countries
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Category'),
              DropdownButton<String>(
                value: category,
                onChanged: (value) {
                  setState(() {
                    category = value!;
                  });
                  getHeadLines();
                },
                items: categories
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: newsModel?.articles?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(newsModel?.articles?[index].title ?? ''),
                        subtitle: Text(newsModel?.articles?[index].author ?? ''),
                      );
                    },
                  ),
              ),
        ],
      ),
    );
  }
}
