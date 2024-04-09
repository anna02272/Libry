import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class SearchDataProvider {
  Future<String?> searchLibraries(String? param) async {
    final apiKey = dotenv.env['API_KEY'];

    if (param == null || param.isEmpty) {
      return null;
    }
    try {
      final res = await http.get(
        Uri.parse('https://libraries.io/api/search?q=$param&api_key=$apiKey'),
      );

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
