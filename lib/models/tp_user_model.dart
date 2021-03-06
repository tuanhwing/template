
class TPUserModel {
  String username;

  TPUserModel({
    this.username
  });

  void clone(TPUserModel model) {
    this.username = model.username;
  }

  TPUserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    return data;
  }
}