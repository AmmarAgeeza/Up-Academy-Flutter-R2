class LoginModel {
  final String token;
  final String message;

  LoginModel({
    required this.token,
    required this.message,
  });
  //named construcor

  factory LoginModel.fromJson(Map<String,dynamic> json){
    return LoginModel(token:json['token'],message:json['message']);
  }
}
void main(){
  LoginModel(token:'',message:'');
}
// {message: Done, token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZTg2NGEzMDM5ZjAwNDY3Mjk4OTFhOSIsImVtYWlsIjoiYW1tYXJmYXRoeTUxNkBnbWFpbC5jb20iLCJuYW1lIjoiQWdlZXphIiwiaWF0IjoxNjk5MzA0MDU0fQ.XnXxHQuCBsKX5rDLtBkdVVUik6zWS_LycHTMhOeMo8o}