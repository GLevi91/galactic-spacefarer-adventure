namespace com.aldi.assignment.adventure;

using { cuid, User } from '@sap/cds/common';

entity GalacticSpacefarer : cuid {
    user                    : User @cds.on.insert : $user;
    startdustCollection     : CollectionSize;
    wormholeNavigationSkill : Rating;
    originPlanet            : String;
    spacesuitColor          : Color;
    department              : Association to one IntergalacticDepartments;
    position                : Association to one IntergalacticPositions;
}

annotate GalacticSpacefarer with @(restrict: [
    { grant: 'READ', where: 'originPlanet = $user.planet' },
    { grant: ['UPDATE', 'DELETE'], where: 'user = $user' } ]);

entity IntergalacticDepartments : cuid{
    name    : String @cds.on.insert : $user.department;
    positions   : Composition of many IntergalacticPositions on positions.department = $self;
}

entity IntergalacticPositions : cuid {
    name   : String @cds.on.insert : $user.position;
    department : Association to IntergalacticDepartments;
}

type Rating: Integer enum {
    Expert   = 5;
    Advanced = 4;
    Mediocre = 3;
    Novice   = 2;
    Beginner = 1;
}

type CollectionSize: Integer enum {
    Enormous = 5;
    Huge     = 4;
    Average  = 3;
    Small    = 2;
    Tiny     = 1;
}

type Color: String enum {
    Black;
    Blue;
    Brown;
    Green;
    Orange;
    Pink;
    Purple;
    Rainbow;
    Red;
    White;
    Yellow;
}