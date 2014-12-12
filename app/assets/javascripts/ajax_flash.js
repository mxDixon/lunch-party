/*
 ajax_flash.js
 for use with jQuery 1.11.0
 */
(function (Jdux, $) {

  Jdux.AjaxFlash = Jdux.AjaxFlash || function () {
    var
      timer,

      unflash = function () {
        $("#flash-message").empty();
      },

      flash = function () {
        $("#flash-message").find(".alert").show();
        clearTimeout(timer);
        timer = setTimeout( function () {
          $("#flash-message").find(".alert").delay(30000).fadeOut("slow");
        }, 0);
      },

      alertElement = function (msg, type) {
        return $("<div/>", {
          text: msg,
          id: "flash_" + type,
          "class": getAlertClass(type)
        })
          .prepend($('<span/>', {
            "class": getIconClass(type)
          }))
          .append('<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>');
      },

      showAjaxMessage = function (msg, type) {
        unflash();
        if (msg) {
          $("#flash-message").append(alertElement(msg, type));
          flash();
        }
      },

      alertMap = {
        "success" : "alert-success",
        "notice"  : "alert-info",
        "warning" : "alert-warning",
        "error"   : "alert-danger",
        "alert"   : "alert-danger"
      },

      iconMap = {
        "success" : "glyphicon-ok-sign",
        "notice"  : "glyphicon-info-sign",
        "warning" : "glyphicon-exclamation-sign",
        "error"   : "glyphicon-exclamation-sign",
        "alert"   : "glyphicon-exclamation-sign"
      },

      getAlertClass = function (type) {
        var cssClass = "alert alert-dismissable";
        cssClass += type ? " " + alertMap[type] : "";
        return cssClass;
      },

      getIconClass = function (type) {
        return type ? "glyphicon " + iconMap[type] : "glyphicon";
      }

    initialize = function () {
      $(document).ajaxComplete(function (event, request) {
        var msg = request.getResponseHeader('X-Message'),
          type = request.getResponseHeader('X-Message-Type');
        showAjaxMessage(msg, type);
      });
    }
    ;

    return {
      Initialize: initialize
    };

  }();

})(Jdux, jQuery);