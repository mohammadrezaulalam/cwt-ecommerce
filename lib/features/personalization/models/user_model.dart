
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tecom/utils/formatters/formatter.dart';

/// Model class representing user data.
class UserModel{
  // keep those values final which you do not want to update.
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor for UserModel
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
});

  /// Helper function to get the full name.
  String get fullName => '$firstName $lastName';

  /// Static function to format phone number.
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name into first & last name.
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// Helper function to generate a username from the full name.
  static String generateUserName(fullName){
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName"; // Combine first & last name.
    String usernameWithPrefix = "th_$camelCaseUsername"; // Add th_ as prefix.
    return usernameWithPrefix;
  }

  /// Static function to create an empty user model.
  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', userName: '', email: '', phoneNumber: '', profilePicture: '');

  /// Convert Model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// Factory method to create a UserModel from Firebase document snapshot.
  // factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
  //   if(document.data() != null){
  //     final data = document.data()!;
  //     return UserModel(
  //         id: document.id,
  //         firstName: data['FirstName'] ?? '',
  //         lastName: data['LastName'] ?? '',
  //         userName: data['UserName'] ?? '',
  //         email: data['email'] ?? '',
  //         phoneNumber: data['PhoneNumber'] ?? '',
  //         profilePicture: data['ProfilePicture'] ?? '',
  //     );
  //   }
  // }




}