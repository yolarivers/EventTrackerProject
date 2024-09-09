angular.module("appModule")
.component("signupComponent", {
    templateUrl: "app/appModule/signupComponent/signup.component.html",
    controller: function($http, $window) {
        var vm = this;
        vm.user = {
            username: '',
            email: '',
            password: '',
            confirmPassword: ''
        };

        vm.passwordsDontMatch = false;

        vm.checkPasswords = function() {
            vm.passwordsDontMatch = vm.user.password !== vm.user.confirmPassword;
        };

        vm.signup = function() {
            if (vm.passwordsDontMatch) {
                return;
            }

            $http.post('/api/signup', vm.user).then(function(response) {
                $window.location.href = '/login.html';
            }, function(error) {
                console.error('Signup failed:', error);
            });
        };

        vm.checkPasswords();
    }
});
