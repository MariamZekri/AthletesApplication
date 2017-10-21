# AthletesApplication
iOS app that displays a list of athletes from api url.
# Features
- App contain two view.
- First one is a table view that athlete's name and his image in a custom cell.
- user could click on any athletes to know more detaials about them on another view.

# Architecture Design Pattern
- MVP (Model-View-Presenter)
# Third party libraries
1. [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)
   - Parse data to JSON and wraps the result of the Alamofire JSON response handler.
   
2. [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)
   - Mapping JSON or string JSON to objects and Nested Object.
   - ObjectMapper could generate Realm models and simple Alamofire extension that uses ObjectMapper to automatically map JSON response     data to Swift objects.
   
3. [Kingfisher](https://github.com/onevcat/Kingfisher)
   - Could download images from url asynchronous and caching for UIImageView or UIButton.
   - Cancel downloading and process tasks.
4. [NVActivityIndicatorView](https://github.com/ninjaprox/NVActivityIndicatorView)
   - Has wide collection of loading Indicators with awesome animations.
   
5. [UIScrollView-InfiniteScroll](https://github.com/pronebird/UIScrollView-InfiniteScroll)
   - Easy for implementation and use Swizzling.
   - provide a handler block and could use it with table view, collection view and scroll view.
   
6. [Alamofire](https://github.com/Alamofire/Alamofire)
-Alamofire is a Swift-based HTTP networking library for iOS and Mac OS X. It provides an elegant interface on top of Apple’s Foundation networking stack that simplifies a number of common networking tasks
-Alamofire provides chainable request/response methods, JSON parameter and response serialization, authentication, and many other features
