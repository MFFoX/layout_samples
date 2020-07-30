import 'package:layout_samples/models/friend.dart';
import 'package:layout_samples/models/user.dart';

class Lead extends User {
  final String phoneNumber;
  final String businessName;
  final Friend referrer;

  Lead(String fullName, String profilePic, this.phoneNumber, this.referrer, this.businessName)
      : super(fullName, profilePic);

  Lead.fromUser(User user, this.phoneNumber, this.referrer, this.businessName):
        super(user.fullName, user.profilePic);
}
