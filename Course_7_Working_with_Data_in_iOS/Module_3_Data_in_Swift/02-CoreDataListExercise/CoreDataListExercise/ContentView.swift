import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
   @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var desserts: FetchedResults<Dessert>
    
    var body: some View {
        NavigationView{
            VStack{
                Text("DESSERTS")
                    .font(.title)
                List {
                    ForEach(desserts) { dessert in
                        VStack(alignment:.leading){
                            Text (dessert.name!)
                                .font(.system(size: 16, weight: .bold))
                            
                            HStack{
                                Text (dessert.size!)
                                Spacer()
                                Text("$\(dessert.price, specifier: "%.2f")")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                            }
                        }
                    }
                }
            }
            .onAppear{createDesserts()}
        }
    }
    
    
    
    func createDesserts() {
        let profiterole = Dessert(context: viewContext)
        profiterole.name = "Profiterole"
        profiterole.size = "Large"
        profiterole.price = 2.99
        
        let cremeBurlee = Dessert(context: viewContext)
        profiterole.name = "Creme Burlee"
        profiterole.size = "Medium"
        profiterole.price = 3.99
        
        let iceCream = Dessert(context: viewContext)
        profiterole.name = "Ice Cream"
        profiterole.size = "Extra Large"
        profiterole.price = 5.99
        
        let applePie = Dessert(context: viewContext)
        profiterole.name = "Apple Pie"
        profiterole.size = "Small"
        profiterole.price = 2.99
        
        let cheeseCake = Dessert(context: viewContext)
        profiterole.name = "Cheese Cake"
        profiterole.size = "Extra Small"
        profiterole.price = 4.99
        
        let carrotCake = Dessert(context: viewContext)
        profiterole.name = "Carrot Cake"
        profiterole.size = "Standard"
        profiterole.price = 3.99
        
        let eclair = Dessert(context: viewContext)
        profiterole.name = "Eclair"
        profiterole.size = "Large"
        profiterole.price = 3.99
        
        saveDatabase()
    }
    
    func saveDatabase() {
        guard viewContext.hasChanges else { return}
        do {
            try viewContext.save()
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



