var app = angular.module('url');

app.controller("UrlShortController", [
  "$scope","$resource","$routeParams","$http",
  function($scope,$resource,$routeParams,$http){
    // var testCtrl1ViewModel = $scope.$new();
    var page = 0;
    $scope.urlId = $routeParams.id;
    var Urllist = $resource('/urlshort',
                            {"keyWords": $scope.keywords},{
                            "create" : {"method": "POST"}
                          });

    $scope.urllist = Urllist.get({ "keyWords": $scope.keywords})

    $scope.save = function() {
      if ($scope.form.$valid) {
        $scope.urllist.$save(
          function(response) {
            $scope.form.$setPristine();
            $scope.form.$setUntouched();
            // $controller('CurrentUserUrlListController',{$scope : testCtrl1ViewModel });
            // testCtrl1ViewModel.init();
            $scope.init();
            $scope.alert = {
              type: "success",
              message: "Short URL Successfully created"
            };
          },
          function(response) {
            $scope.alert = {
              type: "danger",
              message: "Short URL couldn't saved"
            };
          }
        );
      }
    }

    $scope.destroy = function(data)
    {
      debugger;
      $http.get("/urlshort",
                {"params" : {"destroyid": data}},
                {"delete" : {"method": "DELETE"}}
        ).then(function(response)
        {
          // debugger;
          $scope.init();
          $scope.alert = {
            type: "success",
            message: "Short URL Successfully deleted"
          };
        },
        function(response){
          alert("There was a problem: " + response.status);
        }
      );
    }


    $scope.init = function () {
      // debugger;
    $http.get("/urlshort",
              {"params" : {"page": page}},
              {"current_user_url_list" : {"method": "GET"}}
      ).then(function(response)
      {
        $scope.urllists = response.data;
      },
      function(response){
        alert("There was a problem: " + response.status);
      }
    );
  }

  $scope.previousPage = function(){
    // debugger;
    if(page>0){
      page = page - 1;
      $scope.init();
    }
  }

  $scope.nextPage   = function(){
    // debugger;
    page = page + 1;
    $scope.init();
  }


    $scope.closeAlert = function(index) {
      $scope.alert = undefined;
    }
  }
]);


// app.controller("CurrentUserUrlListController",[
//       "$scope","$http",
//       function($scope,$http){
//         var page = 0;
//         $scope.init = function () {
//           debugger;
//         $http.get("/urlshort",
//                   {"params" : {"page": page}},
//                   {"current_user_url_list" : {"method": "GET"}}
//           ).then(function(response)
//           {
//             debugger;
//             $scope.urllists = response.data;
//           },
//           function(response){
//             alert("There was a problem: " + response.status);
//           }
//         );
//       }
//
//       $scope.previousPage = function(){
//         if(page>0){
//           page = page - 1;
//           $scope.init;
//         }
//       }
//
//       $scope.nextPage   = function(){
//         page = page + 1;
//         $scope.init;
//       }
//
//
//
//     }
//   ]);
