//
// Created by Eugene Kazaev on 30/07/2018.
//

import Foundation
import UIKit

/// Base protocol for all the types of the factories.
/// An instance that extends `AbstractFactory` builds a `UIViewController` that will be later
/// integrated into the stack by `Router`
public protocol AbstractFactory {

    /// Type of `UIViewController` that `Factory` can build
    associatedtype ViewController: UIViewController

    /// `Context` to be passed into `UIViewController`
    associatedtype Context

    /// If the `AbstractFactory` can tell the `Router` if it can build a `UIViewController` or not - it should overload this method.
    /// The `Router` will call it before the routing process and if the `AbstractFactory` is not able to
    /// build a view controller it should throw an exception (example: it has to build a product view
    /// controller but there is no product code in context) it can stop `Router` from routing to this destination
    /// and the result of routing will be `.unhandled` without any changes in the view controller stack.
    ///
    /// - Parameter context: A `Context` instance if it was provided to the `Router`.
    /// - Throws: The `RoutingError` if the `Factory` can not prepare itself to build a `UIViewController` instance
    ///   with the `Context` instance provided.
    mutating func prepare(with context: Context) throws

}
