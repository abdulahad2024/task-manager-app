class AppString {
  // Common / Navigation Strings
  static const String skip = 'Skip';
  static const String next = 'Next';
  static const String continueText = 'Continue';
  static const String or = 'OR';
  static const String confirm = 'Confirm';
  static const String cancel = 'Cancel';
  static const String ok = 'OK';
  static const String send = 'Send';
  static const String sendOtp = 'Send OTP';

  // --- Profile Screen Strings (Added) ---
  static const String myProfile = 'My Profile';
  static const String accountSetting = 'Account Setting';
  static const String moreSection = 'More';
  static const String termsAndCondition = 'Terms & Condition';
  static const String privacyPolicy = 'Privacy policy';
  static const String helpSupport = 'Help/Support';
  static const String logOut = 'Log Out';

  // Onboarding Strings
  static const String onboardingTitle1 = 'Manage Everything in One Place';
  static const String onboardingSubtitle1 =
      'Create, categorize, and keep track of all your personal and work tasks effortlessly — right from your dashboard.';

  static const String onboardingTitle2 = 'Focus on What Matters Most';
  static const String onboardingSubtitle2 =
      'Set priorities, add deadlines, and sort tasks by importance so you can tackle what truly moves you forward.';

  static const String onboardingTitle3 = 'Visualize Progress, Stay on Track';
  static const String onboardingSubtitle3 =
      'Monitor completed tasks, ongoing projects, and upcoming deadlines — all in a clear, visual format.';

  // --- Auth Screens (Log In, Sign Up, Verify, New Password) ---

  // Log In Screen
  static const String loginTitle = 'Welcome Back!';
  static const String loginSubtitle = 'Stay productive and take control of your tasks.';
  static const String emailAddress = 'Email Address';
  static const String password = 'Password';
  static const String rememberMe = 'Remember me';
  static const String dontHaveAccount = "Don't have an account? ";
  static const String signUpLink = 'Sign Up';
  static const String loginButton = 'Log In';

  // Sign Up Screen
  static const String signupTitle = 'Create Your Account';
  static const String signupSubtitle = 'Join Task Manager today — organize better, work smarter, and stay in control of your day.';
  static const String firstName = 'First Name';
  static const String lastName = 'Last Name';
  static const String address = 'Address';
  static const String confirmPassword = 'Confirm Password';
  static const String termsAgreement = 'I agree to the Terms & Conditions and Privacy Policy.';
  static const String signupButton = 'Sign Up';
  static const String alreadyHaveAccount = 'Already have an account?';

  // Verify Your Email / Send OTP Screens
  static const String verifyEmailTitle = 'Verify Your Email';
  static const String verifyEmailSubtitle = "We'll send a verification code to this email to confirm your account.";

  // Verify Your OTP Screen
  static const String verifyOtpTitle = '6-digit code';
  static const String verifyOtpSubtitle = 'Please enter the code we\'ve sent to';

  // Set Your New Password Screen
  static const String setNewPasswordTitle = 'Set Your New Password';
  static const String setNewPasswordSubtitle = 'Create a secure password to protect your account and get started seamlessly!';
  static const String newPassword = 'New Password';
  static const String newConfirmPassword = 'New Confirm Password';

  // --- Bottom Navigation Bar ---
  static const String navMyTasks = 'My Tasks';
  static const String navAddTask = 'Add Task';
  static const String navProfile = 'Profile';

  // --- Dialogs, Toasters & Alerts ---

  // Update Password Dialog/Toster
  static const String warningTitle = 'Warning';
  static const String updatePasswordWarning = 'Are you sure to Update Password?';
  static const String successTitle = 'Success';
  static const String updatePasswordSuccess = 'Your password has been updated successfully.';

  // Delete Account Dialog/Toster
  static const String deleteAccountWarning = 'Are you sure you want to permanently delete your account? This action cannot be undone.';

  // Log Out Dialog/Toster
  static const String logoutWarning = 'Are you sure you want to log out of your account?';
  static const String logoutSuccess = 'You have been logged out successfully.';

  // Update Profile Dialog/Toster
  static const String updateProfileWarning = 'Are you sure you want to update your profile information?';

  // Placeholders / Hints
  static const String hintEmail = 'e.g. michelle.rivera@example.com';
  static const String hintFirstName = 'e.g. Kristin';
  static const String hintLastName = 'e.g. Cooper';
  static const String hintAddress = 'e.g. 1234 Elm Street, Springfield, IL';
  static const String hintPassword = '••••••••';











  // ── Terms & Conditions Strings ──
  static const String termsTitle = "Terms & Conditions";
  static const String termsWelcome = "Welcome to the Task Manager App. By accessing or using this application, you agree to the following terms and conditions:";

  static const String term1Title = "1. Use of the App";
  static const String term1Desc = "This app is designed to help users create, manage, and track personal or professional tasks efficiently. By using the app, you agree to use it responsibly and only for lawful purposes.";

  static const String term2Title = "2. Accuracy of Information";
  static const String term2Desc = "All tasks, notes, and other information entered by the user are stored securely. While we strive to maintain accurate task management functionality, the app is not responsible for missed deadlines, incorrect entries, or user-generated errors.";

  static const String term3Title = "3. User Responsibility";
  static const String term3Desc = "Users are solely responsible for managing their tasks, reminders, and any personal or professional outcomes related to the completion or non-completion of tasks created within the app.";

  static const String term4Title = "4. Data Collection";
  static const String term4Desc = "We respect your privacy. The Task Manager App may collect limited personal data (such as name, email, and usage patterns) solely for improving user experience. No data is shared with third parties without user consent.";

  static const String term5Title = "5. Limitation of Liability";
  static const String term5Desc = "We are not liable for any loss of productivity, missed deadlines, or damages resulting from your use of the app. The app is a productivity tool and should be used at your discretion.";

  static const String term6Title = "6. Third-Party Links";
  static const String term6Desc = "If the app connects to any third-party tools (e.g., calendar, email), we are not responsible for their data policies or service availability. Use of such services is subject to their respective terms.";

  static const String term7Title = "7. Changes to Terms";
  static const String term7Desc = "We reserve the right to update these Terms & Conditions at any time. Continued use of the app following any changes will constitute your acceptance of those revised terms.";






  static const String privacyTitle = "Privacy Policy";
  static const String privacySubtitle = "Your privacy is important to us. This Privacy Policy outlines how the Task Manager App handles your information and protects your data.";

  static const List<Map<String, String>> privacyList = [
    {
      "title": "1. Information Collection",
      "desc": "The Task Manager App may collect limited information such as your name, email address, and preferences — strictly for the purpose of enhancing your task management experience. We do not collect sensitive personal information unnecessarily."
    },
    {
      "title": "2. Local Storage",
      "desc": "Your tasks, subtasks, and user preferences are securely stored in our system or locally on your device (depending on platform settings). This data is used solely to support the app's features like scheduling, notifications, and user customization."
    },
    {
      "title": "3. No Tracking",
      "desc": "We do not use third-party trackers or intrusive analytics tools to monitor your behavior. Any performance monitoring is strictly anonymized and used internally to improve the app experience."
    },
    {
      "title": "4. Static Data Display",
      "desc": "If the app integrates with external tools (e.g., calendar, cloud storage), those services are governed by their own privacy policies. We do not control or assume responsibility for their data handling practices."
    },
    {
      "title": "5. Third-Party Services",
      "desc": "We implement industry-standard measures to ensure your information is protected from unauthorized access, alteration, or misuse. This includes encryption, secure servers, and routine maintenance."
    },
    {
      "title": "6. Data Security",
      "desc": "You retain full control over your account data. You can delete or export your tasks and personal information at any time through your profile settings (if applicable)."
    },
    {
      "title": "7. Policy Updates",
      "desc": "This Privacy Policy may be updated periodically. Any changes will be clearly communicated within the app. Continued use after updates indicates your acceptance of the revised policy."
    },
  ];

  static const String privacyContactText = "If you have any questions or concerns regarding privacy, please contact us at support@taskmanagerapp.com.";






// ── FAQs Strings ──
  static const String faqTitle = "FAQs";
  static const String faqSubtitle = "Find answers to common questions about using the Task Manager App.";

  static const List<Map<String, String>> faqList = [
    {
      "question": "How do I create a new task?",
      "answer": "Tap the \"Add Task\" button on the navigation bar. Fill in the task title, due date, priority, and other details — then tap \"Save\"."
    },
    {
      "question": "How can I view task details?",
      "answer": "Tap on any task card from your home or task list screen to view its full details, notes, and progress."
    },
    {
      "question": "Can I mark a task as favorite or important?",
      "answer": "Yes, you can mark tasks as important or add them to your favorites by tapping the star or flag icon on the task item."
    },
    {
      "question": "How do I edit or delete a task?",
      "answer": "Open the task details view, where you will find dedicated options to edit your task information or delete the task permanently."
    },
    {
      "question": "Is my data secure?",
      "answer": "Yes! Your tasks, notes, and preferences are securely stored locally or on protected servers, ensuring complete privacy and safety."
    },
  ];

  static const String faqHelpTitle = "Need More Help?";
  static const String faqHelpContact = "Mail Us: (support@taskmanagerapp.com)\nOur help desk is available 24/7 to support your workflow.";
}







