import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/news_model.dart';

class HomeController extends GetxController {
  RxList<Article> articles = RxList<Article>([]);
  RxBool isLoading = false.obs; // Observable boolean for loading state

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<Iterable<Article>> fetchArticles() async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=9a9ae921f47740ed8d4d87452bf3018e"));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        NewsModel news = NewsModel.fromJson(jsonData);

        articles.assignAll(news.articles as Iterable<Article>);
        return news.articles as Iterable<Article>;
      } else {
        throw Exception("error when request data");
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading.value = false; // Set loading state to false when done
    }
  }
}
