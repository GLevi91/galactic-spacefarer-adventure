sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.aldi.assignment.adventure.ui.spacefareradventureui',
            componentId: 'GalacticSpacefarerObjectPage',
            contextPath: '/GalacticSpacefarer'
        },
        CustomPageDefinitions
    );
});