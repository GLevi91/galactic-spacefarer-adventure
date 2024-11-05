const cds = require('@sap/cds')

module.exports = cds.service.impl(function () {
    this.before('CREATE', 'GalacticSpacefarer', async (req) => {
        let user = req.user
        const userResult = await SELECT('Count(user) as count').from('GalacticSpacefarerService.GalacticSpacefarer').where({user: user.id})

        if (userResult[0].count > 0) {
            throw new Error("User already exists!")
        }

        let stardustCollectionCode = req.data.stardustCollection_code
        let wormholeNavigationSkillCode = req.data.wormholeNavigationSkill_code

        if (!(stardustCollectionCode < 1 || stardustCollectionCode > 5)) {
            if (stardustCollectionCode < 5) {
                stardustCollectionCode += 1
                console.log("Stardust collection size enchanced!")
            }
        } else {
            return req.error(400, "Invalid stardust collection size selected!")
        }

        if (!(wormholeNavigationSkillCode < 1 || wormholeNavigationSkillCode > 5)) {
            if (wormholeNavigationSkillCode < 5) {
                wormholeNavigationSkillCode += 1
                console.log("Wormhole navigation skill enchanced!")
            }
        } else {
            return req.error(400, "Invalid wormhole navigation skill selected!")
        }
    })
})