require 'google_drive'
require 'speedtest'

internet_name = ARGV[0]
notes = ARGV[1]

if !internet_name
  puts 'What is the name of the internet?'
  internet_name = gets.chomp
end

if !notes
  puts 'Do you have any notes about this internet? i.e. does it seem fast? good for video calls?'
  notes = gets.chomp
end

speedtest = Speedtest::Test.new(
  download_runs: 4,
  upload_runs: 4,
  ping_runs: 4,
  download_sizes: [750, 1500],
  upload_sizes: [10000, 400000],
  debug: true
 )
results = speedtest.run

session = GoogleDrive::Session.from_service_account_key('client_secret.json')
spreadsheet = session.spreadsheet_by_title('Speed Test')
worksheet = spreadsheet.worksheets.first

row = [
  Time.now.strftime("%d/%m/%Y"), # Current date
  Time.now.strftime("%H:%M"),    # Current time
  results.latency,               # Latency
  results.pretty_download_rate,  # Download rate
  results.pretty_upload_rate,    # Upload rate
  internet_name,                 # Internet name
  notes,                         # Other comments
]

worksheet.insert_rows(worksheet.num_rows + 1, [row])
worksheet.save
