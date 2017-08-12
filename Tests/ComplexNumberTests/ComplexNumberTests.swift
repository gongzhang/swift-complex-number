import XCTest
@testable import ComplexNumber 

class ComplexNumberTests: XCTestCase {
    func testGlobalImaginaryUnit() {
        XCTAssertEqual(𝒊.power(2), Complex(real: -1))
    }

    func testDefinitionWithGlobalImaginaryUnit() {
        let c = 3 + 2 * 𝒊

        XCTAssertEqual(c.real, 3)
        XCTAssertEqual(c.imaginary, 2)
    }

    func testRealGetter() {
        let c = Complex(3, 2)

        XCTAssertEqual(c.real, 3)
    }

    func testImaginaryGetter() {
        let c = Complex(3, 2)

        XCTAssertEqual(c.imaginary, 2)
    }

    func testSubscripts() {
        let c = Complex(3, 2)

        XCTAssertEqual(c[0], c.real)
        XCTAssertEqual(c[1], c.imaginary)
    }

    func testElementaryOperations() {
        let c1 = Complex(3, 2)
        let c2 = Complex(1, -4)

        XCTAssertEqual(c1 + c2, Complex(4, -2))
        XCTAssertEqual(c1 - c2, Complex(2, 6))
        XCTAssertEqual(c1 * c2, Complex(11, -10))
    }

    func testDivision() {
        let c1 = Complex(3, 2)
        let c2 = Complex(4, -3)

        XCTAssertEqualWithAccuracy((c1 / c2).real, (6 / 25), accuracy: Double.ulpOfOne)
        XCTAssertEqualWithAccuracy((c1 / c2).imaginary, (17 / 25), accuracy: Double.ulpOfOne)
    }

    func testPolarForm() {
        let c = Complex(2, -6)

        XCTAssertEqualWithAccuracy(c.radiusSquare, 40, accuracy: Double.ulpOfOne)
        XCTAssertEqualWithAccuracy(c.radius, 6.32455532, accuracy: 0.00000001)
        XCTAssertEqualWithAccuracy(c.arg, -1.24904577, accuracy: 0.00000001)
    }

    func testAngleDefinition() {
        let arg = Double.pi

        XCTAssertEqualWithAccuracy((∠arg).real, -1, accuracy: Double.ulpOfOne)
        XCTAssertEqualWithAccuracy((∠arg).imaginary, 0, accuracy: Double.ulpOfOne)

        let c1 = (∠arg) * 10.0
        let c2 = Complex(-1, 0) * 10.0

        XCTAssertEqualWithAccuracy(c1.real, c2.real, accuracy: Double.ulpOfOne)

        // Accuracy diminished because sin(pi) doesn't precisely == 0 in ∠arg
        XCTAssertEqualWithAccuracy(c1.imaginary, c2.imaginary, accuracy: Double.ulpOfOne * 10)
    }

    static var allTests = [
        ("testGlobalImaginaryUnit", testGlobalImaginaryUnit),
        ("testDefinitionWithGlobalImaginaryUnit", testDefinitionWithGlobalImaginaryUnit),
        ("testRealGetter", testRealGetter),
        ("testImaginaryGetter", testImaginaryGetter),
        ("testSubscripts", testSubscripts),
        ("testElementaryOperations", testElementaryOperations),
        ("testDivision", testDivision),
        ("testPolarForm", testPolarForm),
        ("testAngleDefinition", testAngleDefinition),
    ]
}
