import SwiftUI

struct CategoryRowView: View {
    
    let category: Category
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color(hex: category.colorHex))
                .font(.system(size: 20))
                .overlay(Text("\(category.name.first!.uppercased())"))
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding(.trailing, 10)
                .shadow(radius: 5)
                .padding(.trailing, 10)
                .frame(width: 30, height: 30)
            
            
            Text(category.name)
            
            Spacer()
        }
        .padding(.horizontal, 5)
        .padding(.vertical, 0)
    }
}

#Preview {
    
    let cat = Category(name: "Test", colorHex: "#FF0000")
    CategoryRowView(category: cat)
}
