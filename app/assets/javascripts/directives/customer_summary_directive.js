var app = angular.module('url');
app.directive("urlSummary", function() {
  return {
    "scope": {
      "cust": "=",
      "viewDetailsFunction": "="
    },
    "templateUrl": "url/url_summary.html"
  }
});
