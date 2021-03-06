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

public struct Sphere<T: Vectorable> : Equatable, CustomStringConvertible {
    public let center: Vector3<T>
    public let radius: T
    
    public init() {
        self.init(center: Vector3<T>(), radius: T.zero)
    }
    
    public init(center: Vector3<T>, radius: T) {
        precondition(radius >= T.zero)
        self.center = center
        self.radius = radius
    }
    
    public var isNull: Bool {
        return center == Vector3<T>() && radius == T.zero
    }
    
    public var description: String {
        return "{\(center), \(radius)}"
    }
}

public func ==<T: Vectorable>(a: Sphere<T>, b: Sphere<T>) -> Bool {
    return a.center == b.center && a.radius == b.radius
}

public func boundsOf<T: SignedVectorable>(_ s: Sphere<T>) -> Bounds3<T> {
    return Bounds3<T>(center: s.center, extents: Vector3<T>(s.radius))
}

public func union<T: FloatingPointVectorable>(_ a: Sphere<T>, _ b: Sphere<T>) -> Sphere<T> {
    let midpoint = (a.center + b.center) / T.two
    let largestRadius = distance(midpoint, a.center) + max(a.radius, b.radius)
    
    return Sphere<T>(center: midpoint, radius: largestRadius)
}
