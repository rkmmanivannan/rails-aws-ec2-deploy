var app = angular.module('url');
app.controller("UrlSearchController",[
  "$scope", "$location", "urlSearch",
  function($scope,$location,urlSearch){

    $scope.urllists = [];
    urlSearch.successCallback(function(urllists) {
      $scope.urllists = urllists;
    });

    $scope.search       = urlSearch.search;
    $scope.previousPage = urlSearch.previousPage;
    $scope.nextPage     = urlSearch.nextPage;

    $scope.viewDetails = function(url){
      $location.path("/UrlList/" + url.id);
    }

  }
]);
