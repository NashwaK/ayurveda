
class PatientListModelClass {
  bool? status;
  String? message;
  List<Patient>? patient;

  PatientListModelClass({this.status, this.message, this.patient});

  PatientListModelClass.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool) {
      status = json["status"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["patient"] is List) {
      patient = json["patient"] == null ? null : (json["patient"] as List).map((e) => Patient.fromJson(e)).toList();
    }
  }

  static List<PatientListModelClass> fromList(List<Map<String, dynamic>> list) {
    return list.map(PatientListModelClass.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(patient != null) {
      _data["patient"] = patient?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Patient {
  int? id;
  List<PatientdetailsSet>? patientdetailsSet;
  Branch? branch;
  String? user;
  String? payment;
  String? name;
  String? phone;
  String? address;
  dynamic price;
  int? totalAmount;
  int? discountAmount;
  int? advanceAmount;
  int? balanceAmount;
  dynamic dateNdTime;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Patient({this.id, this.patientdetailsSet, this.branch, this.user, this.payment, this.name, this.phone, this.address, this.price, this.totalAmount, this.discountAmount, this.advanceAmount, this.balanceAmount, this.dateNdTime, this.isActive, this.createdAt, this.updatedAt});

  Patient.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["patientdetails_set"] is List) {
      patientdetailsSet = json["patientdetails_set"] == null ? null : (json["patientdetails_set"] as List).map((e) => PatientdetailsSet.fromJson(e)).toList();
    }
    if(json["branch"] is Map) {
      branch = json["branch"] == null ? null : Branch.fromJson(json["branch"]);
    }
    if(json["user"] is String) {
      user = json["user"];
    }
    if(json["payment"] is String) {
      payment = json["payment"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["address"] is String) {
      address = json["address"];
    }
    price = json["price"];
    if(json["total_amount"] is int) {
      totalAmount = json["total_amount"];
    }
    if(json["discount_amount"] is int) {
      discountAmount = json["discount_amount"];
    }
    if(json["advance_amount"] is int) {
      advanceAmount = json["advance_amount"];
    }
    if(json["balance_amount"] is int) {
      balanceAmount = json["balance_amount"];
    }
    dateNdTime = json["date_nd_time"];
    if(json["is_active"] is bool) {
      isActive = json["is_active"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
  }

  static List<Patient> fromList(List<Map<String, dynamic>> list) {
    return list.map(Patient.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if(patientdetailsSet != null) {
      _data["patientdetails_set"] = patientdetailsSet?.map((e) => e.toJson()).toList();
    }
    if(branch != null) {
      _data["branch"] = branch?.toJson();
    }
    _data["user"] = user;
    _data["payment"] = payment;
    _data["name"] = name;
    _data["phone"] = phone;
    _data["address"] = address;
    _data["price"] = price;
    _data["total_amount"] = totalAmount;
    _data["discount_amount"] = discountAmount;
    _data["advance_amount"] = advanceAmount;
    _data["balance_amount"] = balanceAmount;
    _data["date_nd_time"] = dateNdTime;
    _data["is_active"] = isActive;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class Branch {
  int? id;
  String? name;
  int? patientsCount;
  String? location;
  String? phone;
  String? mail;
  String? address;
  String? gst;
  bool? isActive;

  Branch({this.id, this.name, this.patientsCount, this.location, this.phone, this.mail, this.address, this.gst, this.isActive});

  Branch.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["patients_count"] is int) {
      patientsCount = json["patients_count"];
    }
    if(json["location"] is String) {
      location = json["location"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["mail"] is String) {
      mail = json["mail"];
    }
    if(json["address"] is String) {
      address = json["address"];
    }
    if(json["gst"] is String) {
      gst = json["gst"];
    }
    if(json["is_active"] is bool) {
      isActive = json["is_active"];
    }
  }

  static List<Branch> fromList(List<Map<String, dynamic>> list) {
    return list.map(Branch.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["patients_count"] = patientsCount;
    _data["location"] = location;
    _data["phone"] = phone;
    _data["mail"] = mail;
    _data["address"] = address;
    _data["gst"] = gst;
    _data["is_active"] = isActive;
    return _data;
  }
}

class PatientdetailsSet {
  int? id;
  String? male;
  String? female;
  int? patient;
  int? treatment;
  String? treatmentName;

  PatientdetailsSet({this.id, this.male, this.female, this.patient, this.treatment, this.treatmentName});

  PatientdetailsSet.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["male"] is String) {
      male = json["male"];
    }
    if(json["female"] is String) {
      female = json["female"];
    }
    if(json["patient"] is int) {
      patient = json["patient"];
    }
    if(json["treatment"] is int) {
      treatment = json["treatment"];
    }
    if(json["treatment_name"] is String) {
      treatmentName = json["treatment_name"];
    }
  }

  static List<PatientdetailsSet> fromList(List<Map<String, dynamic>> list) {
    return list.map(PatientdetailsSet.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["male"] = male;
    _data["female"] = female;
    _data["patient"] = patient;
    _data["treatment"] = treatment;
    _data["treatment_name"] = treatmentName;
    return _data;
  }
}