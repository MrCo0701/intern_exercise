class InformationUser {
  final String userName;
  final String email;
  final String imageUrl;

  InformationUser({required this.userName, required this.email, required this.imageUrl});

  InformationUser isEmpty() {
    return InformationUser(userName: '', email: '', imageUrl: '');
  }
}
