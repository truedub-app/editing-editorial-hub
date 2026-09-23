import '../data/database/app_database.dart';

class DutyValidationResult {
  DutyValidationResult({required this.errors, required this.isComplete});
  final List<String> errors;
  final bool isComplete;
  bool get isValid => errors.isEmpty;
}

/// Enforces spec section 7: exactly one in-charge + one QC2 per band, both
/// different people, both actually rostered (working) for that band.
class DutyValidationService {
  DutyValidationResult validate({
    required List<StaffData> rosteredWorking,
    required int? inChargeStaffId,
    required int? qc2StaffId,
    required String sectionLabel,
  }) {
    final errors = <String>[];
    final workingIds = rosteredWorking.map((s) => s.id).toSet();

    if (inChargeStaffId != null && !workingIds.contains(inChargeStaffId)) {
      errors.add('In-charge must be someone rostered and working the $sectionLabel band.');
    }
    if (qc2StaffId != null && !workingIds.contains(qc2StaffId)) {
      errors.add('QC 2 duty holder must be someone rostered and working the $sectionLabel band.');
    }
    if (inChargeStaffId != null && qc2StaffId != null && inChargeStaffId == qc2StaffId) {
      errors.add('In-charge and QC 2 duty must be different people.');
    }

    final isComplete = inChargeStaffId != null && qc2StaffId != null;
    return DutyValidationResult(errors: errors, isComplete: isComplete);
  }
}
