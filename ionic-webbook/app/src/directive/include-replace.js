'use strict';

/**
 * @ngdoc overview
 * @name IonicWebbook
 * @description
 * @author: ManhDT
 * # ng-include with replace posibility
 *
 */

 module.exports = function () {
    return {
        require: 'ngInclude',
        restrict: 'A', /* optional */
        link: function (scope, el, attrs) {
            el.replaceWith(el.children());
        }
    };
};