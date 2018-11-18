import Foundation

public extension UserDefaults {
    private static let hasLoadedForFirstTimeInstallKey = "hasLoadedForFirstTimeInstall"
    
    static var hasLoadedForFirstTimeInstall: Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDefaults.hasLoadedForFirstTimeInstallKey)
        }
        set {
            return UserDefaults.standard.set(newValue, forKey: UserDefaults.hasLoadedForFirstTimeInstallKey)
        }
    }
}
