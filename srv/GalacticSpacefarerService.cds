using com.aldi.assignment.adventure as adventure from '../db/models';

service GalacticSpacefarerService @(requires: 'authenticated-user') {
    entity GalacticSpacefarer as projection on adventure.GalacticSpacefarer;
    entity IntergalacticDepartment as projection on adventure.IntergalacticDepartment;
    entity IntergalacticPosition as projection on adventure.IntergalacticPosition;
    entity Rating as projection on adventure.Rating;
    entity CollectionSize as projection on adventure.CollectionSize;
    entity Color as projection on adventure.Color;
}
