
import Foundation

enum BundleProviderUtils {

    static func bundleProvider(
        assetsInMainBundle: Bool,
        assetsInSwiftPackage: Bool,
        assetsInResourceBundleName: String?
    ) -> String {
        if assetsInMainBundle {
            return makeBundleProviderMain(resourceBundleName: assetsInResourceBundleName)
        } else if assetsInSwiftPackage {
            return makeBundleProviderSwiftPackage(resourceBundleName: assetsInResourceBundleName)
        } else {
            return makeBundleProviderClassAssociated(resourceBundleName: assetsInResourceBundleName)
        }
    }

    private static func makeBundleProviderMain(resourceBundleName: String?) -> String {
        guard let resourceBundleName = resourceBundleName else {
            return ""
        }

        return """

        private class BundleProvider {
            static let bundle: Bundle = {
                let url = Bundle.main
                    .resourceURL!.appendingPathComponent("\(resourceBundleName)")
                return Bundle(path: url.path)!
            }()
        }

        """
    }

    private static func makeBundleProviderSwiftPackage(resourceBundleName: String?) -> String {
        guard let resourceBundleName = resourceBundleName else {
            return """
        
        private class BundleProvider {
            static let bundle = Bundle.module
        }

        """
        }

        return """
        
        private class BundleProvider {
            static let bundle: Bundle = {
                let url = Bundle.module
                    .resourceURL!.appendingPathComponent("\(resourceBundleName)")
                return Bundle(path: url.path)!
            }()
        }

        """
    }

    private static func makeBundleProviderClassAssociated(resourceBundleName: String?) -> String {

        guard let resourceBundleName = resourceBundleName else {
            return """

        private class BundleProvider {
            static let bundle = Bundle(for: BundleProvider.self)
        }

        """
        }

        return """

        private class BundleProvider {
            static let bundle: Bundle = {
                let url = Bundle(for: BundleProvider.self)
                    .resourceURL!.appendingPathComponent("\(resourceBundleName)")
                return Bundle(path: url.path)!
            }()
        }

        """
    }

}
