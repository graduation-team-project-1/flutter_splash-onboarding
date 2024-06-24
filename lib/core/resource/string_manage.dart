import 'package:intl/intl.dart';

class StringManager {
  static const String notFound = "Not Found Screen";
  static const String appName = "Bambino";
  static const String motherAndBabyCare = "MOTHER & BABY CARE";
  static const String welcomeBack = "Welcome Back!";
  static const String emailAddress = "Email Address";
  static const String emailAddressError = "Email Not Valid ";
  static const String password = "Password";
  static const String passwordError = "Password Not Valid ";
  static const String forgetPassword = "Forget Password?";
  static const String skip = "Skip";
  static const String login = "Log in";
  static const String or = "OR";
  static const String continueWithGoogle = "Continue with Google";
  static const String createAccount = "If you don’t have any account! ";
  static const String joinUs = "Join us!";
  static const String registerName = "Name";
  static const String registerNameError = "Name not Valid";
  static const String registerEmail = "Email";
  static const String alreadyHaveAcc = "I already have an Account";
  static const String signUp = "Sign up";
  static const String policy =
      "I’m agree to The Terms of Service and Privacy\nPolicy";

  static String sendCode = "Send Code";
  static const String dateTimeReminder = "Date and Time and reminder";
  static const String weight = "Weight";
  static const String daysToGo = "days to go!";
  static const String length = "Length";
  static const String kMood = "Mood";
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
  static const String dateFormat = "DD/MM/YYYY";
  static const String saveChanges = "Save changes";
  static const String currentPassword = "Current password";
  static const String newPassword = "New password";
  static const String confirmPassword = "Confirm password";
  static const String gestationalAge = "My gestational age";
  static const String atThisPoint = "At this point";
  static const String myBabyIsLike = "My baby is like";
  static const String passwordChangedSuccessfully =
      "Password changed successfully";
  static const String bearerToken =
      "93|0kVaOm9cxw54JsyhwW4DzfxYqsn9HoIFrR0DtH8dfb7db541";

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

  List<String> getListOfWeeks({required int month}) {
    switch (month) {
      case 1:
        return ["0", "1", "2", "3", "4"];
      case 2:
        return ["5", "6", "7", "8", "9"];
      case 3:
        return ["10", "11", "12", "13"];
      case 4:
        return ["14", "15", "16", "17", "18"];
      case 5:
        return ["19", "20", "21", "22", "23"];
      case 6:
        return ["24", "25", "26", "27"];
      case 7:
        return ["28", "29", "30", "31", "32"];
      case 8:
        return ["33", "34", "35", "36", "37"];
      case 9:
        return ["38", "39", "40"];
      default:
        return [];
    }
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
  String removeSpecialCharactersAndSpaces(String input) {
    return input.replaceAll(RegExp(r'\f|\r|\n| '), '');
  }

  String removeSpecialCharacters(String input) {
    return input.replaceAll(RegExp(r'\f|\r|\n|'), '');
  }

  String capitalizeFirstChar(String? input) {
    if (input == null || input.isEmpty) return "";
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  List<int?> calculatePregnancyDetails(String beginningDateStr) {
    // Parse the string to a DateTime object
    DateTime beginningDate = DateTime.parse(beginningDateStr);
    // Get the current date
    DateTime currentDate = DateTime.now();
    // Calculate the difference in days
    int daysPregnant = currentDate.difference(beginningDate).inDays;
    if (daysPregnant > 280) {
      return [280, 40, 9, 0, 0, 0];
    }
    if (daysPregnant < 7 && daysPregnant >= 0) {
      return [daysPregnant, 1, 1, 280 - daysPregnant, 40, 9];
    }
    // Calculate the current week of pregnancy
    int weeksPregnant = daysPregnant ~/ 7;
    // Calculate the current month of pregnancy more accurately
    int monthsPregnant = (currentDate.year - beginningDate.year) * 12 +
        currentDate.month -
        beginningDate.month;
    if (currentDate.day < beginningDate.day) {
      monthsPregnant--;
    }
    // Adjust months if days are more or less than 15
    int dayDifference = currentDate.day - beginningDate.day;
    if (dayDifference >= 15) {
      monthsPregnant++;
    } else if (dayDifference < -15) {
      monthsPregnant--;
    }
    // Calculate the due date
    DateTime dueDate = beginningDate.add(const Duration(days: 280));
    // Calculate the difference in days until the due date
    int daysToDueDate = dueDate.difference(currentDate).inDays;
    // Calculate the weeks to the due date
    int weeksToDueDate = daysToDueDate ~/ 7;
    // Calculate the months to the due date more accurately
    int monthsToDueDate = (dueDate.year - currentDate.year) * 12 +
        dueDate.month -
        currentDate.month;
    if (dueDate.day < currentDate.day) {
      monthsToDueDate--;
    }
    // Adjust months to due date if days are more or less than 15
    int dueDayDifference = dueDate.day - currentDate.day;
    if (dueDayDifference >= 15) {
      monthsToDueDate++;
    } else if (dueDayDifference < -15) {
      monthsToDueDate--;
    }
    return [
      daysPregnant,
      weeksPregnant,
      monthsPregnant,
      daysToDueDate,
      weeksToDueDate,
      monthsToDueDate
    ];
  }

  List<int?> calculateGestationalAge(String? beginningDateStr) {
    // Check if the input string is null or empty
    if (beginningDateStr == null || beginningDateStr.isEmpty) {
      return [null, null];
    }

    try {
      // Parse the string to a DateTime object
      DateTime beginningDate = DateTime.parse(beginningDateStr);
      // Get the current date
      DateTime currentDate = DateTime.now();
      // Calculate the difference in days
      int daysPregnant = currentDate.difference(beginningDate).inDays;

      // Check if days are more than 280
      if (daysPregnant > 280) {
        return [null, null];
      }

      // Calculate the weeks and days of pregnancy
      int weeksPregnant = daysPregnant ~/ 7;
      int daysPregnantRemainder = daysPregnant % 7;

      return [weeksPregnant, daysPregnantRemainder];
    } catch (e) {
      // Handle any exceptions that occur during date parsing
      print('Error parsing date: $e');
      return [null, null];
    }
  }

  String formatDueDate(String dueDate) {
    if (dueDate != '' && dueDate.isNotEmpty) {
      final DateTime parsedDate = DateTime.parse(dueDate);
      final DateFormat formatter = DateFormat('dd MMMM yyyy');
      return formatter.format(parsedDate);
    }
    return '';
  }

  String getCompletionMessage(int currentWeek) {
    String completionMessage = '';
    if (currentWeek >= 1 && currentWeek <= 13) {
      completionMessage =
          'Approximately ${(14 - currentWeek)} weeks left in the 1st trimester, Mommy!';
    } else if (currentWeek >= 14 && currentWeek <= 27) {
      completionMessage =
          'Approximately ${(27 - currentWeek)} weeks left in the 2nd trimester, Mommy!';
    } else if (currentWeek >= 28 && currentWeek <= 40) {
      completionMessage =
          'Approximately ${(40 - currentWeek)} weeks left in the 3rd trimester, Mommy!';
    } else {
      completionMessage = '';
    }

    return completionMessage;
  }
}
