import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: scene)
        
            let navController = UINavigationController()

            let coordinator = HomeCoordinator(navigationController: navController)

            coordinator.start()

            // create a basic UIWindow and activate it
            window?.rootViewController = navController
            window?.makeKeyAndVisible()
    }
}
