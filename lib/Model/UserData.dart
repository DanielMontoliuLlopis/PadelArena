class UserData{
  String userName;
  String email;
  String firstName;
  String lastName;
  String urlImage;
  bool verified;

  UserData(this.userName, this.email, this.firstName, this.lastName, this.urlImage, this.verified );

  Map<String, dynamic> toMap(){
    Map <String, dynamic> value={
      'username': userName,
      'first_name':firstName,
      'last_name':lastName,
      'email':email,
      'url_image':urlImage,
      'verified':verified,
    };
    return value;
  }

}