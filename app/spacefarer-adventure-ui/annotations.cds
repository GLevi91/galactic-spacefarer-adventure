using GalacticSpacefarerService as service from '../../srv/GalacticSpacefarerService';

annotate service.GalacticSpacefarer with @(
    odata.draft.enabled,
    UI.HeaderInfo : {
        TypeName : 'Spacefarer',
        TypeNamePlural : 'Spacefarers',
        Title : {
            $Type : 'UI.DataField',
            Value : user,
        },
    },
);

annotate service.GalacticSpacefarer with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : user,
            Label : '{i18n>Name}',
        },
        {
            $Type : 'UI.DataField',
            Value : department.ID,
            Label : '{i18n>Department}',
        },
        {
            $Type : 'UI.DataField',
            Value : position.ID,
            Label : '{i18n>Position}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Originplanet}',
            Value : originPlanet,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Wormholenavigationskill}',
            Value : wormholeNavigationSkill_code,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Stardustcollection}',
            Value : stardustCollection_code,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Spacesuitcolor}',
            Value : spacesuitColor_code,
        },
    ],
    UI.SelectionFields : [
        originPlanet,
        department_ID,
        position_ID,
    ],
);
annotate service.GalacticSpacefarer with {
    stardustCollection @(
        Common.Text : {
            $value : stardustCollection.name,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueListWithFixedValues : true,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CollectionSize',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : stardustCollection_code,
                    ValueListProperty : 'code',
                },
            ],
            PresentationVariantQualifier : 'vh_GalacticSpacefarer_stardustCollection',
        },
    )
};
annotate service.GalacticSpacefarer with {
    wormholeNavigationSkill @(
        Common.Text : {
            $value : wormholeNavigationSkill.name,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueListWithFixedValues : true,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Rating',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : wormholeNavigationSkill_code,
                    ValueListProperty : 'code',
                },
            ],
            PresentationVariantQualifier : 'vh_GalacticSpacefarer_wormholeNavigationSkill',
        },
    )
};

annotate service.GalacticSpacefarer with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : department_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : position_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Originplanet}',
                Value : originPlanet,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Wormholenavigationskill}',
                Value : wormholeNavigationSkill_code,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Stardustcollection}',
                Value : stardustCollection_code,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Spacesuitcolor}',
                Value : spacesuitColor_code,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
annotate service.GalacticSpacefarer with {
    originPlanet @Common.Label : '{i18n>Originplanet}'
};

annotate service.GalacticSpacefarer with {
    department @(
        Common.Label : '{i18n>Department}',
        Common.Text : {
            $value : department.name,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'IntergalacticDepartment',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : department_ID,
                    ValueListProperty : 'ID',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.GalacticSpacefarer with {
    position @(
        Common.Label : '{i18n>Position}',
        Common.Text : {
            $value : position.name,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'IntergalacticPosition',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : position_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterInOut',
                    ValueListProperty : 'department/ID',
                    LocalDataProperty : department_ID,
                }
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.IntergalacticPosition with {
    ID @Common.Text : {
        $value : name,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.IntergalacticDepartment with {
    ID @Common.Text : {
        $value : name,
        ![@UI.TextArrangement] : #TextOnly
    }
};

annotate service.Rating with {
    code @Common.Text : {
        $value : name,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.CollectionSize with {
    code @Common.Text : {
        $value : name,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.GalacticSpacefarer with {
    spacesuitColor @(
        Common.Text : {
            $value : spacesuitColor.name,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueListWithFixedValues : true,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Color',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : spacesuitColor_code,
                    ValueListProperty : 'code',
                },
            ],
            PresentationVariantQualifier : 'vh_GalacticSpacefarer_spacesuitColor',
        },
    )
};

annotate service.Color with {
    code @Common.Text : {
        $value : name,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Rating with @(
    UI.PresentationVariant #vh_GalacticSpacefarer_wormholeNavigationSkill : {
        $Type : 'UI.PresentationVariantType',
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : code,
                Descending : false,
            },
        ],
    }
);

annotate service.CollectionSize with @(
    UI.PresentationVariant #vh_GalacticSpacefarer_stardustCollection : {
        $Type : 'UI.PresentationVariantType',
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : code,
                Descending : false,
            },
        ],
    }
);

annotate service.Color with @(
    UI.PresentationVariant #vh_GalacticSpacefarer_spacesuitColor : {
        $Type : 'UI.PresentationVariantType',
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : code,
                Descending : false,
            },
        ],
    }
);

