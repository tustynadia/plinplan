angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $http, $ionicModal, $timeout, $ionicPopup) {
  
  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});
  
  // Form data for the login modal
  $scope.loginData = {};

  // Create the login modal that we will use later
  $ionicModal.fromTemplateUrl('templates/login.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  // Triggered in the login modal to close it
  $scope.closeLogin = function() {
    $scope.modal.hide();
  };

  // Open the login modal
  $scope.login = function() {
    $scope.modal.show();
  };

  // Perform the login action when the user submits the login form
  $scope.doLogin = function() {
    console.log('Doing login', $scope.loginData);

    // Simulate a login delay. Remove this and replace with your login
    // code if using a login system
    $timeout(function() {
      $scope.closeLogin();
    }, 1000);
  };
$scope.kosongkanFormDewa = function(){
	$scope.username = "";
	$scope.password = "";
	$scope.nama = "";
	$scope.level_user = "";
};
$scope.kumpul = function() {
	$http
		.post('http://plinplan.esy.es/index.php/dewa/add',
			{
				'username':$scope.username,
				'password': $scope.password,
				'nama': $scope.nama,
				'level_user': $scope.level_user
			}
		)
		.success(function(data, status, headers, config) {
			//$scope.respon = data;
			var stt = "";
			if(data == 1){
				//$scope.respon = "Insert data successful.";
				stt = "Insert data successful.";
			}else{
				//$scope.respon = "Insert data error or warning.";
				stt = "Insert data error or warning. "+data;
			}
			
			$scope.respon = $ionicPopup.alert({
				title: 'Notification',
				template: stt
			});
			$scope.kosongkanFormDewa();
		})
		.error(function(data, status) {
			//$scope.respon.push(status);
			//$scope.respon = "Error when inserting data. Check your connection or report this bug!";
			$scope.respon = $ionicPopup.alert({
				title: 'Notification',
				template: "Error when inserting data. Check your connection or report this bug!"
			});
			$scope.kosongkanFormDewa();
		});
	}
})

// .controller('PlaylistsCtrl', function($scope) {
//   $scope.playlists = [
//     { title: 'Reggae', id: 1 },
//     { title: 'Chill', id: 2 },
//     { title: 'Dubstep', id: 3 },
//     { title: 'Indie', id: 4 },
//     { title: 'Rap', id: 5 },
//     { title: 'Cowbell', id: 6 }
//   ];
// })

// .controller('PlaylistCtrl', function($scope, $stateParams) {
// })

// galeri controller
.controller("Gallery", function($scope) {
 
    $scope.images = [];
 
    $scope.loadImages = function() {
        for(var i = 0; i < 100; i++) {
            $scope.images.push({id: i, src: "img/img.png"});
        }
    }
 
})

.controller("datalistDewaCtrl", function($scope,$state, listdewaService){
	$scope.showData = function() {
		listdewaService.getAll().success(function(data) {
			$scope.datadewas = data;
		}).finally(function() {
			$scope.$broadcast('scroll.refreshComplete');
		});
	};
	$scope.showData();
});
