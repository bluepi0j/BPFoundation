import Foundation

public extension FileManager {
    func fileSize(URL:URL) -> Int {
        let filePath = URL.path
        var fileSize : Int
        
        do {
            //return [FileAttributeKey : Any]
            let attr = try FileManager.default.attributesOfItem(atPath: filePath)
            fileSize = attr[FileAttributeKey.size] as! Int
            
            //if you convert to NSDictionary, you can get file size old way as well.
            let dict = attr as NSDictionary
            fileSize = Int(dict.fileSize())
            return fileSize
            
        } catch {
            print("Error: \(error)")
        }
        return 0
    }
}
