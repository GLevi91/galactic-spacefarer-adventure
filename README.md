# Galactic Spacefarer Adventure

This is a SAP CAP based project, where adventurous spacefarers register themselves for a wonderful intergalactic journey! Additionally, they can also check their fellow spacefarers, how well prepared they are for this mission.

## Application Overview
The application is structured into a List Report, where spacefarers are listed. Creation, search and filtering are all supported. Clicking on one of them (or creating a new one) will navigate to an Object Page, where details can be checked and modified if needed.

## User Authentication
Mock users are defined with basic authentication in [package.json](package.json). Additional attributes are also added to them, to support required functionalities.

## Sending Emails
Sending of notification emails for created spacefarers are mocked. To adhere SAP guidelines, mails are sent through a mocked mail __Destination__ where the SMTP properties are provided by the [Ethereal Email](https://ethereal.email/) (a fake SMTP service), through the __nodemailer__ module.