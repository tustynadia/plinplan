angular.module('starter.services', [])

.factory('listdewaService', function($http){
	var baseUrl = "http://plinplan.esy.es/index.php/dewa/";
	return {
		getAll: function(){
			return $http.get(baseUrl+'index/json');
		},
	};
});
