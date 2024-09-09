angular.module("appModule")
.component("reviewsComponent", {
    templateUrl: "app/appModule/reviewsComponent/reviews.component.html",
    controller: function($http) {
        var vm = this;
        
        vm.reviews = [];

        vm.newReview = {
            title: '',
            rating: '',
            comment: '',
            username: 'Anonymous',
            date: new Date()
        };

        vm.getReviews = function() {
            $http.get('/api/reviews').then(function(response) {
                vm.reviews = response.data;
            }, function(error) {
                console.error('Error fetching reviews:', error);
            });
        };

        vm.submitReview = function() {
            vm.newReview.date = new Date();

            $http.post('/api/reviews', vm.newReview).then(function(response) {
                vm.reviews.push(response.data);
                vm.newReview = {
                    title: '',
                    rating: '',
                    comment: '',
                    username: 'Anonymous',
                    date: new Date()
                };
            }, function(error) {
                console.error('Error submitting review:', error);
            });
        };

        vm.getReviews();
    }
});
