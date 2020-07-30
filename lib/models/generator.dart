import 'dart:math';
import 'package:layout_samples/models/friend.dart';
import 'package:layout_samples/models/lead.dart';
import 'package:layout_samples/models/seller.dart';
import 'package:layout_samples/models/user.dart';
import 'package:ultimate_data_generator/ultimate_data_generator.dart';

class UserGen {
  static int getSmallNumber(){
    var rand = Random().nextInt(5) + 1;
    return rand;
  }

  static int getLargeNumber(){
    var rand = Gen.generateNumberInRange(a: 500, b: 5000);
    return rand;
  }

  static double getSmallDouble(){
    var smallInt = getSmallNumber();
    var randDouble = Random().nextDouble();
    return smallInt + randDouble;
  }

  static Friend generateFriend() {
    var baseUser = getRandomUser();
    var recentActions = getRecentAction();

    return Friend.fromUser(baseUser, recentActions);
  }

  static List<Friend> generateFriends(int length) {
    var friends = List<Friend>();
    for(int i = 0; i < length; i++){
      friends.add(generateFriend());
    }

    return friends;
  }

  static Lead generateLead() {
    var baseUser = getRandomUser();
    var phoneNumber = getPhoneNumber();
    var referrer = generateFriend();
    var businessName = getBusinessName();

    return Lead.fromUser(baseUser, phoneNumber, referrer, businessName);

  }

  static List<Lead> generateLeads(int length) {
    var leads = List<Lead>();
    for(int i = 0; i < length; i++){
      leads.add(generateLead());
    }

    return leads;
  }

  static Seller generateSeller() {
    var baseUser = getRandomUser();
    var businessName = getBusinessName();
    var friends = generateFriends(getSmallNumber());
    var leads = generateLeads(getSmallNumber());

    return Seller.fromUser(baseUser, businessName, friends, leads);
  }

  static List<Seller> generateSellers(int length) {
    var sellers = List<Seller>();
    for(int i = 0; i < length; i++){
      sellers.add(generateSeller());
    }

    return sellers;
  }
}

abstract class RandomUserInterface{
  User getUser();
}

class FemaleUser implements RandomUserInterface{
  User getUser(){
    var fullName = HumanGen.generateAGirlFullname();
    var profilePic = HumanGen.generateAdultFemaleImage();

    return new User(fullName, profilePic);
  }
}

class MaleUser implements RandomUserInterface{
  User getUser(){
    var fullName = HumanGen.generateABoyFirstName() + " " + HumanGen.generateASurname();
    var profilePic = HumanGen.generateAdultMaleImage();

    return new User(fullName, profilePic);
  }
}

User getRandomUser(){
  var randomUsers = [MaleUser(), FemaleUser()];
  int i = Random().nextInt(randomUsers.length);

  return randomUsers[i].getUser();
}

String getRecentAction(){
  var recentActions = [
    "Added ${UserGen.getSmallNumber() + 1} leads",
    "${UserGen.getSmallNumber() + 1} new messages",
    "Just signed up",
    "Just got paid!"
  ];

  var randomIndex = Random().nextInt(recentActions.length);
  return recentActions[randomIndex];
}

String getBusinessName(){
  return IndustryGen.generateTechCompanyName();
}

String getPhoneNumber(){
  return HumanGen.generatePhoneNumber();
}