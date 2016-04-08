import UIKit

// optional custom operators for Complex:
infix operator ^ { associativity left precedence 160 }
infix operator * { associativity left precedence 150 }
infix operator / { associativity left precedence 150 }
infix operator + { associativity left precedence 140 }
infix operator - { associativity left precedence 140 }

infix operator += { associativity right precedence 90 }
infix operator -= { associativity right precedence 90 }
infix operator *= { associativity right precedence 90 }
infix operator /= { associativity right precedence 90 }

prefix operator ∠ { }
infix operator ∠ { associativity left precedence 160 }

//
// NOTE:
// To see the source code of "Complex", press Command+1 and
// navigate to "Sources" folder.
//

// the global imaginary unit "𝒊"
𝒊 ^ 2 == -1

// define complex number with "𝒊"
let c1 = 3 + 2 * 𝒊
let c2 = 1 - 4 * 𝒊

// retrieve the real and imaginary part
c1.real
c1.imaginary

// or use subscript
c2[0]
c2[1]

// elementary operations
c1 + c2
c1 - c2
c1 * c2
c1 / c2

c1 * c2 - (2 - 4 * 𝒊)

// polar form
let r = c1.radius
let φ = c1.arg

r * (cos(φ) + sin(φ) * 𝒊)

// angle notation
r ∠ φ
