class ContractModel {
  String? thFirstName;
  String? thLastName;
  String? enFirstName;
  String? enLastName;
  int? age;

  ContractModel({
    this.thFirstName,
    this.thLastName,
    this.enFirstName,
    this.enLastName,
    this.age,
  });

  ContractModel.fromJson(Map<String, dynamic> json) {
    thFirstName = json['thFirstName'];
    thLastName = json['thLastName'];
    enFirstName = json['enFirstName'];
    enLastName = json['enLastName'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['thFirstName'] = thFirstName;
    data['thLastName'] = thLastName;
    data['enFirstName'] = enFirstName;
    data['enLastName'] = enLastName;
    data['age'] = age;
    return data;
  }
}
