class AppUser {
  final String name;
  final String email;
  final String uid;

  AppUser({required this.email, required this.name, required this.uid});

  //convert to jason format

  Map<String, dynamic> toJason() {
    return {"uid": uid, "name": name, "email": email};
  }

  // convert Jason to AppUser

  factory AppUser.fromJason(Map<String, dynamic> jason) {
    return AppUser(
      email: jason['email'],
      name: jason['name'],
      uid: jason['uid'],
    );
  }
}
