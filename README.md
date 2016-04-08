# SUMMARY

`Complex` is an elegant and efficient complex number datatype for Swift. 

# EXAMPLE

First of all, the library defines a global variable `𝒊`, which is the *imaginary unit*.

```swift
// note that "𝒊" is an unicode char, not the acsii "i"
print(𝒊) // prints 1.0𝒊

// satisfies the equation:
print(𝒊 ^ 2 == -1) // prints true
```

With imaginary unit `𝒊`, you can do complex number in Swift like magic:

```swift
let c1 = 3 + 2 * 𝒊  // 3 + 2𝒊
let c2 = 1 - 4 * 𝒊  // 1 - 4𝒊

print(c1 * c2 - (2 - 4 * 𝒊)) // prints 9.0-6.0𝒊
```

# INSTALLATION

Copy `Complex.swift` and `ComplexOperator.swift` (optional) to your project. And done.

You can try `ComplexNumber.playground` in Xcode. The source files are located in `ComplexNumber.playground/Sources/` folder.

# HOW TO USE

## 1. Understand the datatype

`Complex` is a Swift struct which presents complex number in math. Basically the definition is going like this:

```swift
struct Complex {
    var real: Double
    var imaginary: Double
}
```

Very simple and straight foward. Good.

## 2. Define a complex number

Use constructor:

```swift
let c = Complex(1, -4)  // 1 - 4𝒊
```

Or, do the same thing with imaginary unit `𝒊`:

```swift
let c = 1 - 4 * 𝒊       // 1 - 4𝒊
```

Behind the scene, the definition of `𝒊` just is:

```swift
public let 𝒊 = Complex(0, 1)
```

## 3. Retrieve *real part* and *imaginary part*

```swift
// use property
c.real
c.imaginary

// or use subscript
c[0]  // same with "c.real"
c[1]  // same with "c.imaginary"
```

## 4. Elementary operations

`Complex` supports `+`, `-`, `*`, `/`, and `^` operations with both `Complex` and pure real number (`Double`).

```swift
// assume we have four complex numbers...
var c1: Complex, c2: Complex, c3: Complex, c4: Complex

// then you can do
let result = (c1 + c2 ^ 2) * (c3 - 1) / c4
```

If you do not use custom operators, you can just use methods instead:

```swift
let result = c1.add(c2.power(2)).multiply(c3.subtract(1)).divide(c4)
```

There are also mutating operators and methods:

```swift
c1 += c2           // c1 is modified
c1.addInPlace(c2)  // c1 is modified
```

## 5. Polar form

In polar form, we use *r* and *φ* to presents a complex number, where *r* is *absolute value* (or *radius*) and *φ* is *argument*.

```swift
let c1 = 3 + 4 * 𝒊

// radius and argument are predefined properties
let r = c1.radius
let φ = c1.arg
```

Then you can present a complex number in polar form:

```swift
let c2 = r * (cos(φ) + sin(φ) * 𝒊) // c2 is 3 + 4𝒊, same with c1
```

We also support *angle notation* with `∠` operator:

```swift
let c3 = r ∠ φ    // c3 is 3 + 4𝒊 either, same with c1 and c2
```

# MORE DETAILS

## 1. Performance and accuracy

The implementation of `Complex` is straight forward. Therefore, the performance and accuracy are determined by `Double` datatype, which is used to implement `Complex`.

## 2. Double or Float?

`Double` is preferred in Swift. So `Complex` is implemented with `Double` by default.

However, if you are working with GPU, you may want to use `Float` instead `Double`, despite it is 32-bit and has lower accuracy. To do this, just replace all "Double" with "Float" in source files, then you have a float-version `Complex`.

# CONTACT

gong@me.com

# REFERENCES

https://en.wikipedia.org/wiki/Complex_number

