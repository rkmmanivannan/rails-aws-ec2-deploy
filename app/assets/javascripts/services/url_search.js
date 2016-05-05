var app = angular.module('url');
app.factory("urlSearch", [
          "$http",
  function($http) {


    var page = 0;
    var mostRecentSearchTerm = undefined;
    var success = function() {};

    var successCallback = function(newCallback) {
      success = newCallback;
    };

    var search = function(searchTerm){

      if(searchTerm.length < 1){
        return;
      }
      mostRecentSearchTerm = searchTerm;
      $http.get("/urlshort.json",
                {"params" : {"keywords": searchTerm, "page": page}}
      ).then(function(response) {
          success(response.data);
        },
        function(response) {
          alert("There was a problem: " + response.status);
        }
      );
    }

    var previousPage = function() {
      if ( (page > 0) && mostRecentSearchTerm) {
        page = page - 1;
        search(mostRecentSearchTerm);
      }
    };

    var nextPage = function() {
      if (mostRecentSearchTerm) {
        page = page + 1;
        search(mostRecentSearchTerm);
      }
    };

    return {
      "successCallback": successCallback,
      "search": search,
      "previousPage": previousPage,
      "nextPage": nextPage
    };

}]);
