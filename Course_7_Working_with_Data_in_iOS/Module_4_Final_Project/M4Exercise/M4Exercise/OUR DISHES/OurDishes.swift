import SwiftUI
import CoreData

struct OurDishes: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var dishesModel = DishesModel()
    @State private var showAlert = false
    @State var searchText = ""
    
    private func buildPredicate() -> NSPredicate {
        return searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "name CONTAINS[cd] %@", searchText)
    }
    
    private func buildSortDescriptors() -> [NSSortDescriptor] {
        [NSSortDescriptor(key: "name", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    var body: some View {
        VStack {
            LittleLemonLogo()
                .padding(.bottom, 10)
                .padding(.top, 50)
            
            Text ("Tap to order")
                .foregroundColor(.black)
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .background(Color("approvedYellow"))
                .cornerRadius(20)
            
            /*
             You must replace the commented line inside the List command with one that conforms to the following requirements:
             
             Enumerates the dishes from dishes array.
             
             Passes every item to the DisplayDish view you have created on the last step.
             
             Make DisplayDish tappable in OurDishes.swift. The tap must toggle the showAlert variable
             */
            NavigationView {
                FetchedObjects(
                    /*
                     create a buildPredicate function inside OurDishes.swift that returns a predicate that returns true if searchText is empty or otherwise returns a predicate that just returns the entries which contain the string stored in searchText in its name. The filtering must be diacritic and case-insensitive.
                     
                     buildSortDescriptors inside OurDishes.swift that returns an array of sort descriptors that sort dishes by name, in ascending alphabetical order, and uses the sorting standard method preferred by macOS's Finder.
                     */
                    predicate:buildPredicate(),
                    sortDescriptors:   buildSortDescriptors()) {
                                                             (dishes: [Dish]) in
                                                             List {
                                                                 // Code for the list enumeration here
                                                                 ForEach(dishes, id:\.self) { dish in
                                                                     DisplayDish(dish)
                                                                         .onTapGesture {
                                                                             showAlert.toggle()
                                                                         }
                                                                 }
                                                             }
                                                             
                                                             /*
                                                              Considering the same code shown in the second step, add a modifier to the NavigationView to display a search bar at the top that is linked to the variable searchText of type String.
                                                              */
                                                             .searchable(text: $searchText, prompt: "search...")
                                                             // add the search bar modifier here
                                                         }
            }
            
            // SwiftUI has this space between the title and the list
            // that is amost impossible to remove without incurring
            // into complex steps that run out of the scope of this
            // course, so, this is a hack, to bring the list up
            // try to comment this line and see what happens.
            .padding(.top, -10)//
            
            .alert("Order placed, thanks!",
                   isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
            
            // makes the list background invisible, default is gray
                   .scrollContentBackground(.hidden)
            
            // runs when the view appears
                   .task {
                       await dishesModel.reload(viewContext)
                   }
            
        }
    }
}

struct OurDishes_Previews: PreviewProvider {
    static var previews: some View {
        OurDishes()
    }
}






