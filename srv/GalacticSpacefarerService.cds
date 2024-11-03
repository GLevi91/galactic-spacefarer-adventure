using com.aldi.assignment.adventure as adventure from '../db/models';

service GalacticSpacefarerService @(requires: 'authenticated-user') {
    entity GalacticSpacefarer as projection on adventure.GalacticSpacefarer;
}
