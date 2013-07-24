@ChallengesIndexCtrl = ["$scope", "Challenge", ($scope, Challenge) ->
	$scope.challenges = Challenge.query()

	$scope.destroy = (idx) ->
		deleteChallenge = confirm('Are you absolutely sure you want to delete? This action can not be undone!');
		if(deleteChallenge)
			$scope.challenges[idx].$remove()
			$scope.challenges.splice(idx,1)
			$scope.$apply()
]

@ChallengeCreatorCtrl = ["$scope", "Challenge", "$location", ($scope, Challenge, $location) ->

	$scope.save = ->
		Challenge.save $scope.challenge
		$location.path "/challenges"
]

@ChallengeEditCtrl = ["$scope", "Challenge", "$routeParams", "$location", ($scope, Challenge, $routeParams, $location) ->
	$scope.challenge = Challenge.get({id:$routeParams.id})

	$scope.update = ->
		$scope.challenge.$update()
		$location.path "/challenges"
]