import 'package:flutter/material.dart';
import 'package:shoal_app/modules/loan/presenter/pages/mobile_verification.dart';
import 'package:shoal_app/modules/loan/presenter/pages/personal_detail.dart';
import 'package:shoal_app/modules/loan/presenter/pages/success.dart';
import 'package:shoal_app/modules/loan/presenter/pages/upload_document.dart';
import 'package:shoal_app/shared/widgets/navbar.dart';
import 'package:shoal_app/shared/widgets/step_card.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({super.key});

  @override
  State<LoanScreen> createState() {
    return _LoanScreenState();
  }
}

class _LoanScreenState extends State<LoanScreen> {
  int _activeStepIndex = 0;
  List<Step> stepList() => [
        Step(
          title: const Text(''),
          isActive: _activeStepIndex == 0,
          content: const MobileVerification(),
        ),
        Step(
          title: const Text(''),
          isActive: _activeStepIndex == 1,
          content: const PersonalDetails(),
        ),
        Step(
          title: const Text(''),
          isActive: _activeStepIndex == 2,
          content: const UploadDocument(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    Widget screen = Stepper(
      elevation: 0,
      currentStep: _activeStepIndex,
      type: StepperType.horizontal,
      physics: const ClampingScrollPhysics(),
      steps: stepList(),
      onStepTapped: (value) {
        if (_activeStepIndex == (stepList().length - 1)) return;
        setState(() {
          _activeStepIndex += 1;
        });
      },
      onStepCancel: () {
        if (_activeStepIndex == 0) return;
        setState(() {
          _activeStepIndex -= 1;
        });
      },
      onStepContinue: () {
        if (_activeStepIndex < (stepList().length - 1)) {
          setState(() {
            _activeStepIndex += 1;
          });
        }
      },
    );
    if (_activeStepIndex >= 3) {
      screen = const Success();
    }
    return Scaffold(
      appBar: const Navbar(
        title: 'Loan wizard',
      ),
      body: SafeArea(
        child: screen,
      ),
    );
  }
}
