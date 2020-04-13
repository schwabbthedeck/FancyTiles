'use strict';

ExecuteOrDelayUntilScriptLoaded(renderWebPart, "sp.js");

// decode URL
var hostWebUrl = decodeURIComponent(getQueryStringParameter("SPHostUrl"));
var appWebUrl = decodeURIComponent(getQueryStringParameter("SPAppWebUrl"));
var groupKeyword = decodeURIComponent(getQueryStringParameter("FancyTilesGroupKeyword"));

function getQueryStringParameter(paramToRetrieve) {
  var params = document.URL.split("?")[1].split("&");
  for (var i = 0; i < params.length; i = i + 1) {
    var singleParam = params[i].split("=");
    if (singleParam[0] == paramToRetrieve) {
      return singleParam[1];
    }
  }
}

function renderWebPart() {
  $(document).ready(function () {
    getListItems();
  });

  // function to retrieve the list items with the matching group keyword
  function getListItems() {
    var executor = new SP.RequestExecutor(appWebUrl);
    var url = appWebUrl + "/_api/web/lists/getbytitle('Fancy Tiles List')/items?filter=GroupKeyword eq '" + groupKeyword + "'$select=Title,GroupKeyword,ImageLink,TileClickLink,TitleColor,TitleColorBackground,HoverText,HoverTextDirection,HoverTextColor,HoverColorBackground,TileOrder&$orderby=TileOrder&$top=1000";
    executor.executeAsync({
      url: url,
      method: "GET",
      headers: { "Accept": "application/json; odata=verbose" },
      success: successGetListItems,
      error: error
    });

    function successGetListItems(data, textStatus, jqXHR) {
      var body = JSON.parse(data.body);
      renderTiles(body.d.results);
    }

    function renderTiles(listItems) {
      var html = '';
      for (var i = 0; i < listItems.length; i++) {
        var item = listItems[i];
        if (item.GroupKeyword == groupKeyword) {
          var onclickBehavior = item.TileClickLink == null ? "" : " style=\"cursor: pointer;\" onclick=\"window.open('" + item.TileClickLink.Url + "','_blank');\"";

          var hoverCard = item.HoverText == null || item.HoverText == "" ? "" : '<div class="hover-card text-' + item.HoverTextColor + ' background-' + item.HoverColorBackground + '">' + item.HoverText + '</div>';

          html += '' +
            '<div class="tile hover ' + item.HoverTextDirection.toLowerCase() + '" ' + onclickBehavior + '>' +
            '<div class="tile-title ' + item.TitleColorBackground.toLowerCase() + '">' +
            '<div class="' + item.TitleColor.toLowerCase() + '">' + item.Title + '</div>' +
            '</div>' +
            '<div class="tile-image">' +
            '<div class="background-image-tile" style="background-image: url(' + item.ImageLink.Url + ');"></div>' +
            '</div>' +
            hoverCard +
            '</div>';
        }
      }
      $('#fancy-tiles').append(html);
    }
  }

  function error(sender, args) {
    console.log('error' + " " + sender + " " + args);
  }
}

