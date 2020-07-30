import 'package:layout_samples/models/friend.dart';
import 'package:layout_samples/models/lead.dart';
import 'package:layout_samples/models/user.dart';

class Seller extends User{
  final String businessName;
  final List<Friend> friends;
  final List<Lead> leads;

  Seller(String fullName, String profilePic, this.businessName, this.friends, this.leads)
      : super(fullName, profilePic);

  Seller.fromUser(User user, this.businessName, this.friends, this.leads)
      : super(user.fullName, user.profilePic);

}