import 'package:layout_samples/models/seller.dart';
import 'package:layout_samples/models/user.dart';

class Friend extends User{
  final List<Seller> sellers;
  final String recentAction;

  Friend(String fullName, String profilePic, this.sellers, this.recentAction) : super(fullName, profilePic);
  Friend.fromUser(User user, this.sellers, this.recentAction): super(user.fullName, user.profilePic);

}