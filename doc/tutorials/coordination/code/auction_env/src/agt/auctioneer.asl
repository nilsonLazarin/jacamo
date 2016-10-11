+!start(Id,P) 
   <- makeArtifact(Id, "auction_env.AuctionArtifact", [], ArtId);
      .print("Auction artifact created for ",P);
      Id::focus(ArtId);  // place observable properties of this auction in a particular name space
      .broadcast(achieve,focus(Id));  // ask all others to focus on this new artifact
      Id::start(P);
      .at("now + 5 seconds", {+!decide(Id)}).
      
+!decide(Id)
   <- stop[artifact_name(Id)].
   
+NS::winner(W)[artifact_id(AId)] : W \== no_winner
   <- ?NS::task(S);
      ?NS::best_bid(V);
      .print("Winner for ", S, " is ",W," with ", V).         

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }
