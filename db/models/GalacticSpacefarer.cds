namespace com.aldi.assignment.adventure;

using { cuid, sap.common.CodeList, User } from '@sap/cds/common';

entity GalacticSpacefarer : cuid {
    user                    : User @cds.on.insert : $user;
    stardustCollection      : Association to one CollectionSize;
    wormholeNavigationSkill : Association to one Rating;
    originPlanet            : String @cds.on.insert : $user.planet;
    spacesuitColor          : Association to one Color;
    department              : Association to one IntergalacticDepartment;
    position                : Association to one IntergalacticPosition;
}

annotate GalacticSpacefarer with @(restrict: [
    { grant: '*', where: 'originPlanet = $user.planet' } ]);

entity IntergalacticDepartment : cuid {
    name  : String;
    positions : Composition of many IntergalacticPosition on positions.department = $self;
}

entity IntergalacticPosition : cuid {
    name       : String;
    department : Association to one IntergalacticDepartment;
}

@cds.autoExpose
@readonly
entity Rating : CodeList {
    key code : Integer enum {
        Expert   = 5;
        Advanced = 4;
        Mediocre = 3;
        Novice   = 2;
        Beginner = 1;
    }
}

@cds.autoExpose
@readonly
entity CollectionSize : CodeList {
    key code : Integer enum {
        Enormous = 5;
        Huge     = 4;
        Average  = 3;
        Small    = 2;
        Tiny     = 1;
    }
}

@cds.autoExpose
@readonly
entity Color : CodeList{ 
    key code : String enum {
        Black;
        Blue;
        Brown;
        Gray;
        Green;
        Orange;
        Pink;
        Purple;
        Rainbow;
        Red;
        White;
        Yellow;
    }
}