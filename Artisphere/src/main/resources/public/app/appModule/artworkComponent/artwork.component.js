angular.module("appModule")
.component("artworkComponent", {
    templateUrl: "app/appModule/artworkComponent/artwork.component.html",
    controller: function() {
        var vm = this;
        vm.artworks = [
            {
                title: "Starry Night",
                artist: "Vincent van Gogh",
                description: "A masterpiece of post-impressionist art.",
                imageUrl: "path/to/starry-night.jpg"
            },
            {
                title: "Mona Lisa",
                artist: "Leonardo da Vinci",
                description: "The most famous portrait in the world.",
                imageUrl: "path/to/mona-lisa.jpg"
            },
            {
                title: "The Persistence of Memory",
                artist: "Salvador Dalí",
                description: "A surreal dreamscape with melting clocks.",
                imageUrl: "path/to/persistence-of-memory.jpg"
            }
        ];
    }
});
