import UIKit

class LocalFile {
    let name: String
    let fileExtension: String
    var fullFileName: String {
        name + "." + fileExtension
    }
    init(name: String, fileExtension: String) {
        self.name = name
        self.fileExtension = fileExtension
    }
}

let file = LocalFile(name: "image", fileExtension: "png")
print(file.fullFileName)


