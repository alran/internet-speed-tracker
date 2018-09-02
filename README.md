# Internet Speed Tracking Script

Use this script to track internet speed and keep a log of internet speeds in a google sheets worksheet.

## How to use

#### Set up Google Drive permissions

1. Visit the [Google APIs Console](https://console.developers.google.com/)
2. Create a new project
3. Enable Google Drive API
4. Create credentials for the web server to access application data
5. Name the service account and give it an editor role
6. A JSON file will automatically download to your computer
7. Copy this file to this directory and rename it `client_secret.json`

#### Set up Google Drive file

1. Visit Google Drive
2. Create a Google sheets file called "Speed Test"
3. In the `client_secret.json`, get the `client_email`. Invite this email address to be an editor on the file

#### Run the script

1. Run `bundle install`
2. Run `bundle exec ruby internet_speed_tracker.rb`
