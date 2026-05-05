class ErorrModel {
  final int status;
  final String erorrmessage;
  final String title;


  ErorrModel({required this.status, required this.erorrmessage,required this.title});
  factory ErorrModel.fromJson(Map<String,dynamic> jsondata){
    return ErorrModel(
      status: jsondata["status"] ?? 0, 
      erorrmessage: jsondata["errors"] [0]?? "",
      title: jsondata["message"]??""
      );
      
      
      
  }
  
  
}