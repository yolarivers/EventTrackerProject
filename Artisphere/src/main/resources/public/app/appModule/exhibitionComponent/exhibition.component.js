angular.module("appModule")
.component("exhibitionsComponent", {
    templateUrl: "app/appModule/exhibitionComponent/exhibition.component.html",  // Corrected the path to the HTML file
    controller: function() {
        var vm = this;
        vm.exhibitions = [
            {
                title: "Modern Art Masters",
                description: "An exploration of modern art from the 20th century.",
                date: "April 5, 2024 - June 30, 2024",
                imageUrl: "path/to/modern-art.jpg"
            },
            {
                title: "Impressionism Revisited",
                description: "A collection of iconic impressionist paintings.",
                date: "July 10, 2024 - September 15, 2024",
                imageUrl: "path/to/impressionism.jpg"
            },
            {
                title: "The Renaissance Era",
                description: "Masterpieces from the Renaissance period.",
                date: "October 1, 2024 - December 31, 2024",
                imageUrl: "path/to/renaissance.jpg"
            }
        ];
    }
});
