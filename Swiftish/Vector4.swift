/*
 The MIT License (MIT)
 
 Copyright (c) 2016 Justin Kolb
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

public struct Vector4<T: Vectorable> : Equatable, CustomStringConvertible {
    public var x: T
    public var y: T
    public var z: T
    public var w: T
    
    public init() {
        self.init(T.zero, T.zero, T.zero, T.zero)
    }
    
    public init(_ v: T) {
        self.init(v, v, v, v)
    }
    
    public init(_ x: T, _ y: T, _ z: T, _ w: T) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }
    
    public var components: [T] {
        get {
            return [x, y, z, w]
        }
        
        set {
            precondition(newValue.count == 4)
            x = newValue[0]
            y = newValue[1]
            z = newValue[2]
            w = newValue[3]
        }
    }
    
    public subscript(index: Int) -> T {
        get {
            switch index {
            case 0:
                return x
            case 1:
                return y
            case 2:
                return z
            case 3:
                return w
            default:
                fatalError("Index out of range")
            }
        }
        
        set {
            switch index {
            case 0:
                x = newValue
            case 1:
                y = newValue
            case 2:
                z = newValue
            case 3:
                w = newValue
            default:
                fatalError("Index out of range")
            }
        }
    }
    
    public var description: String {
        return "{\(x), \(y), \(z), \(w)}"
    }
}

// MARK: - Equatable

public func ==<T: Vectorable>(va: Vector4<T>, _ vb: Vector4<T>) -> Bool {
    return va.x == vb.x && va.y == vb.y && va.z == vb.z && va.w == vb.w
}

// MARK: - Addition

public func +<T: Vectorable>(a: Vector4<T>, b: T) -> Vector4<T> {
    let x: T = a.x + b
    let y: T = a.y + b
    let z: T = a.z + b
    let w: T = a.w + b
    
    return Vector4<T>(x, y, z, w)
}

public func +<T: Vectorable>(a: T, b: Vector4<T>) -> Vector4<T> {
    let x: T = a + b.x
    let y: T = a + b.y
    let z: T = a + b.z
    let w: T = a + b.w
    
    return Vector4<T>(x, y, z, w)
}

public func +<T: Vectorable>(a: Vector4<T>, b: Vector4<T>) -> Vector4<T> {
    let x: T = a.x + b.x
    let y: T = a.y + b.y
    let z: T = a.z + b.z
    let w: T = a.w + b.w
    
    return Vector4<T>(x, y, z, w)
}

// MARK: - Subtraction

public func -<T: Vectorable>(a: Vector4<T>, b: T) -> Vector4<T> {
    let x: T = a.x - b
    let y: T = a.y - b
    let z: T = a.z - b
    let w: T = a.w - b
    
    return Vector4<T>(x, y, z, w)
}

public func -<T: Vectorable>(a: T, b: Vector4<T>) -> Vector4<T> {
    let x: T = a - b.x
    let y: T = a - b.y
    let z: T = a - b.z
    let w: T = a - b.w
    
    return Vector4<T>(x, y, z, w)
}

public func -<T: Vectorable>(a: Vector4<T>, b: Vector4<T>) -> Vector4<T> {
    let x: T = a.x - b.x
    let y: T = a.y - b.y
    let z: T = a.z - b.z
    let w: T = a.w - b.w
    
    return Vector4<T>(x, y, z, w)
}

// MARK: - Multiplication

public func *<T: Vectorable>(a: Vector4<T>, b: T) -> Vector4<T> {
    return Vector4<T>(
        a.x * b,
        a.y * b,
        a.z * b,
        a.w * b
    )
}

public func *<T: Vectorable>(a: T, b: Vector4<T>) -> Vector4<T> {
    let x: T = a * b.x
    let y: T = a * b.y
    let z: T = a * b.z
    let w: T = a * b.w
    
    return Vector4<T>(x, y, z, w)
}

public func *<T: Vectorable>(a: Vector4<T>, b: Vector4<T>) -> Vector4<T> {
    let x: T = a.x * b.x
    let y: T = a.y * b.y
    let z: T = a.z * b.z
    let w: T = a.w * b.w
    
    return Vector4<T>(x, y, z, w)
}

// MARK: - Division

public func /<T: Vectorable>(a: Vector4<T>, b: T) -> Vector4<T> {
    let x: T = a.x / b
    let y: T = a.y / b
    let z: T = a.z / b
    let w: T = a.w / b
    
    return Vector4<T>(x, y, z, w)
}

public func /<T: Vectorable>(a: T, b: Vector4<T>) -> Vector4<T> {
    let x: T = a / b.x
    let y: T = a / b.y
    let z: T = a / b.z
    let w: T = a / b.w
    
    return Vector4<T>(x, y, z, w)
}

public func /<T: Vectorable>(a: Vector4<T>, b: Vector4<T>) -> Vector4<T> {
    let x: T = a.x / b.x
    let y: T = a.y / b.y
    let z: T = a.z / b.z
    let w: T = a.w / b.w
    
    return Vector4<T>(x, y, z, w)
}

// MARK: - Negation

public prefix func -<T: SignedVectorable>(v: Vector4<T>) -> Vector4<T> {
    let x: T = -v.x
    let y: T = -v.y
    let z: T = -v.z
    let w: T = -v.w
    
    return Vector4<T>(x, y, z, w)
}

public prefix func +<T: SignedVectorable>(v: Vector4<T>) -> Vector4<T> {
    let x: T = +v.x
    let y: T = +v.y
    let z: T = +v.z
    let w: T = +v.w
    
    return Vector4<T>(x, y, z, w)
}

// MARK: - Sum

public func sum<T: Vectorable>(_ vector: Vector4<T>) -> T {
    return vector.x + vector.y + vector.z + vector.w
}

// MARK: - Geometric

public func length<T: FloatingPointVectorable>(_ vector: Vector4<T>) -> T {
    return length2(vector).squareRoot()
}

public func length2<T: Vectorable>(_ vector: Vector4<T>) -> T {
    return sum(vector * vector)
}

public func normalize<T: FloatingPointVectorable>(_ vector: Vector4<T>) -> Vector4<T> {
    return vector / length(vector)
}

public func distance<T: FloatingPointVectorable>(_ va: Vector4<T>, _ vb: Vector4<T>) -> T {
    return distance2(va, vb).squareRoot()
}

public func distance2<T: Vectorable>(_ va: Vector4<T>, _ vb: Vector4<T>) -> T {
    let difference: Vector4<T> = vb - va
    let difference2: Vector4<T> = difference * difference
    
    return sum(difference2)
}

public func dot<T: Vectorable>(_ va: Vector4<T>, _ vb: Vector4<T>) -> T {
    return sum(va * vb)
}