import 'package:editing_editorial_hub/data/database/app_database.dart';
import 'package:editing_editorial_hub/services/duty_validation_service.dart';
import 'package:flutter_test/flutter_test.dart';

StaffData _staff(int id, String name) => StaffData(
      id: id,
      fullName: name,
      initials: name.substring(0, 1),
      homeSection: 'Morning',
      inChargeEligible: true,
      qc2Eligible: true,
      active: true,
    );

/// Direct unit tests of the duty board's safety rule (spec section 7):
/// exactly one in-charge + one QC2 holder per band, both different people,
/// both actually rostered/working that band. Kept as a pure logic test
/// (no widget pump / drift streams involved) so it stays fast and reliable.
void main() {
  final service = DutyValidationService();
  final alice = _staff(1, 'Alice');
  final bob = _staff(2, 'Bob');
  final working = [alice, bob];

  test('incomplete when either role is unset', () {
    final result = service.validate(
      rosteredWorking: working,
      inChargeStaffId: alice.id,
      qc2StaffId: null,
      sectionLabel: 'Morning',
    );
    expect(result.isValid, isTrue);
    expect(result.isComplete, isFalse);
  });

  test('valid and complete once two different rostered people are set', () {
    final result = service.validate(
      rosteredWorking: working,
      inChargeStaffId: alice.id,
      qc2StaffId: bob.id,
      sectionLabel: 'Morning',
    );
    expect(result.isValid, isTrue);
    expect(result.isComplete, isTrue);
  });

  test('rejects the same person for both roles', () {
    final result = service.validate(
      rosteredWorking: working,
      inChargeStaffId: alice.id,
      qc2StaffId: alice.id,
      sectionLabel: 'Morning',
    );
    expect(result.isValid, isFalse);
    expect(result.errors, contains(contains('must be different people')));
  });

  test('rejects a person who is not rostered/working that band', () {
    final result = service.validate(
      rosteredWorking: [alice],
      inChargeStaffId: alice.id,
      qc2StaffId: bob.id,
      sectionLabel: 'Morning',
    );
    expect(result.isValid, isFalse);
    expect(result.errors, contains(contains('rostered and working the Morning band')));
  });
}
