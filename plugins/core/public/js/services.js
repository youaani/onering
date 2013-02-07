angular.module('coreService', ['ngResource']).
factory('User', function($resource){
  return $resource('/api/core/users/:user', {
    user: '@user'
  });
}).
factory('CurrentUser', function($resource){
  return $resource('/api/core/users/current');
}).
factory('UserList', function($resource){
  return $resource('/api/core/users/list');
}).
factory('GroupList', function($resource){
  return $resource('/api/core/groups/list');
}).
factory('CapabilityList', function($resource){
  return $resource('/api/core/capabilities/list');
});