
import '../../../core/api_services/api_services.dart';
import '../../../core/api_services/endpoint.dart';
import '../../../core/utils/print_log_utils.dart';
import '../responsesmodel/user_responses_model.dart';

class AuthDataSource {
  final HttpManager _httpManager = HttpManager();

   Future<UserResponsesModel?> getUser(int page, int perpage) async {
    try {
      final response = await _httpManager.restRequest(
        url: Endpoint.userEndpoint(page, perpage),
        useAuth: false,
        method: HttpMethods.get, // Specify the HTTP method
        isFormData: false,
      );

      if (response['statusCode'] == 200) {
        PrintLog.printLog('getUser DataSource response: ${response['data']}');
        return UserResponsesModel.fromJson(response['data']);
      } else {
        PrintLog.printLog(
            'getUser DataSource failed: ${response['statusMessage']}');
        return null;
      }
    } catch (e) {
      PrintLog.printLog('getUser DataSource error: $e');
      return null;
    }
  }

  
}
