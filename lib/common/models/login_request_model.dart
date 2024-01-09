class LoginRequestModel {
  String? name;
  String? email;
  //String? phone;
  String? userType;
  int? type;
  String? openId;
  String? avatar;
  String? token;
  String? accessToken;
  String? createdAt;
  String? updatedAt;

  LoginRequestModel(
      {
        this.name,
        this.email,
       //this.phone,
        this.userType,
        this.type,
        this.openId,
        this.avatar,
        this.token,
        this.accessToken,
        this.createdAt,
        this.updatedAt});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    //phone = json['phone'];
    userType = json['user_type'];
    type = json['type'];
    openId = json['open_id'];
    avatar = json['avatar'];
    token = json['token'];
    accessToken = json['access_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    //data['phone'] = this.phone;
    data['user_type'] = this.userType;
    data['type'] = this.type;
    data['open_id'] = this.openId;
    data['avatar'] = this.avatar;
    data['token'] = this.token;
    data['access_token'] = this.accessToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
