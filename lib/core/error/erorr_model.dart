class ErorrModel {
  final int status;
  final String erorrmessage;

  ErorrModel({required this.status, required this.erorrmessage});
  factory ErorrModel.fromJson(Map<String,dynamic> jsondata){
    return ErorrModel(
      status: jsondata["status"] ?? 0, 
      erorrmessage: jsondata["message"] ?? "");
  }
  
  
}