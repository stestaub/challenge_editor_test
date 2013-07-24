app = angular.module "ChallengeEditor", ["ngResource"], ($routeProvider, $locationProvider) ->
	
	$routeProvider.when '/challenges/new', {
		templateUrl: '/assets/challenges/new.html.erb',
		controller: ChallengeCreatorCtrl
	}
	$routeProvider.when '/challenges/', {
    templateUrl: '/assets/challenges/index.html.erb',
    controller: ChallengesIndexCtrl
  }
  $routeProvider.when '/challenges/:id/edit', {
    templateUrl: '/assets/challenges/edit.html.erb',
    controller: ChallengeEditCtrl
  }
  $routeProvider.otherwise { redirectTo: '/challenges/' }


app.directive 'widgetBox', () ->
  (scope, element, attrs) -> 
    init_widget_boxes()


app.factory "Challenge", ["$resource", ($resource) ->
	$resource("/challenges/:id", {id: "@_id"}, {update: {method: "PUT"}})
]

app.factory "ChallengeContainer", ["$resource", ($resource) ->

]