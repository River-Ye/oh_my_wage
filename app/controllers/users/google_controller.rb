require 'google/apis/sheets_v4'
require 'googleauth'

class GoogleSheetCrawler
  def self.get_sheet_array_from_google_sheet(options = {})
    service = Google::Apis::SheetsV4::SheetsService.new
    service.authorization = get_google_auth
    service.get_spreadsheet_values(
      "a_sheet_id_you_can_fine_on_google_sheet_url",
      "SHEETNAME!A2:M2000"
    ).values
  end
end  