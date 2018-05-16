var app = angular.module('app', []);

app.controller('EmailCtrl', ['$scope', '$http', function ($scope, $http) {
    $scope.credentials = {
        server: '',
        from: '',
        password: '',
        to: '',
        templateId: ''
    };

    $scope.templates = templates;
    debugger;
    $scope.sendEmail = function () {
        debugger;
        $http.post('/send_email', $scope.credentials, {})
            .then(function (resp) {
            });
    }
}]);
