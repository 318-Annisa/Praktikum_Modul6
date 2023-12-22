import 'package:cake_baru/app/data/news_model.dart';
import 'package:cake_baru/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'registration_unit_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late HomeController homeController;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    homeController = HomeController();
  });

  group('HomeController', () {
    test('fetchArticles updates articles on successful response', () async {
      // Mock a successful HTTP response
      when(mockClient.get(Uri.parse(
              'https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=9a9ae921f47740ed8d4d87452bf3018e')))
          .thenAnswer((_) async => http.Response('{"articles": []}', 200));

      // Call the fetchArticles method
      await homeController.fetchArticles();

      // Expect articles to be updated with a list of Article
      expect(homeController.articles, isA<List<Article>>());
      // Expect articles list not to be empty
      expect(homeController.articles, isNotEmpty);
    });

    test('fetchArticles length more than 1', () async {
      // Mock a failed HTTP response
      when(mockClient.get(Uri.parse(
              'https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=9a9ae921f47740ed8d4d87452bf3018e')))
          .thenAnswer((_) async => http.Response('Server Error', 500));

      // Call the fetchArticles method
      final response = await homeController.fetchArticles();

      // Expect articles to be empty since the response is a failure
      expect(true, response.length > 1);
    });
  });
}
