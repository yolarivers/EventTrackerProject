angular.module("appModule", ['ngRoute'])
.config(function($routeProvider, $locationProvider) {
    $routeProvider
    .when("/", {
        templateUrl: "app/appModule/appComponent/app.component.html"
    })
    .when("/login", {
        templateUrl: "app/appModule/loginComponent/login.component.html"
    })
    .when("/signup", {
        templateUrl: "app/appModule/signupComponent/signup.component.html"
    })
    .otherwise({
        redirectTo: "/"
    });

  
    $locationProvider.hashPrefix('');
});
