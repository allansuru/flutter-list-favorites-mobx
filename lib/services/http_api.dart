import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rich_and_morty/utils/constants.dart';

class HttpApi {
  // Método GET
  Future<dynamic> getRequest(String endpoint,
      {Map<String, String>? queryParams}) async {
    final uri = Uri.parse('${Constants.baseApi}/$endpoint')
        .replace(queryParameters: queryParams);

    final response = await http.get(uri);

    return _processResponse(response);
  }

  // Método POST
  Future<dynamic> postRequest(
      String endpoint, Map<String, dynamic> payload) async {
    final response = await http.post(
      Uri.parse('${Constants.baseApi}/$endpoint'),
      headers: _headers(),
      body: jsonEncode(payload),
    );

    return _processResponse(response);
  }

  // Método DELETE
  Future<dynamic> deleteRequest(String endpoint) async {
    final response =
        await http.delete(Uri.parse('${Constants.baseApi}/$endpoint'));

    return _processResponse(response);
  }

  // Cabeçalhos comuns para as requisições
  Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  // Processamento de respostas e tratamento de erros
  dynamic _processResponse(http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode >= 200 && statusCode < 300) {
      // Resposta bem-sucedida
      if (response.body.isNotEmpty) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } else {
      // Tratamento de erros
      throw Exception(
          'Erro na requisição: ${response.statusCode}, ${response.body}');
    }
  }
}
