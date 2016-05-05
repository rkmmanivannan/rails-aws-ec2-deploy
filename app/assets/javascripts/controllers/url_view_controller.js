var app = angular.module('url');

app.controller("UrlViewController", [
  "$scope","$resource","$routeParams","$window","$location",
  function($scope,$resource,$routeParams,$window,$location){
    $scope.urlId = $routeParams.id;
    var Urllist = $resource('/urlview/:urlId.json',{"urlId": $scope.urlId},
                            {"save" : {"method": "GET"}});

    $scope.urllist = Urllist.get({ "urlId": $scope.urlId})


    $scope.init = function() {
        $scope.urllist.$save(
          function(response) {
            $window.open(response.originalurl,'_self');
            $scope.alert = {
              type: "success",
              message: "Redirecing..."
            };
          },
          function(response) {
            debugger;
            $scope.alert = {
              type: "danger",
              message: "Invalid URl"
            };
          }
        );
    }

    $scope.closeAlert = function(index) {
      $scope.alert = undefined;
    }
  }
]);
