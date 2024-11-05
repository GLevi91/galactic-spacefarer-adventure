sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.aldi.assignment.adventure.ui.spacefareradventureui',
            componentId: 'GalacticSpacefarerList',
            contextPath: '/GalacticSpacefarer'
        },
        CustomPageDefinitions
    );
});