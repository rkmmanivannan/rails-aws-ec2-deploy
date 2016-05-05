var app = angular.module(
    'url',
    [
      'ngRoute',
      'ngResource',
      'ng-rails-csrf',
      'ngMessages',
      'ui.bootstrap',
      'templates'
    ]
  );


app.config([
      "$routeProvider",
    function($routeProvider){
      $routeProvider.when("/", {
        controller: "UrlSearchController",
        templateUrl: "home/index.html"
      }).when("/aboutproject", {
        controller: "UrlSearchController",
        templateUrl: "home/aboutproject.html"
      }).when("/aboutdeveloper", {
        controller: "UrlSearchController",
        templateUrl: "home/aboutdeveloper.html"
      }).when("/UrlShort", {
        controller: "UrlShortController",
        templateUrl: "url/url_short.html"
      }).when("/UrlList", {
        controller: "UrlSearchController",
        templateUrl: "url/url_search.html"
      }).when("/UrlList/:id",{
        controller: "UrlDetailController",
        templateUrl: "url/url_detail.html"
      }).when("/UrlView/:id",{
        controller: "UrlViewController",
        templateUrl: "url/url_view.html"
      });
    }
]);
