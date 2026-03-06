import Foundation

enum Models {
    struct Quote: Decodable {
        let c: Double
        let d: Double
        let dp: Double
        let h: Double
        let l: Double
        let o: Double
        let pc: Double
        let t: Double
    }
}

// If you still want to refer to Quote directly within this file, uncomment the following line:
// typealias Quote = Models.Quote

