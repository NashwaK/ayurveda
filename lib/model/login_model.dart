
class LoginModelClass {
  bool? status;
  String? message;
  String? token;
  bool? isSuperuser;
  UserDetails? userDetails;

  LoginModelClass({this.status, this.message, this.token, this.isSuperuser, this.userDetails});

  LoginModelClass.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool) {
      status = json["status"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["token"] is String) {
      token = json["token"];
    }
    if(json["is_superuser"] is bool) {
      isSuperuser = json["is_superuser"];
    }
    if(json["user_details"] is Map) {
      userDetails = json["user_details"] == null ? null : UserDetails.fromJson(json["user_details"]);
    }
  }

  static List<LoginModelClass> fromList(List<Map<String, dynamic>> list) {
    return list.map(LoginModelClass.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    _data["token"] = token;
    _data["is_superuser"] = isSuperuser;
    if(userDetails != null) {
      _data["user_details"] = userDetails?.toJson();
    }
    return _data;
  }
}

class UserDetails {
  int? id;
  dynamic lastLogin;
  String? name;
  String? phone;
  String? address;
  String? mail;
  String? username;
  String? password;
  String? passwordText;
  int? admin;
  bool? isAdmin;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic branch;

  UserDetails({this.id, this.lastLogin, this.name, this.phone, this.address, this.mail, this.username, this.password, this.passwordText, this.admin, this.isAdmin, this.isActive, this.createdAt, this.updatedAt, this.branch});

  UserDetails.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    lastLogin = json["last_login"];
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["address"] is String) {
      address = json["address"];
    }
    if(json["mail"] is String) {
      mail = json["mail"];
    }
    if(json["username"] is String) {
      username = json["username"];
    }
    if(json["password"] is String) {
      password = json["password"];
    }
    if(json["password_text"] is String) {
      passwordText = json["password_text"];
    }
    if(json["admin"] is int) {
      admin = json["admin"];
    }
    if(json["is_admin"] is bool) {
      isAdmin = json["is_admin"];
    }
    if(json["is_active"] is bool) {
      isActive = json["is_active"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    branch = json["branch"];
  }

  static List<UserDetails> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserDetails.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["last_login"] = lastLogin;
    _data["name"] = name;
    _data["phone"] = phone;
    _data["address"] = address;
    _data["mail"] = mail;
    _data["username"] = username;
    _data["password"] = password;
    _data["password_text"] = passwordText;
    _data["admin"] = admin;
    _data["is_admin"] = isAdmin;
    _data["is_active"] = isActive;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["branch"] = branch;
    return _data;
  }
}
