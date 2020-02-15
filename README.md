## MarvelList

###### Design pattern applied: 
- **[MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel)** with Coordinators


###### Frameworks used: 
- **[RxSwift](https://github.com/ReactiveX/RxSwift)** ( Reactive Programming )
- **[RxCocoa](https://github.com/ReactiveX/RxSwift)** ( Reactive Programming )
- **[Swinject](https://github.com/Swinject/Swinject)** ( Containers )
- **[Alamofire](https://github.com/Alamofire/Alamofire)** ( API )
- **[NVActivityIndicatorView](https://github.com/ninjaprox/NVActivityIndicatorView)** ( Loading )
- **[Nuke](https://github.com/kean/Nuke)** (Image Async Loading)

###### Application flow: 
![Coordinators with Navigation flow](https://github.com/lhs2/MarvelList/blob/master/MarvelList/MarvelList/Base/NavigationFlow.png)

AppCoordinator is started in AppDelegate. This coordinator will define where the application will start based on the application logic requested. In cases of Login required for the application, the AppCoordinator logic could be applied to verify. e.g. : 
  - If there is a current logged user in the database -> Go to Home
  - Else if it is the first time running the application or user has logged off -> Go to Login
  
Since this application did not require a login, the application automatic redirect to Home page.
Each feature coordinator is responsible for instantiating the respective storyboard and verify async when the navigation to another storyboard is required.
For the current scenario, the "Home Coordinator" will know reactively when the user pressed a cell in the table view and will request for the "Comic Preview Coordinator" to present modally your view with the selected information.

Current code coverage: 67%

Any questions you can contact me in: lhs2@cin.ufpe.br
