import 'package:safiritours/common/models/login_request_model.dart';
import 'package:safiritours/common/utils/http_util.dart';

class AuthService {
  static login({LoginRequestModel? loginModel}) async {
    var response = await HttpUtil().post(
        "api/login",
      queryParameters: loginModel?.toJson()
    );
    print("--------> [UserAPI] Login response: ${response}");
    return LoginRequestModel.fromJson(response.data);
  }
}