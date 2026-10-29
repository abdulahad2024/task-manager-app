import 'package:flutter/material.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';

class CustomSnackBar {
  static void show(
      BuildContext context, {
        required String message,
        String? title, // অপশনাল টাইটেল (যেমন: "Success" বা "Error")
        bool isError = false,
      }) {
    // আগের কোনো স্নাকবার থাকলে তা সাথে সাথে হাইড করে দেবে
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            // স্ট্যাটাস অনুযায়ী আইকন
            Icon(
              isError ? Icons.error_outline_rounded : Icons.check_circle_outline_rounded,
              color: Colors.white,
              size: 26,
            ),
            const SizedBox(width: 12),
            // মেসেজ এবং টাইটেল অংশ
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) ...[
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                  Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: isError ? AppColor.errorColor : AppColor.successColor,
        behavior: SnackBarBehavior.floating, // ফ্লোটিং স্টাইল
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // আরেকটু স্মুথ রাউন্ডেড কর্নার
        ),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
        elevation: 6, // চমৎকার শ্যাডো ইফেক্ট
      ),
    );
  }
}