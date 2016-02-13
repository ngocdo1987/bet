var recipe_app = angular.module('recipe_app', ['ngRoute', 'ngResource']);
var singular = 'chef';
var plural = 'chefs';
var s = window['singular'];
var p = window['plural'];
var search = {
  chefname: '',
  position: '',
  email: '',
  description: ''
};

// Factory
recipe_app.factory(plural, ['$resource',function($resource){
  return $resource('/'+plural+'.json', search,{
    query: { method: 'GET', isArray: true },
    create: { method: 'POST' }
  })
}]);

recipe_app.factory(singular, ['$resource', function($resource){
  return $resource('/'+plural+'/:id.json', {}, {
    show: { method: 'GET' },
    update: { method: 'PUT', params: {id: '@id'} },
    delete: { method: 'DELETE', params: {id: '@id'} }
  });
}]);

//Controller
recipe_app.controller("index", ['$scope', '$http', '$resource', plural, singular, '$location', function($scope, $http, $resource, p, s, $location) {

  $scope.p = p.query();

  $scope.deleteChef = function (id) {
    if (confirm("Are you sure you want to delete this "+singular+"?")){
      s.delete({ id: id }, function(){
        $scope.p = p.query();
        $location.path('/');
      });
    }
  };
  
  $scope.searchChef = function() {
    search.chefname = this.chefname;
    search.position = this.position;
    search.email = this.email;
    search.description = this.description;
    $scope.p = p.query();  
  }
  
  $scope.resetChef = function() {
    search.chefname = '';
    search.position = '';
    search.email = '';
    search.description = '';
    $scope.p = p.query();
  }
}]);

recipe_app.controller("edit", ['$scope', '$resource', singular, '$location', '$routeParams', function($scope, $resource, s, $location, $routeParams) {
  $scope.s = s.get({id: $routeParams.id})
  $scope.update = function(){
    if ($scope.chefForm.$valid){
      s.update({id: $scope.s.id},{s: $scope.s},function(){
        $location.path('/');
      }, function(error) {
        console.log(error)
      });
    }
  };

}]);

recipe_app.controller("new", ['$scope', '$resource', plural, '$location', function($scope, $resource, p, $location) {
  $scope.save = function () {
    if ($scope.chefForm.$valid){
      p.create({s: $scope.s}, function(){
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
    $routeProvider.when('/'+plural,{
      templateUrl: '/templates/'+plural+'/index.html',
      controller: 'index'
    });
    $routeProvider.when('/'+plural+'/new', {
      templateUrl: '/templates/'+plural+'/new.html',
      controller: 'new'
    });
    $routeProvider.when('/'+plural+'/:id/edit', {
      templateUrl: '/templates/'+plural+'/edit.html',
      controller: 'edit'
    });
    $routeProvider.otherwise({
      redirectTo: '/'+plural
    });
  }
]);