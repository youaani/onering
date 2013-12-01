function HarbormasterTasksController($scope, $http, $window){
  $scope.reload = function(){
    $http.get('/api/harbormaster/mesos/clusters').success(function(data){
      $scope.clusters = data;

      if(angular.isUndefined($scope.current_cluster)){
        var sites = Object.keys($scope.clusters);

        if(sites.length > 0 && $scope.clusters[sites[0]]){
          var clusters = Object.keys($scope.clusters[sites[0]]);

          if(clusters.length > 0 && $scope.clusters[sites[0]][clusters[0]]){
            var master = $scope.clusters[sites[0]][clusters[0]];

            if(master.id){
              $scope.getMesosStats(master.id);
            }
          }
        }
      }else if(angular.isDefined($scope.current_cluster.id)){
        $scope.getMesosStats($scope.current_cluster.id);
      }
    });

    $http.get('/api/harbormaster/tasks/all').success(function(data){
      $scope.tasks = data;
    });
  }

  $scope.getMesosStats = function(id){
    if(angular.isDefined(id)){
      $http.get('/api/devices/'+id+'/mesos').success(function(data){
        $scope.current_cluster = data;
        $scope.current_cluster.id = id;
      });
    }
  }

  $scope.mesosTasksFor = function(marathon_task_id, task_id){
    if(marathon_task_id.indexOf(task_id) !== -1){
      return true;
    }

    return false;
  }

  $scope.reload();
  $window.setInterval($scope.reload, 10000);
}


function HarbormasterTaskEditorController($scope, $http, $routeParams){
  if(angular.isDefined($routeParams.id)){
    $http.get('/api/harbormaster/tasks/'+$routeParams.id).success(function(data){
      $scope.task = data;
    });
  }
}
