var recipe_app = angular.module('recipe_app', ['ngRoute', 'ngResource']);

// Factory
recipe_app.factory('Chefs', ['$resource',function($resource){
  return $resource('/chefs.json', {},{
    query: { method: 'GET', isArray: true },
    create: { method: 'POST' }
  })
}]);

recipe_app.factory('Chef', ['$resource', function($resource){
  return $resource('/chefs/:id.json', {}, {
    show: { method: 'GET' },
    update: { method: 'PUT', params: {id: '@id'} },
    delete: { method: 'DELETE', params: {id: '@id'} }
  });
}]);

//Controller
recipe_app.controller("ChefListCtr", ['$scope', '$http', '$resource', 'Chefs', 'Chef', '$location', function($scope, $http, $resource, Chefs, Chef, $location) {

  $scope.chefs = Chefs.query();

  $scope.deleteChef = function (chefId) {
    if (confirm("Are you sure you want to delete this chef?")){
      Chef.delete({ id: chefId }, function(){
        $scope.chefs = Chefs.query();
        $location.path('/');
      });
    }
  };
}]);

recipe_app.controller("ChefUpdateCtr", ['$scope', '$resource', 'Chef', '$location', '$routeParams', function($scope, $resource, Chef, $location, $routeParams) {
  $scope.chef = Chef.get({id: $routeParams.id})
  $scope.update = function(){
    if ($scope.chefForm.$valid){
      Chef.update({id: $scope.chef.id},{chef: $scope.chef},function(){
        $location.path('/');
      }, function(error) {
        console.log(error)
      });
    }
  };

}]);

recipe_app.controller("ChefAddCtr", ['$scope', '$resource', 'Chefs', '$location', function($scope, $resource, Chefs, $location) {
  $scope.save = function () {
    if ($scope.chefForm.$valid){
      Chefs.create({chef: $scope.chef}, function(){
        $location.path('/');
      }, function(error){
        console.log(error)
      });
    }
  }
}]);

//Routes
recipe_app.config([
  '$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
    $routeProvider.when('/chefs',{
      templateUrl: '/templates/chefs/index.html',
      controller: 'ChefListCtr'
    });
    $routeProvider.when('/chefs/new', {
      templateUrl: '/templates/chefs/new.html',
      controller: 'ChefAddCtr'
    });
    $routeProvider.when('/chefs/:id/edit', {
      templateUrl: '/templates/chefs/edit.html',
      controller: "ChefUpdateCtr"
    });
    $routeProvider.otherwise({
      redirectTo: '/chefs'
    });
  }
]);