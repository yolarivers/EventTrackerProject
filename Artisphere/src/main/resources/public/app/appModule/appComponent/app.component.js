angular.module("appModule")
.component("appComponent", {
    templateUrl: "app/appModule/appComponent/app.component.html",
    controller: function() {
        var vm = this;
        vm.message = "Welcome to Artisphere!";
    }
});
