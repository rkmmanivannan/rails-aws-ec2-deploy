var app = angular.module('url');

app.controller("UrlDetailController", [
  "$scope","$resource","$routeParams",
  function($scope,$resource,$routeParams){
    $scope.urlId = $routeParams.id;
    var Urllist = $resource('/urlshort/:urlId.json',{"urlId": $scope.urlId},
                            {"save" : {"method": "PUT"}});

    $scope.urllist = Urllist.get({ "urlId": $scope.urlId})

    $scope.save = function() {
      if ($scope.form.$valid) {
        $scope.urllist.$save(
          function() {
            $scope.form.$setPristine();
            $scope.form.$setUntouched();
            $scope.alert = {
              type: "success",
              message: "Url Successfully saved"
            };
          },
          function() {
            $scope.alert = {
              type: "danger",
              message: "Url couldn't saved"
            };
          }
        );
      }
    }

    $scope.closeAlert = function(index) {
      $scope.alert = undefined;
    }
  }
]);
