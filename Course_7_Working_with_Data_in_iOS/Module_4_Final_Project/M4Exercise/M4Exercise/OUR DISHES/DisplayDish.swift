//
// DisplayDish.swift



import SwiftUI


struct DisplayDish: View {
    @ObservedObject private var dish:Dish
    init(_ dish:Dish) {
        self.dish = dish
    }
     /*
      The name and the price must be side by side.

      The name must be pushed all the way to the left and the price all the way to the right.

      The price must use the font callout and be monospaced.
      */
    
    var body: some View {
        HStack {
            Text(dish.name ?? "")
                .padding([.top, .bottom], 7)
            
            Spacer()
            
            Text(dish.formatPrice())
                .monospaced()
                .font(.callout)
        }
        .contentShape(Rectangle()) // keep this code
    }
}

struct DisplayDish_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    let dish = Dish(context: context)
    static var previews: some View {
        DisplayDish(oneDish())
    }
    static func oneDish() -> Dish {
        let dish = Dish(context: context)
        dish.name = "Hummus"
        dish.price = 10
        dish.size = "Extra Large"
        return dish
    }
}

