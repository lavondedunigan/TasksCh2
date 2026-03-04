import UIKit
import SwiftUI

extension Color {
    public static var darkBlue: Color {
        return Color(UIColor(red: 3/255, green: 49/255,  blue: 75/255, alpha: 1.0))
    }
    
    public static var lightGrreen: Color {
        return Color(UIColor(red: 102/255, green: 204/255,  blue: 235/255, alpha: 1.0))
    }
}


extension Array where Element == CGFloat {
    
    var normalized: [CGFloat] {
        if let min = self.min(), let max = self.max() {
            return self.map { ($0 - min) / (max - min) }
        }
        
        return []
    }
    
}
