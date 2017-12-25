'use strict';

/**
 * @ngdoc overview
 * @name IonicWebbook
 * @description
 * # Initializes main application and routing
 *
 * Main module of the application.
 */

// Example to require lodash
// This is resolved and bundled by browserify
//
// var _ = require( 'lodash' );


var stateSpinner = require("./ui/state-spinner")(jQuery);


angular.module( 'IonicWebbook', [
  'ionic',
  'ngCordova',
  'ngResource'
] )
.run( [
  '$ionicPlatform',
  '$rootScope',
  '$ionicScrollDelegate',

  function( $ionicPlatform, $rootScope, $ionicScrollDelegate )
  {

    $ionicPlatform.ready(function() {
      // save to use plugins here
    });


    $rootScope.devWidth = ((window.innerWidth > 0) ? window.innerWidth : screen.width);
    $rootScope.range = function(n) {
      return new Array(n);
    };
    $rootScope.scrollTop = function() {
      $ionicScrollDelegate.scrollTo(0, 0, true);
      // $ionicScrollDelegate.scrollTop();
    }

    $rootScope.$on('$stateChangeStart', function(event, toState, toParams) {
      // console.log("change state");
      stateSpinner.on("#state-spinner");
    });

    $rootScope.$on('$stateChangeSuccess', function (event, toState, toParams, fromState, fromParams) {
      // console.log("change state success");
      stateSpinner.off("#state-spinner");
    });

} ] )

.config( [
  '$httpProvider',
  '$stateProvider',
  '$urlRouterProvider',
  '$ionicConfigProvider',

  function( 
    $httpProvider, 
    $stateProvider, 
    $urlRouterProvider,
    $ionicConfigProvider )
  {
    // register $http interceptors, if any. e.g.
    // $httpProvider.interceptors.push('interceptor-name');
    var v = 1;

    // Application routing
    $stateProvider
      .state('app', {
        url: '/app',
        abstract: true,
        templateUrl: 'templates/main.html',
        controller: 'MainController'
      })
      .state('app.home', {
        url: '/home',
        cache: true,
        views: {
          'viewContent': {
            templateUrl: 'templates/views/home.html',
            controller: 'HomeController'
          }
        }
      })
      .state('app.test', {
        url: '/test',
        cache: false,
        views: {
          'viewContent': {
            templateUrl: function ($stateParams){
              v+=1;
              return 'https://php-codart1.c9.io/hello-world.php?v=' + v;
            },
            controller: 'HomeController'
          }
        }
      })
      .state('app.settings', {
        url: '/settings',
        cache: true,
        views: {
          'viewContent': {
            templateUrl: 'templates/views/settings.html',
            controller: 'SettingsController'
          }
        }
      });


    // redirects to default route for undefined routes
    $urlRouterProvider.otherwise('/app/home');

  }
] )

// Angular module controllers
//
.controller( 'MainController',     require( './controllers/mainController'     ) )
.controller( 'HomeController',     require( './controllers/homeController'     ) )
.controller( 'SettingsController', require( './controllers/settingsController' ) )

// Angular module services
//
.factory( 'ExampleService',        require( './services/ExampleService' ) )
.factory( 'ApiService',            require( './services/ApiService'     ) )

// Angular module directive
//
.directive('includeReplace', require( './directive/include-replace' ))
.directive('horizontalScrollFix', require( './directive/scroll-fix' ))
;

// run UI module
require('./ui/ui')(jQuery);