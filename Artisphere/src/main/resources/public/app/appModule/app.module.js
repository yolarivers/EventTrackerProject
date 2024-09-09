angular.module("appModule", ['ngRoute'])
.config(function($routeProvider) {
    $routeProvider
    .when("/", {
        templateUrl: "app/appModule/appComponent/app.component.html"
    })
    .when("/artwork", {
        templateUrl: "app/appModule/artworkComponent/artwork.component.html"
    })
    .when("/exhibitions", {
        templateUrl: "app/appModule/exhibitionComponent/exhibitions.component.html"
    })
    .when("/museums", {
        templateUrl: "app/appModule/museumsComponent/museums.component.html"
    })
    .when("/reviews", {
        templateUrl: "app/appModule/reviewsComponent/reviews.component.html"
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
});
