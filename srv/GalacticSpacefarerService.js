const cds = require("@sap/cds")
const { setTestDestination } = require("@sap-cloud-sdk/test-util");
const {sendMail} = require("@sap-cloud-sdk/mail-client")
const nodemailer = require("nodemailer")

nodemailer.createTestAccount((err, account) => {
    setTestDestination({
        name: "MOCK_MAIL_DESTINATION",
        type: "MAIL",
        originalProperties: {
            "mail.user": account.user,
            "mail.password": account.pass,
            "mail.smtp.host": account.smtp.host,
            "mail.smtp.port": account.smtp.port,
            "mail.smtp.auth": true,
            "mail.smtp.ssl.enable": false,
            "mail.smtp.starttls.required": true
        }
    })
})

module.exports = cds.service.impl(function () {
    this.before('CREATE', 'GalacticSpacefarer', async (req) => {
        req.data.originPlanet = req.user.attr.planet;

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

    this.after('CREATE', 'GalacticSpacefarer', async (res, req) => {
        const mailConfig = {
            from: "spacefarer.adventure@aldi.com",
            to: req.user.attr.email,
            subject: "Congrats!",
            text: "Congratulations for starting your adventurous journey among the stars!"
        }
        const mailResponse = await sendMail({ destinationName: 'MOCK_MAIL_DESTINATION' }, [mailConfig]);
        console.log('Message sent: %s', mailResponse[0].messageId);
        console.log('Preview URL: %s', nodemailer.getTestMessageUrl(mailResponse[0]));
    })
})