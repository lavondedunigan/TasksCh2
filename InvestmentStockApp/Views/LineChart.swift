import SwiftUI

struct LineChart: Shape {
    var data: [CGFloat]
    

    func path(in rect: CGRect) -> Path {
        // Guard against not enough points
        guard data.count >= 2 else { return Path() }

        // Convert a data index to a point in the rect
        func convertToPoint(index: Int) -> CGPoint {
            let value = data[index]
            // Spread points evenly across the width from 0 to rect.width
            let stepX = rect.width / CGFloat(max(data.count - 1, 1))
            let x = CGFloat(index) * stepX
            // Assuming data is normalized [0, 1]
            let y = (1 - value) * rect.height
            return CGPoint(x: x, y: y)
        }

        var path = Path()
        // Move to first point
        path.move(to: convertToPoint(index: 0))
        // Draw lines through remaining points
        for index in 1..<data.count {
            path.addLine(to: convertToPoint(index: index))
        }
        return path
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        let sampleData: [CGFloat] = [0.05, 0.2, 0.4, 0.15, 0.6, 0.8, 0.7, 0.9, 0.65, 1.0]
        return LineChart(data: sampleData)
            .stroke(Color.green)
            .frame(width: 400, height: 500)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
