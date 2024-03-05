import 'package:intl/intl.dart';

class StringManager {
  static const String notFound = "Not Found Screen";
  static const String appName = "Bambino";
  static const String motherAndBabyCare = "MOTHER & BABY CARE";
  static const String dateTimeReminder = "Date and Time and reminder";
  static const String weight = "Weight";
  static const String daysToGo = "days to go!";
  static const String length = "Length";
  static const String kMood = "Mood";
  static const String mybabyislike = "My baby is like";
  static const String isYourBaby = "Is your baby";
  static const String alreadyBorn = "already born?";
  static const String isYourBabyBorn = "Is your baby already born?";
  static const String kMoodsBox = "moods box";
  static const String kMedication = "Medication";
  static const String kMedicationsBox = "medications box";
  static const String kEventsBox = "events box";
  static const String kDoctorAppointment = "Doctor Appointment";
  static const String kDoctorAppointmentsBox = "doctorAppointments box";
  static const String kNote = "Note";
  static const String kNotesBox = "notes box";
  static const String kBasicKey = "basic_channel";
  static const String trySuperPower = "Try Super Power";
  static const String daysFree = "7 days free";
  static const String unlockForAccess = "Unlock for full access";
  static const String supportPregnancy = "Support your pregnancy";
  static const String removeAds = "Remove all ads";
  static const String analysisBabCry = "Analysis baby’s cry";
  static const String oneMonth = "1 Month";
  static const String oneMonthPrice = "EGP 69.99";
  static const String wholePregnancy = "For the whole pregnancy";
  static const String wholePregnancyPrice = "EGP 324.99";
  static const String threeMonth = "3 Months";
  static const String threeMonthPrice = "EGP 149.99";
  static const String tryFreeSubsribe = "Try 7 days free and subsribe";
  static const String popular = "Popular";
  static const String setting = "Setting";
  static const String security = "Security";
  static const String notification = "Notification";
  static const String privacy = "Privacy";
  static const String termsAndPolicies = "Terms & Policies";
  static const String saved = "Saved";
  static const String other = "Other";
  static const String premium = "Premium";
  static const String aboutApp = "About app";
  static const String rateApp = "Rate app";
  static const String share = "Share";
  static const String contactUs = "Contact us";
  static const String logOut = "Log out";
  static const String areYouLogOut = "Are you sure you want to log out?";
  static const String rateUs = "Rate us";
  static const String doYouLikeTheApp = "Do you like the app?";
  static const String editProfile = "Edit Profile";
  static const String selectImageFrom = "Select Image From :";
  static const String noImageSelected = "No Image Selected";
  static const String name = "Name";
  static const String email = "Email";
  static const String phoneNumber = "Phone number";
  static const String changePassword = "Change password";
  static const String dueDate = "Due date";
  static const String dateFormat = "MM/DD/YYYY";
  static const String saveChanges = "Save changes";
  static const String currentPassword = "Current password";
  static const String newPassword = "New password";
  static const String confirmPassword = "Confirm password";

  String getCurrentFormattedDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy HH:mm').format(now);
    return formattedDate;
  }

  String getCurrentTrimester(int currentWeek) {
    String currentTrimester = "";

    if (currentWeek >= 1 && currentWeek <= 13) {
      currentTrimester = "1ST TRIMESTER";
    } else if (currentWeek >= 14 && currentWeek <= 27) {
      currentTrimester = "2ND TRIMESTER";
    } else if (currentWeek >= 28 && currentWeek <= 40) {
      currentTrimester = "3RD TRIMESTER";
    } else {
      currentTrimester = "";
    }

    return currentTrimester;
  }

  static const List<String> typeMedication = [
    "Pills",
    "Capsule",
    "Drops",
    "Injection",
    "Syrup",
    "Ointment",
    "Gel",
    "Cream",
    "Spray",
    "Aerosol"
  ];
  static const List<String> dietMedication = [
    "Does not depend on food",
    "Before Eating",
    "While eating",
    "After meal"
  ];
  static const List<String> moodList = [
    'happy',
    'Good',
    'Tearful',
    'Energetic',
    'Optimistic',
    'Gloomy',
    'Depressive',
    'Lazy',
    'Upset',
    'Angry',
    'Decisive',
    'Lonely',
    'Terrible',
    'Joyful',
    'Enthusiastic',
    'Stressful',
    'Sad',
    'In love',
    'Dissatisfied',
    'Scared'
  ];
}
