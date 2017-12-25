window.trams = window.trams || {};

(function($) {
  trams.setMinHeightDependOn = function(main, others) {
    var othersHeight = 0;
    var viewportHeight;

    others.forEach(function(item) {
      othersHeight += item.height();
    });

    // alert(othersHeight);
  };
})(jQuery);

// 
// UNDISABLED IF
// 
(function($) {
  if(!$("[data-undisable-if]").length) return;

  $("[data-undisable-if]").each(function(index, el) {
    var self = $(this);
    var triggerSelector = self.attr("data-undisable-if");
    var undisableValue = self.attr("data-undisable-value");

    $(triggerSelector).on("change", function() {
      var that = $(this);

      if(undisableValue) {
        //We has undisable value which mean target 
        //trigger is a selectbox
        var isMatch = that.val() == undisableValue;
        self.prop("disabled", !isMatch);

        return;
      }

      //Code reach this part mean target is 
      // a checkbox or radio, easy done!
      self.prop("disabled", !that.is(":checked"));
    });
  });
})(jQuery);


/* --------------------------------------------------------------------- */
/* .auto handle image upload
/* --------------------------------------------------------------------- */
(function($) {
  var readUrl = function(input, img) {

    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
        img.attr('src', e.target.result);
      }

      reader.readAsDataURL(input.files[0]);
    }
  };

  var handle = function(index, el) {
    var $this = $(this);
    var pickBtn = $this.find('.pick-btn');
    var realFilePicker = $this.find('.real-input');
    var imgPreview = $this.find('.img-preview');

    var deleteBtn = $this.find('.delete-btn');
    var defaultImg = $this.attr("data-default-image");
    var informDeleted = $this.find(".inform-deleted");

    pickBtn.click(function() {
      realFilePicker.trigger('click');
    });

    realFilePicker.change(function() {
      readUrl(realFilePicker.get(0), imgPreview);
      informDeleted.prop("checked", false);
    });

    if (deleteBtn) {
      deleteBtn.click(function(event) {
        realFilePicker.val('');
        if (defaultImg) {
          imgPreview.attr('src', defaultImg);
        } else {
          imgPreview.attr('src', '');
        }

        informDeleted.prop("checked", true);
      });
    }
  }

  if ($('.trams-input-group-file').length) {
    $('.trams-input-group-file').each(handle);
  }

})(jQuery);



/* --------------------------------------------------------------------- */
/* confirm
/* --------------------------------------------------------------------- */
(function($) {
  var current = null;

  var nc = window.tramsNC = window.tramsNC || {};

  nc.confirm = function() {
    current.data("confirmed", true);
    current.trigger("click");
  };

  $(document).on('click', '.trams-need-confirm', function(e) {
    var self = $(this);
    var confirmed = self.data("confirmed");

    if (confirmed) return true;

    var popupId = self.attr("data-trams-confirm-popup");
    current = self;

    $(popupId).modal("show");

    return false;
  });
})(jQuery);



/* --------------------------------------------------------------------- */
/* Popup
/* --------------------------------------------------------------------- */
(function($) {
  var current;

  window.trams.popup = {
    open: function(selector) {
      current = $(selector);
      current.removeClass("hidden");
    },

    close: function() {
      current.addClass("hidden");
    }
  }
})(jQuery);

//===============================
// HIDDEN INPUT FILE
//===============================
(function($) {
  var attrName = "tr-file";
  var inputs = $("[" + attrName + "]");

  if(!inputs.length) return;

  inputs.each(function() {
    var $this = $(this);
    var data = $.parseJSON( $this.attr(attrName) );
    var $displayer = $(data.display);

    $(data.trigger).on("click", function() {
      $this.trigger("click");
    });

    $this.on("change", function() {
      var filename = $this.val().split('\\').pop();
      $displayer.text(filename);
    });
  });

})(jQuery);