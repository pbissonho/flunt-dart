import 'package:flunt_dart/src/brasil_extension/br_validator.dart';
import 'package:test/test.dart';

void main() {
  test("CpfValidator", () {
    CpfValidator validator = CpfValidator();

    expect(true, validator.validate("529.982.247-25"));
    expect(false, validator.validate("189.GGG.397.26"));
    expect(false, validator.validate("189.GGG.397."));
    expect(false, validator.validate("189.GGG.397."));
    expect(false, validator.validate("189.dsada.397.26"));
    expect(false, validator.validate("189.dsada.397.28"));
    expect(false, validator.validate("111.111.111.11"));
    expect(false, validator.validate("999.999.999.99"));
  });
  test("CepValidator", () {
    CepValidator validator = CepValidator();

    expect(true, validator.validate("20835-150"));
    expect(true, validator.validate("20835150"));
    expect(false, validator.validate("20835-15508"));
    expect(false, validator.validate("20t3r15508"));
    expect(false, validator.validate("2083515"));
  });

  test("CpnjValidator", () {
    CnpjValidator validator = CnpjValidator();

    expect(true, validator.validate("13.347.016/0001-17"));
    expect(true, validator.validate("97928570000188"));
    expect(false, validator.validate("9792857000018"));
    expect(false, validator.validate("979285700001888"));
    expect(false, validator.validate("979fds28570gf0001888"));
  });
  /*
  test("BrPhoneValidator", () {
    BrPhoneValidator validator = BrPhoneValidator();

    expect(true, validator.validate("22999224589"));
    expect(true, validator.validate("(22)99922-4589"));
    expect(true, validator.validate("2299922-4589"));
    expect(true, validator.validate("(22)999224589"));
    expect(false, validator.validate("(22)9992245899"));
    expect(false, validator.validate("(22)9992245899555"));
    expect(false, validator.validate("(22)9992"));
    expect(false, validator.validate("2299922458"));
  });
  */
}
