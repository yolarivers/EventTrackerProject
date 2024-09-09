angular.module("appModule")
.component("museumsComponent", {
    templateUrl: "app/appModule/museumsComponent/museums.component.html",
    controller: function() {
        var vm = this;
        vm.museums = [
            {
                name: "The Louvre",
                description: "The world's largest art museum, located in Paris, France.",
                imageUrl: "path/to/louvre.jpg"
            },
            {
                name: "The Metropolitan Museum of Art",
                description: "One of the largest museums in the United States, located in New York City.",
                imageUrl: "path/to/met.jpg"
            },
            {
                name: "The British Museum",
                description: "A museum dedicated to human history, art, and culture in London, UK.",
                imageUrl: "path/to/british-museum.jpg"
            }
        ];
    }
});
