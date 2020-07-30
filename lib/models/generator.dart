import 'dart:math';
import 'package:layout_samples/models/friend.dart';
import 'package:layout_samples/models/lead.dart';
import 'package:layout_samples/models/seller.dart';
import 'package:layout_samples/models/user.dart';
import 'package:ultimate_data_generator/ultimate_data_generator.dart';

final random = new Random();
final getSmallNumber = () => random.nextInt(5 - 2) + 1;

class UserGen {
  Friend generateFriend() {
    var baseUser = getRandomUser();
    var sellers = generateSellers(getSmallNumber());
    var recentActions = getRecentAction();

    return Friend.fromUser(baseUser, sellers, recentActions);
  }

  List<Friend> generateFriends(int length) {
    var friends = List<Friend>();
    for(int i = 0; i < length; i++){
      friends.add(generateFriend());
    }

    return friends;
  }

  Lead generateLead() {
    var baseUser = getRandomUser();
    var phoneNumber = getPhoneNumber();
    var referrer = generateFriend();
    var businessName = getBusinessName();

    return Lead.fromUser(baseUser, phoneNumber, referrer, businessName);

  }

  List<Lead> generateLeads(int length) {
    var leads = List<Lead>();
    for(int i = 0; i < length; i++){
      leads.add(generateLead());
    }

    return leads;
  }

  Seller generateSeller() {
    var baseUser = getRandomUser();
    var businessName = getBusinessName();

    return Seller.fromUser(baseUser, businessName);

  }

  List<Seller> generateSellers(int length) {
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
    var fullName = HumanGen.generateABoyFullname();
    var profilePic = HumanGen.generateAdultMaleImage();

    return new User(fullName, profilePic);
  }
}

User getRandomUser(){
  var randomUsers = {MaleUser(), FemaleUser()} as List<RandomUserInterface>;
  int i = new Random().nextInt(randomUsers.length);

  return randomUsers[i].getUser();
}

String getRecentAction(){
  var recentActions = [
    "Added $getSmallNumber leads",
    "$getSmallNumber new messages",
    "Just signed up",
    "Just got paid"
  ];

  var randomIndex = random.nextInt(recentActions.length);
  return recentActions[randomIndex];
}

String getBusinessName(){
  return IndustryGen.generateTechCompanyName();
}

String getPhoneNumber(){
  return HumanGen.generatePhoneNumber();
}