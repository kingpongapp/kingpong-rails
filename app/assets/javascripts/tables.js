var $rankings = $('.rankings');
var $newTableRow = $('<tr>');
var $newTableHeader = $('<th>').attr('scope', 'row');
var $newTableData = $('<td>');
var $newImageElem = $('<img>');
var players = Player.all; //Need to point to players table/instance variable


// Loops through players table and creates DOM elements for 10 ten ranked players
players.forEach(function(player){
  var playerRank = 1;
  $newTableRow.append($newTableHeader);
  $newTableRow.append($newTableData);
  $newTableRow.append($newImageElem);
  $newTableHeader.text(playerRank);
  $newTableData.text(player.nickname);
  $newImageElem.attr('src', player.image_url);
  $rankings.append($newTableRow);
  playerRank++;
});


games.forEach(function(game){


});
