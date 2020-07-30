import 'package:layout_samples/models/user.dart';

class Seller extends User{
  final String businessName;

  Seller(String fullName, String profilePic, this.businessName)
      : super(fullName, profilePic);

  Seller.fromUser(User user, this.businessName)
      : super(user.fullName, user.profilePic);

}