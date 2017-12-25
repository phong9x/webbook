'use strict';

/**
 * @ngdoc overview
 * @name IonicWebbook
 * @description
 * # STATE SPINNER
 *
 * 
 */


 module.exports = function($) {
 	return {
		on: function(id) {
			$(id).css("display", "block");
		},

		off: function(id) {
			$(id).css("display", "none");
		}
	}
 }