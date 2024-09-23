import UIKit

class Berry {
}
class Blueberry: Berry {
}
class Strawberry: Berry {
}
let berries = [Berry(), Blueberry(), Strawberry()]
for berry in berries {
    if berry is Berry {
        print("Berry")
    }
    if berry is Blueberry {
        print("Blueberry")
    }
    if berry is Strawberry {
        print("Strawberry")
    }
} 
