sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/aldi/assignment/adventure/ui/spacefareradventureui/test/integration/FirstJourney',
		'com/aldi/assignment/adventure/ui/spacefareradventureui/test/integration/pages/GalacticSpacefarerList',
		'com/aldi/assignment/adventure/ui/spacefareradventureui/test/integration/pages/GalacticSpacefarerObjectPage'
    ],
    function(JourneyRunner, opaJourney, GalacticSpacefarerList, GalacticSpacefarerObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/aldi/assignment/adventure/ui/spacefareradventureui') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheGalacticSpacefarerList: GalacticSpacefarerList,
					onTheGalacticSpacefarerObjectPage: GalacticSpacefarerObjectPage
                }
            },
            opaJourney.run
        );
    }
);