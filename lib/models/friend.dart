import 'package:layout_samples/models/user.dart';

class Friend extends User{
  final String recentAction;

  Friend(String fullName, String profilePic, this.recentAction) : super(fullName, profilePic);
  Friend.fromUser(User user, this.recentAction): super(user.fullName, user.profilePic);

}