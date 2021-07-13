import Foundation

public struct XcodeColorsOutput {
    
    public let assetsColorsURL: URL?
    public let assetsInMainBundle: Bool
    public let assetsInSwiftPackage: Bool
    public let assetsInResourceBundleName: String?
    public let addObjcAttribute: Bool
    public let colorSwiftURL: URL?
    public let swiftuiColorSwiftURL: URL?
    
    public init(
        assetsColorsURL: URL?,
        assetsInMainBundle: Bool,
        assetsInSwiftPackage: Bool? = false,
        assetsInResourceBundleName: String? = nil,
        addObjcAttribute: Bool? = false,
        colorSwiftURL: URL? = nil,
        swiftuiColorSwiftURL: URL? = nil) {
        self.assetsColorsURL = assetsColorsURL
        self.assetsInMainBundle = assetsInMainBundle
        self.assetsInResourceBundleName = assetsInResourceBundleName
        self.assetsInSwiftPackage = assetsInSwiftPackage ?? false
        self.addObjcAttribute = addObjcAttribute ?? false
        self.colorSwiftURL = colorSwiftURL
        self.swiftuiColorSwiftURL = swiftuiColorSwiftURL
    }
}
